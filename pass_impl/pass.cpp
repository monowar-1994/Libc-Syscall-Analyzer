#include "graph_utility.cpp"

namespace{

    cl::list<string> Lists("temp-location", cl::desc("Specify The Directory of Temorary File Location (DDG and other types of graphs)."), cl::OneOrMore);


    struct SyscallExtractionPass : public ModulePass{
        static char ID;
        SyscallExtractionPass() : ModulePass(ID){};
        virtual bool runOnModule(Module &M)
        {
            string temporaryFileDirectory;
            for(string arg: Lists){
                temporaryFileDirectory = arg;
            }
            errs()<<"Temporary files are stored in: "<<temporaryFileDirectory<<"\n";

            for(Module::iterator funcIt= M.begin(); funcIt != M.end(); ++funcIt){
                Function &currentFunction = *funcIt;
                if(currentFunction.getBasicBlockList().size()==0){
                    errs()<< "Current Function: "<<currentFunction.getName().str()<<" Has 0 basic blocks.\n";
                    continue;
                }
                // currentFunction.viewCFG();
                CFG currentCFG = buildCFG(currentFunction);
                currentCFG.printDetails();
                DDG currentDDG = buildDDG(currentFunction);
                string ddg_file_name = "/"+currentFunction.getName().str()+"_ddg.txt";
                string saveLocation = temporaryFileDirectory + ddg_file_name;
                writeDDGToFile(currentDDG.getDDG(), currentDDG.getTypeMap(), saveLocation);
            }
            return false;
        }
    };
}

char SyscallExtractionPass::ID = 0;

static RegisterPass<SyscallExtractionPass> X("syscall-extract", "Pass to extract syscalls from function definitons");

static void registerSyscallPass(const PassManagerBuilder &, legacy::PassManagerBase &PM)
{
    PM.add(new SyscallExtractionPass());
}

static RegisterStandardPasses RegisterCustomSyscallExtractPass(PassManagerBuilder::EP_EarlyAsPossible, registerSyscallPass);