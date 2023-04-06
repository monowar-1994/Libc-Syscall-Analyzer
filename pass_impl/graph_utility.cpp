#include "parse_utility.cpp"

namespace{
    enum State
    {
        WHITE,
        GRAY,
        BLACK
    };

    set<string> syscallWrapperFunctions({"__syscall_cp", "__syscall", "__syscall1", "__syscall2","__syscall3", "__syscall4", "__syscall5","__syscall6", "__syscall7"});

    class CFG{
    private:
        GRAPH graph; // This one is the core cfg (with the backedges)
        BB_MAP basicBlockMap;
        string rootBlock;
        bool hasLoops;
        GRAPH dag; // This one contains the back-edge less adj list
        map<string, int> visited;
        vector<string> loopingBlocks;
        map<string, EDGE> backEdges;
        vector<PATH> canonicalPaths; //Holds the canonical paths. Incase of monolithic, this is is the pathholder.
        map<string, vector<PATH>> loopingPaths;
        set<string> loopAwareVisited;
        bool hasBeenProcessed;
        vector<PATH> loopExtractedPaths;
        vector<PATH> instantiatedPaths;

        bool loopDfsUtil(GRAPH cfgAdjList, string node)
        {
            visited[node] = GRAY;
            vector<string> children = cfgAdjList[node];
            bool res = false;
            for (string child : children)
            {
                if (visited[child] == GRAY)
                {
                    // errs()<< "Found a loop: "<<node<<" "<<child<<"\n";
                    loopingBlocks.push_back(child);
                    backEdges[node] = make_pair(node, child);
                    res = true;
                }
                if (visited[child] == WHITE && loopDfsUtil(cfgAdjList, child))
                {
                    res = true;
                }
            }
            visited[node] = BLACK;
            return res;
        }

        bool containsLoop(GRAPH cfgAdjList, string root)
        {
            bool hasLoop = false;
            for (auto key : cfgAdjList)
            {
                visited[key.first] = WHITE;
            }

            hasLoop = loopDfsUtil(cfgAdjList, root);

            return hasLoop;
        }

        void monolithicTraverse(GRAPH cfgAdjList, string node, PATH currentPath)
        {
            currentPath.push_back(node);
            vector<string> children = cfgAdjList[node];
            if (children.empty())
            {
                // This is a leaf node.
                canonicalPaths.push_back(currentPath);
            }
            else
            {
                for (string child : children)
                {
                    PATH currPathClone(currentPath);
                    monolithicTraverse(cfgAdjList, child, currPathClone);
                }
            }
        }

        void loopAwareTraverse(GRAPH cfgAdjList, BB_MAP &bb_map , string node, PATH currentPath)
        {
            // Check if it is a looping node and have been called already
            if (find(loopingBlocks.begin(), loopingBlocks.end(), node) != loopingBlocks.end())
            {
                if (find(loopAwareVisited.begin(), loopAwareVisited.end(), node) != loopAwareVisited.end())
                {
                    return;
                }
            }

            currentPath.push_back(node);
            BasicBlock *currBlock = bb_map[node];
            if (!loopingBlocks.empty() && find(loopingBlocks.begin(), loopingBlocks.end(), node) != loopingBlocks.end())
            {
                Instruction *terminator = currBlock->getTerminator();
                if(terminator != NULL && isa<BranchInst>(terminator)){
                    BranchInst *brInst = dyn_cast<BranchInst>(terminator);
                    if (brInst->isConditional())
                    {
                        // Loop and Conditional. So either For loop or While Loop.
                        string falseNode = getStringRepresentationOfValue(brInst->getSuccessor(1));
                        PATH clonedCurrentPath(currentPath);
                        loopAwareVisited.insert(node);
                        loopAwareTraverse(cfgAdjList, bb_map, falseNode, clonedCurrentPath);
                    }
                    else
                    {
                        // Loop and Unconditional. So do-while loop.
                        string nextNode = getStringRepresentationOfValue(brInst->getSuccessor(0));
                        loopAwareVisited.insert(node);
                        PATH clonedCurrentPath(currentPath);
                        loopAwareTraverse(cfgAdjList, bb_map, nextNode, clonedCurrentPath);
                    }
                }
                else if(terminator!= NULL && isa<SwitchInst>(terminator)){
                    SwitchInst *switchInst = dyn_cast<SwitchInst>(terminator);
                    // errs()<<"Inside a looping block and it is a switch instruction.\n";
                    

                }
                
            }
            else
            {
                // Not a conditional block. Straight to next children block
                vector<string> children = cfgAdjList[node];
                loopAwareVisited.insert(node);
                if (children.empty())
                {
                    // Reached a leaf node. This is a complete path.
                    canonicalPaths.push_back(currentPath);
                }
                else
                {
                    for (string child : children)
                    {
                        // Clone the existing path and pass it along for the next layer.
                        PATH currentPathClone(currentPath);
                        loopAwareTraverse(cfgAdjList, bb_map, child, currentPathClone);
                    }
                }
            }
        }

