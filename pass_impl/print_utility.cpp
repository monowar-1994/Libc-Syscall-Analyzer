#include "utility.cpp"

static string getSimpleNodeLabel(const BasicBlock &Node)
{ // Copied from Stack Overflow
    if (!Node.getName().empty())
        return Node.getName().str();

    string Str;
    raw_string_ostream OS(Str);

    Node.printAsOperand(OS, false);
    return OS.str();
}

static string getSimpleNodeLabel(const BasicBlock *Node)
{ // Pointer Version
    if (!Node->getName().empty())
    {
        return Node->getName().str();
    }
    string Str;
    raw_string_ostream OS(Str);

    Node->printAsOperand(OS, false);
    return OS.str();
}

static void printAdjacencyList(GRAPH _adjacencyList)
{
    errs() << "Adjacency List Is:\n";
    for (auto key : _adjacencyList)
    {
        errs() << key.first << " -> ";
        for (auto elem : key.second)
        {
            errs() << elem << ", ";
        }
        errs() << "\n";
    }
}

static void printBasicBlock(BasicBlock *bb){
    bb->print(errs());
}

static void printBB_MAP(BB_MAP bb_map){
    for(auto key: bb_map){
        errs()<<"Basic Block: "<<key.first<<"\n\n";
        printBasicBlock(key.second);
    }
}

static string getStringRepresentationOfValue(Value *value)
{
    string s;
    raw_string_ostream OS(s);
    value->printAsOperand(OS, false);
    return OS.str();
}

static string getTypeFromAddress(Type *type)
{
    string s;
    raw_string_ostream OS(s);
    type->print(OS, false);
    return OS.str();
}

static string getInstructionString(Instruction *inst)
{
    string s;
    raw_string_ostream ss(s);
    ss << *inst;
    return ss.str();
}

static void parseInlineAssemblyString(string instructionString, CallInst *call)
{

    // errs() << "\n\n";
    regex pattern("\"([^\"]*)\"");
    sregex_iterator start(instructionString.begin(), instructionString.end(), pattern);
    sregex_iterator end;
    for (sregex_iterator current = start; current != end; ++current)
    {
        smatch match = *current;
        // errs() << match.str() << "\n";
    }
    // errs() << "Parsing complete.\n";

    assert(call != NULL);
    int numOperands = call->getNumOperands();
    for (int i = 0; i < numOperands - 1; i++)
    {
        Value *operand = call->getArgOperand(i);
        // operand->print(errs(), false);
        // errs() << "\n";
    }
}

static string getLeftHandSide(Instruction *inst)
{
    // Untested Functionality
    string Str;
    raw_string_ostream OS(Str);

    inst->print(OS, false);
    string instString = OS.str();
    size_t foundAt = instString.find('=');
    string returnValue;
    if (foundAt != string::npos)
    {
        returnValue = instString.substr(0, foundAt);
        boost::trim(returnValue);
    }
    return returnValue;
}

static string getRightHandSide(Instruction *inst)
{
    string Str;
    raw_string_ostream OS(Str);

    inst->print(OS, false);
    string instString = OS.str();
    size_t foundAt = instString.find('=');
    string returnValue;
    int len = instString.length();
    if (foundAt != string::npos)
    {
        returnValue = instString.substr(foundAt + 1);
        boost::trim(returnValue);
    }
    return returnValue;
}

static void writeDDGToFile(DDG_GRAPH &ddgGraph, map<string, string> typeMap, string fileName)
{
    error_code ec;
    raw_fd_ostream output(fileName, ec);

    for (auto it = ddgGraph.begin(); it != ddgGraph.end(); it++)
    {
        string source = it->first;
        EDGE_VECTOR adjList = it->second;
        for (EDGE elem : adjList)
        {
            output << source << "," << typeMap[source] << "," << elem.first << "," << typeMap[elem.first] << "," << elem.second << "\n";
        }
    }
    output.close();
}

