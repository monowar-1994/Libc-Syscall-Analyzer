#include "graph_utility.cpp"


namespace{

    cl::list<string> Lists("temp-location", cl::desc("Specify The Directory of Temorary File Location (DDG and other types of graphs)."), cl::OneOrMore);


    struct SyscallExtractionPass : public ModulePass{
        static char ID;
        SyscallExtractionPass() : ModulePass(ID){};
        virtual bool runOnModule(Module &M)
        {
            string syscallFileName = "/home/rashik/Documents/Providentia/libc_syscall_extract_standalone/syscall_list.json";
            string resultFile = "/home/rashik/Documents/Providentia/libc_syscall_extract_standalone/Temp/relevantSyscallResults.txt";
            string temporaryFileDirectory;
            for(string arg: Lists){
                temporaryFileDirectory = arg;
            }
            errs()<<"Module: "<<M.getName().str()<<"\n";
            set<int> relevantSyscalls = readRelevantSyscallList(syscallFileName);
            
            for(Module::iterator funcIt= M.begin(); funcIt != M.end(); ++funcIt){
                Function &currentFunction = *funcIt;
                if(currentFunction.getBasicBlockList().size()==0){
                    // errs()<< "Current Function: "<<currentFunction.getName().str()<<" Has 0 basic blocks.\n";
                    continue;
                }
                // // currentFunction.viewCFG();
                // CFG currentCFG = buildCFG(currentFunction);
                // currentCFG.process();
                // // DDG currentDDG = buildDDG(currentFunction);
                
                
                pair<bool,vector<int>> syscallAnalysisResult = syscallFinder(currentFunction);
                set<int> tempSyscallList;
                if(syscallAnalysisResult.first){
                    bool hasRelevantSyscall = false;
                    for(auto syscall: syscallAnalysisResult.second){
                        if(relevantSyscalls.find(syscall) != relevantSyscalls.end()){
                            tempSyscallList.insert(syscall);
                        }
                    }
                }

                // vector<BasicBlock *> blocksWithRelevantSyscalls =  getRelevantBasicBlocks(tempSyscallList, currentFunction);
                if(tempSyscallList.size()>0){
                    ofstream relevantSyscallIndexFile(resultFile, ios::app);
                    relevantSyscallIndexFile<< M.getName().str()<<" : ";
                    for(auto &elem: tempSyscallList){
                        relevantSyscallIndexFile<< elem <<", ";
                    }
                    relevantSyscallIndexFile<<"\n";
                    relevantSyscallIndexFile.close();
                }
            }
            return false;
        }
    };

    struct SyscallFinderPass: public ModulePass{
        static char ID;
        SyscallFinderPass(): ModulePass(ID){};
        virtual bool runOnModule(Module &M){
            string moduleName = M.getName().str();
            bool containsSyscall = false;

            for(Module::iterator it = M.begin(); it != M.end(); it++){
                Function &currentFunction = *it;
                if(currentFunction.getBasicBlockList().size()==0){continue;}
                pair<bool,vector<int>> syscallAnalysisResult = syscallFinder(currentFunction);
                if(syscallAnalysisResult.first){
                    string result = jsonifySyscallAnalysis(moduleName, currentFunction.getName().str(), syscallAnalysisResult);
                    errs()<<result<<"\n";
                }
            }
            return false;
        }
    };
}

char SyscallExtractionPass::ID = 0;
char SyscallFinderPass::ID = 1;

static RegisterPass<SyscallExtractionPass> X("syscall-extract", "Pass to extract syscalls from function definitons");
static RegisterPass<SyscallFinderPass> Y("syscall-find", "Pass to Find syscalls from function definitons");

static void registerSyscallPasses(const PassManagerBuilder &, legacy::PassManagerBase &PM)
{
    PM.add(new SyscallFinderPass());
    PM.add(new SyscallExtractionPass());
}

static RegisterStandardPasses RegisterCustomSyscallExtractPass(PassManagerBuilder::EP_EarlyAsPossible, registerSyscallPasses);