        GRAPH extractDirectedAdjList(GRAPH cfgAdjList, map<string, EDGE> bEdges)
        {
            //errs()<<"Extracting directed adjList.\n";
            map<string, vector<string>> directedAcgf;

            for (auto &elem : cfgAdjList)
            {
                if (bEdges.find(elem.first) != bEdges.end())
                {
                    vector<string> clonedAdjList(elem.second);
                    pair<string, string> edge = bEdges[elem.first];
                    for (vector<string>::iterator it = clonedAdjList.begin(); it != clonedAdjList.end(); ++it)
                    {
                        if (*it == edge.second)
                        {
                            clonedAdjList.erase(it);
                            break;
                        }
                    }
                    directedAcgf[elem.first] = clonedAdjList;
                }
                else
                {
                    vector<string> clonedAdjList(elem.second);
                    directedAcgf[elem.first] = clonedAdjList;
                }
            }
            // errs()<<"Done Extracting.\n";
            return directedAcgf;
        }

        void dagDfsUtil(GRAPH dagGraph, string anchor, string src, string dst, PATH currentPath, bool debug = false)
        {
            //errs()<<"Called Dag DFS Util for node: "<<src<<" \n";
            if(debug){
                errs()<<"dagDfsUtil Called for: "<<src<<" "<<dst<<"\n";
            }
            currentPath.push_back(src);
            if (src == dst)
            {
                // Enter this in the loops possible execution path.
                if (loopingPaths.find(anchor) == loopingPaths.end())
                {
                    vector<PATH> tempPaths;
                    
                    tempPaths.push_back(currentPath);
                    loopingPaths[anchor] = tempPaths;
                }
                else
                {
                    loopingPaths[anchor].push_back(currentPath);
                }
                // if(debug){
                //     errs()<<"Pushed Back: ";
                //     printPath(currentPath);
                //     errs()<<"\n";
                // }
                return;
            }

            EDGE_LIST edge_list = dagGraph[src];
            for (string child : edge_list)
            {
                PATH clonedCurrentPath(currentPath);
                dagDfsUtil(dagGraph, anchor, child, dst, clonedCurrentPath, debug);
            }
            // errs()<<"Exiting DAG DFS UTIL.\n";
        }

        void extractLoopingPaths(GRAPH dagGraph)
        {
            for (auto &elem : backEdges)
            {
                EDGE edge = elem.second;
                // errs()<<"Trying to Extract The looping Path for: "<<edge.first<<" "<<edge.second<<"\n";
                PATH curr;
                dagDfsUtil(dagGraph, edge.second, edge.second, edge.first, curr);
            }
        }

        void performLoopAnalysis(){
            //errs()<<"Performing Loop Analysis.\n";
            bool gotLoop = containsLoop(graph, rootBlock);
            // errs()<<"Contains Loop: "<<gotLoop<<"\n";
            hasLoops = gotLoop;
            PATH initialEmptyPath;
            if(gotLoop){
                // Get the canonical paths
                // errs()<< "Initiating Loop aware Traverse.\n";
                loopAwareTraverse(graph, basicBlockMap, rootBlock, initialEmptyPath);  
                //errs() << "Exiting loop aware Traverse.\n";  
            }
            else{
                // Get the monolithic paths
                monolithicTraverse(graph, rootBlock, initialEmptyPath);
            }

            // printPaths(canonicalPaths);
        }

