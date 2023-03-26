#include "parse_utility.cpp"

namespace{
    class CFG{
    private:
        GRAPH graph;
        BB_MAP basicBlockMap;
        string rootBlock;
    public:
        CFG(){}
        CFG(GRAPH &g, BB_MAP &bb_map, string root){
            graph = g;
            basicBlockMap = bb_map;
            rootBlock = root;
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
            G[parent].push_back(child);
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
}