        vector<PATH> expandPath(PATH p)
        {

            vector<PATH> expandedPaths;
            PATH initializer;
            expandedPaths.push_back(initializer);
            // errs()<<"Called ExpandPath for: ";
            // printPath(p);
            // errs()<<"\n";
            for (string n : p)
            {
                if (find(loopingBlocks.begin(), loopingBlocks.end(), n) == loopingBlocks.end())
                {
                    // Not a looping block.
                    // errs()<<"Not a looping block: "<<n<<"\n";
                    for (PATH &tempPath : expandedPaths)
                    {
                        // errs()<<"Pushing back "<<n<<"\n";
                        tempPath.push_back(n);
                        // printPath(tempPath);
                    }
                    // printPaths(expandedPaths);
                }
                else if (n != "LOOP_START" && n != "LOOP_END")
                {
                    // errs()<<"Looping Block."<<n<<"\n";
                    for (PATH &tempPath : expandedPaths)
                    {
                        tempPath.push_back("LOOP_START");
                        tempPath.push_back(n);
                        // printPath(tempPath);
                    }

                    vector<PATH> candidatePaths = loopingPaths[n];
                    vector<PATH> innerExpandedPaths;
                    for (PATH &cPath : candidatePaths)
                    {
                        PATH temp(cPath);
                        temp.erase(temp.begin());
                        if (temp.empty())
                        {
                            continue;
                        }
                        vector<PATH> tempInnerPaths = expandPath(temp);
                        innerExpandedPaths.insert(innerExpandedPaths.end(), tempInnerPaths.begin(), tempInnerPaths.end());
                        // append every path in innerexapndedpaths (n) to every path in the current expanded paths (m).
                        // So the new expanded paths will have m*n paths
                    }
                    vector<PATH> tempHolder;
                    for (PATH &tempPath : expandedPaths)
                    {
                        for (PATH &x : innerExpandedPaths)
                        {
                            PATH clonedTempPath(tempPath);
                            clonedTempPath.insert(clonedTempPath.end(), x.begin(), x.end());
                            tempHolder.push_back(clonedTempPath);
                        }
                    }

                    expandedPaths.clear();
                    for (PATH &x : tempHolder)
                    {
                        expandedPaths.push_back(x);
                    }

                    for (PATH &tempPath : expandedPaths)
                    {
                        tempPath.push_back("LOOP_END");
                    }
                }
            }
            return expandedPaths;
        }

        void generatePathsFromCanonicalPaths()
        {
            for (PATH p : canonicalPaths)
            {

                vector<PATH> extractedPaths = expandPath(p);
                loopExtractedPaths.insert(loopExtractedPaths.end(), extractedPaths.begin(), extractedPaths.end());
            }
            // errs() << "Number of loop extracted paths: " << loopExtractedPaths.size() << "\n";
        }

        bool hasBlockInPath(PATH p, BasicBlock *block){
            string blockName = getSimpleNodeLabel(block);
            return false;
        }
    public:
        CFG(){hasLoops = false; hasBeenProcessed = false;}
        CFG(GRAPH &g, BB_MAP &bb_map, string root){
            graph = g;
            basicBlockMap = bb_map;
            rootBlock = root;
            hasLoops = false;
            hasBeenProcessed = false;
        }

        bool containsLoops(){
            return hasLoops;
        }

        GRAPH &getDag(){
            return dag;
        }
        
        GRAPH &getGraph(){
            return graph;
        }

        BB_MAP &getBlocks(){
            return basicBlockMap;    
        }

        string getRoot(){
            return rootBlock;
        }

        void setGraph(GRAPH &g){
            graph = g;
        }

        void setBlocks(BB_MAP &bb_map){
            basicBlockMap = bb_map;
        }

        void setRoot(string r){
            rootBlock = r;
        }

        void printDetails(){
            errs()<<" CFG root block is: "<<rootBlock<<"\n\n";
            errs()<< "Printing the adjacency List:\n\n";
            printAdjacencyList(graph);
            errs()<<"\n\nPrinting the Basic Blocks:\n\n";
            printBB_MAP(basicBlockMap);
        }

        
        void process(){
            if(hasBeenProcessed){ // Thsi prevents accidental data corruption in the data structures of the class.
                return;
            }
            // printAdjacencyList(graph);
            // errs()<<"Backedges\n";
            
            performLoopAnalysis(); // After this Canonical Path Vector, Looping Blocks and BackEdges is populated.

            // printBackEdges(backEdges);
            // printLoopingBlocks(loopingBlocks);

            if(hasLoops){
                
                dag = extractDirectedAdjList(graph, backEdges);
                // printAdjacencyList(dag);
                extractLoopingPaths(dag);
                generatePathsFromCanonicalPaths();
            }
            else{
                loopExtractedPaths = canonicalPaths; // If no loops, then both are canonical paths.
                instantiatedPaths = canonicalPaths;
            }
            hasBeenProcessed = true;
        }
        
    };

    class DDG{
    private:
        DDG_GRAPH ddg;
        map<string, string> typeMap;
        vector<string> roots;
    public:
        DDG(){}
        void setDDG(DDG_GRAPH &ddg_graph){
            ddg = ddg_graph;
        }
        void setTypeMap(map<string, string> &tMap){
            typeMap = tMap;
        }
        void setRoots(vector<string> &allRoots){
            roots = allRoots;
        }
        void addRoot(string aRoot){
            roots.push_back(aRoot);
        }

        DDG_GRAPH &getDDG(){
            return ddg;
        }
        map<string, string> &getTypeMap(){
            return typeMap;
        }
        vector<string> &getRoots(){
            return roots;
        }

    };

    static void insert(GRAPH &G, string parent, string child){
        if(exists(G, parent)){
            if(!exists(G[parent], child)){
                G[parent].push_back(child);
            }
        }
        else{
            EDGE_LIST temp;
            temp.push_back(child);
            G[parent] = temp;
        }
    }

    static CFG buildCFG(Function &F){

        CFG cfg;
        GRAPH adjList;
        BB_MAP basicBlockMap;
    
        for(BasicBlock &BB: F){
            string nodeLabel =  getSimpleNodeLabel(BB);
            basicBlockMap[nodeLabel] = &BB;
            if(BB.hasNPredecessors(1)){
                BasicBlock *predecessor = BB.getUniquePredecessor();
                string predecessorName = getSimpleNodeLabel(predecessor);
                insert(adjList, predecessorName , nodeLabel);
            }
            else if(BB.hasNPredecessorsOrMore(2)){
                for(BasicBlock *predecessor : predecessors(&BB)){
                    string currentPredecessorName = getSimpleNodeLabel(predecessor);
                    insert(adjList, currentPredecessorName, nodeLabel);
                }
            }
            else{
                cfg.setRoot(nodeLabel);
            }
        }
        cfg.setGraph(adjList);
        cfg.setBlocks(basicBlockMap);
        return cfg;
    }

    static DDG buildDDG(Function &F){
        DDG ddg;
        
        for(auto it = F.arg_begin(); it != F.arg_end(); ++it){
            Value *arg = dyn_cast<Value>(it);            
            string argumentName = getStringRepresentationOfValue(arg);
            string argumentType = getTypeFromAddress(arg->getType());
            (ddg.getTypeMap())[argumentName] = argumentType;
            EDGE_VECTOR temp;
            (ddg.getDDG())[argumentName] = temp;
        }

        for(BasicBlock &BB: F){
            for(Instruction &I: BB){
                parseInstructionForDDG(I, ddg.getDDG(), ddg.getTypeMap());
            }
        }

        return ddg;
    }

    static pair<bool, vector<int>> syscallFinder(Function &F){
        bool result = false;
        vector<int> syscalls;
        for(BasicBlock &BB: F){
            for(Instruction &I:BB){
                if(isa<CallInst>(&I)){
                    CallInst *call = dyn_cast<CallInst>(&I);
                    if(call->isInlineAsm()){
                        auto inlineAssemblyInfo = parseInlineAssemblyString(getInstructionString(&I), call);
                        vector<string> inlineAssemblyStrings = inlineAssemblyInfo.first;
                        vector<Value *> inlineAssemblyParams = inlineAssemblyInfo.second;
                        if(inlineAssemblyStrings.size()>0){
                            string asmCommand = inlineAssemblyStrings[0];
                            if(asmCommand == "syscall" || asmCommand == "Syscall" || asmCommand == "SYSCALL"){
                                // errs()<<"Found a syscall: ";
                                result |= true;
                                
                                Value *syscallNum = inlineAssemblyParams[0];
                                string tempNum = getStringRepresentationOfValue(syscallNum);
                                if(!all_of(tempNum.begin(), tempNum.end(), ::isdigit)){
                                    continue;
                                }
                                int syscallNumberInt = stoi(tempNum);
                                // errs()<<syscallNumberInt<<"\n";
                                syscalls.push_back(syscallNumberInt);
                            }
                        }
                    }
                    else{
                        // Turns out musl-libc has multiple other syscall option as well.
                        Function *calledFunction = call->getCalledFunction();
                        string functionName;
                        if(calledFunction != NULL){
                            functionName = calledFunction->getName().str();
                        }
                        else{
                            continue;
                        }
                        if(syscallWrapperFunctions.find(functionName) != syscallWrapperFunctions.end()){
                            // We have a syscall invocation by syscall_cp or some other function
                            // The first argument is the syscall number
                            // errs()<<"Found a sycall_cp variant.\n";
                            result |= true;
                            Value *syscallNum = call->getArgOperand(0);
                            string tempNum = getStringRepresentationOfValue(syscallNum);
                            if(!all_of(tempNum.begin(), tempNum.end(), ::isdigit)){
                                continue;
                            }
                            int syscallNumberInt = stoi(tempNum);
                            // errs()<<syscallNumberInt<<"\n";
                            syscalls.push_back(syscallNumberInt);
                        }
                    }
                }
            }
        }

        return make_pair(result, syscalls);
    }

    static bool containsSpecificSyscall(BasicBlock &basicBlock, int specificSyscallNumber){
        for(Instruction &inst: basicBlock){
            if(isa<CallInst>(inst)){
                CallInst *call = dyn_cast<CallInst>(&inst);
                if(call->isInlineAsm()){
                    auto inlineAssemblyInfo = parseInlineAssemblyString(getInstructionString(&inst), call);
                    vector<string> inlineAssemblyStrings = inlineAssemblyInfo.first;
                    vector<Value *> inlineAssemblyParams = inlineAssemblyInfo.second;
                    if(inlineAssemblyStrings.size()>0){
                        string asmCommand = inlineAssemblyStrings[0];
                        if(asmCommand == "syscall" || asmCommand == "Syscall" || asmCommand == "SYSCALL"){
                            
                            Value *syscallNum = inlineAssemblyParams[0];
                            string tempNum = getStringRepresentationOfValue(syscallNum);
                            if(!all_of(tempNum.begin(), tempNum.end(), ::isdigit)){
                                continue;
                            }
                            int syscallNumberInt = stoi(tempNum);
                            if(syscallNumberInt == specificSyscallNumber){
                                return true;
                            }
                        }
                    }
                }
                else{
                    // Turns out musl-libc has multiple other syscall option as well.
                    Function *calledFunction = call->getCalledFunction();
                    string functionName;
                    if(calledFunction != NULL){
                        functionName = calledFunction->getName().str();
                    }
                    else{
                        continue;
                    }
                    if(syscallWrapperFunctions.find(functionName) != syscallWrapperFunctions.end()){
                        // We have a syscall invocation by syscall_cp or some other function
                        // The first argument is the syscall number
                        Value *syscallNum = call->getArgOperand(0);
                        int syscallNumberInt = stoi(getStringRepresentationOfValue(syscallNum));
                        // errs()<<syscallNumberInt<<"\n";
                        if(syscallNumberInt == specificSyscallNumber){
                            return true;
                        }
                    }
                    else{
                        errs()<<functionName<<"\n";
                    }
                }
            }
        }

        return false;
    }

    static vector<BasicBlock *> getRelevantBasicBlocks(set<int> relevantSyscalls, Function &F){
        vector<BasicBlock *> result;
        for(BasicBlock &BB: F){
            for(auto &elem: relevantSyscalls){
                if(containsSpecificSyscall(BB, elem)){
                    result.push_back(&BB);
                }
            }
        }
        return result;
    }
}
