#include "utility.cpp"
#include "print_utility.cpp"

namespace{

    static bool exists(DDG_GRAPH &G, string key){
        return G.find(key) != G.end();
    }

    static bool exists(GRAPH &G, string key){
        return G.find(key) != G.end();
    }

    static void addEdgeDDG(DDG_GRAPH &ddg, string source, string dest, string label)
    {
        if (source == "<badref>" || dest == "<badref>")
        {
            errs() << "Badref found. Exiting without adding the edges.\n";
            return;
        }
        if (exists(ddg, source))
        {
            ddg[source].push_back(make_pair(dest, label));
        }
        else
        {
            vector<pair<string, string>> children;
            children.push_back(make_pair(dest, label));
            ddg[source] = children;
        }
    }

    static void parseInstructionForDDG(Instruction &inst, DDG_GRAPH &ddg, map<string, string> &typeMap)
    {
        if (isa<AllocaInst>(inst))
        {
            string allocationLocation = getLeftHandSide(&inst);
            AllocaInst *allocInst = dyn_cast<AllocaInst>(&inst);
            string typeInfo = getTypeFromAddress(allocInst->getAllocatedType());
            typeMap[allocationLocation] = typeInfo;
        }
        else if (isa<StoreInst>(inst))
        {
            StoreInst *storeInst = dyn_cast<StoreInst>(&inst);

            Value *storingElement = storeInst->getOperand(0);
            string storingElementName = getStringRepresentationOfValue(storingElement);
            string storingElementType = getTypeFromAddress(storingElement->getType());
            typeMap[storingElementName] = storingElementType;

            Value *storeLocation = storeInst->getPointerOperand();
            string storeLocationName = getStringRepresentationOfValue(storeLocation);
            string storeLocationType = getTypeFromAddress(storeLocation->getType());
            typeMap[storeLocationName] = storeLocationType;

            addEdgeDDG(ddg, storingElementName, storeLocationName, "store");

            // errs()<<"Found Store Instruction.\n";
            // errs()<<"Is return is :"<<storeInst->willReturn()<<"\n";
            // errs()<<"Operand 0: "<<getStringRepresentationOfValue(storingElement)<<" Type: "<<storingElementType<<"\n";
            // errs()<<"Operand 1: "<<getStringRepresentationOfValue(storeLocation)<<" Type: "<<storeLocationType<<"\n";
        }
        else if (isa<LoadInst>(inst))
        {
            LoadInst *loadInst = dyn_cast<LoadInst>(&inst);

            Value *loadingTo = dyn_cast<Value>(&inst);
            string loadingToName = getStringRepresentationOfValue(loadingTo);
            string loadingToType = getTypeFromAddress(loadingTo->getType());
            typeMap[loadingToName] = loadingToType;

            Value *loadingFrom = loadInst->getPointerOperand();
            string loadingFromName = getStringRepresentationOfValue(loadingFrom);
            string loadingFromType = getTypeFromAddress(loadingFrom->getType());
            typeMap[loadingFromName] = loadingFromType;

            addEdgeDDG(ddg, loadingFromName, loadingToName, "load");

            // errs()<<"Found load instruction\n";
            // errs()<<"Will return is: "<<loadInst->willReturn()<<"\n";
            // errs()<<"Loading to: "<<loadingToName<<" of Type: "<<loadingToType<<" ";
            // errs()<<"From "<<loadingFromName<<" of Type: "<<loadingFromType<<"\n";
        }
        else if (isa<CallInst>(inst))
        {
            CallInst *callInst = dyn_cast<CallInst>(&inst);
            string functionName;
            if (callInst->isInlineAsm())
            {
                // We still need the return address and the operand List
                // This is actually a very rare case in user-space program
                functionName = "asm";
            }
            else
            {
                // This is the usual case
                // We need the function name, function's return value
                // And operand list
                functionName = callInst->getCalledFunction()->getName().str();
            }
            Value *returnPoint = dyn_cast<Value>(&inst);
            string returnPointName = getStringRepresentationOfValue(returnPoint);
            string returnPointType = getTypeFromAddress(returnPoint->getType());
            typeMap[returnPointName] = returnPointType;

            // errs() << "Function " << functionName << " will return to " << returnPointName << " with type " << returnPointType << "\n";

            int numOperands = callInst->getNumOperands();
            for (int i = 0; i < numOperands - 1; i++)
            {
                Value *argument = callInst->getArgOperand(i);
                string argumentName = getStringRepresentationOfValue(argument);
                string argumentType = getTypeFromAddress(argument->getType());
                typeMap[argumentName] = argumentType;
                string label = "call:";
                label = label.append(functionName);
                addEdgeDDG(ddg, argumentName, returnPointName, label);
                // errs() << "Argument Number: " << i << " Value: " << argumentName << " Type: " << argumentType << "\n";
            }
            // errs() << "\n";
        }
        else if (isa<GetElementPtrInst>(inst))
        {
            Value *argument = dyn_cast<Value>(&inst);
            string returnPointName = getStringRepresentationOfValue(argument);
            string returnPointType = getTypeFromAddress(argument->getType());
            typeMap[returnPointName] = returnPointType;

            // errs() << "GetelementPointer will return to " << returnPointName << " with type " << returnPointType << "\n";

            GetElementPtrInst *gepInst = dyn_cast<GetElementPtrInst>(&inst);
            int numOperands = gepInst->getNumOperands();
            for (int i = 0; i < numOperands; i++)
            {
                Value *operand = gepInst->getOperand(i);
                string operandName = getStringRepresentationOfValue(operand);
                string operandType = getTypeFromAddress(operand->getType());
                typeMap[operandName] = operandType;
                addEdgeDDG(ddg, operandName, returnPointName, "getelementptr");
                // errs() << "Operand " << i << " Operand Name: " << operandName << " Operand Type: " << operandType << "\n";
            }
            // errs() << "\n";
        }
        else if (isa<ReturnInst>(inst))
        {
            // [ TODO: Figure out what to do with return type ]
            ReturnInst *retInst = dyn_cast<ReturnInst>(&inst);
            Value *retVal = retInst->getReturnValue();
            string retValName = getStringRepresentationOfValue(retVal);
            if(retVal != NULL){
                addEdgeDDG(ddg, retValName, retValName, "return");
            }
        }
        else if (isa<TruncInst>(&inst))
        {
            Value *val = dyn_cast<Value>(&inst);
            string returnPointName = getStringRepresentationOfValue(val);
            string returnPointType = getTypeFromAddress(val->getType());
            typeMap[returnPointName] = returnPointType;
            // errs() << "Truncation will return to " << returnPointName << " with type " << returnPointType << "\n";

            Value *argument = inst.getOperand(0);
            string truncationArgument = getStringRepresentationOfValue(argument);
            string truncationArgumentType = getTypeFromAddress(argument->getType());
            typeMap[truncationArgument] = truncationArgumentType;

            addEdgeDDG(ddg, truncationArgument, returnPointName, "truncate");

            // errs() << "Operand Name: " << truncationArgument << " Operand Type: " << truncationArgumentType << "\n\n";
        }
        else if (isa<BranchInst>(&inst))
        {
            // [TODO: BranchInstuction is about control flow transfer. We do not need that for DDG.]
        }
        else if (isa<ICmpInst>(&inst))
        {
            Value *val = dyn_cast<Value>(&inst);
            string comparisonResult = getStringRepresentationOfValue(val);
            string comparisonResultType = getTypeFromAddress(val->getType());
            typeMap[comparisonResult] = comparisonResultType;

            Value *operand0 = inst.getOperand(0);
            Value *operand1 = inst.getOperand(1);

            string firstOperandName = getStringRepresentationOfValue(operand0);
            string firstOperandType = getTypeFromAddress(operand0->getType());
            typeMap[firstOperandName] = firstOperandType;

            string secondOperandName = getStringRepresentationOfValue(operand1);
            string seconndOperandType = getTypeFromAddress(operand1->getType());
            typeMap[secondOperandName] = seconndOperandType;

            ICmpInst *icmpInst = dyn_cast<ICmpInst>(&inst);
            string predicateName = icmpInst->getPredicateName(icmpInst->getPredicate()).str();

            addEdgeDDG(ddg, firstOperandName, comparisonResult, "icmp:0 " + predicateName);
            addEdgeDDG(ddg, secondOperandName, comparisonResult, "icmp:1 " + predicateName);
        }
        else
        {
            // [TODO: Add more instruction type + Analyze which ones are needed for our use case.]
            Value *val = dyn_cast<Value>(&inst);
            string returnPointName = getStringRepresentationOfValue(val);
            string returnPointType = getTypeFromAddress(val->getType());
            typeMap[returnPointName] = returnPointType;

            // errs()<<"Instruction Name: "<<getTypeFromAddress(inst.getType()) <<" Return Point :"<<returnPointName<<" Return Type: "<<returnPointType<<"\n";

            int numOperands = inst.getNumOperands();
            for (int i = 0; i < numOperands; i++)
            {
                Value *operand = inst.getOperand(i);
                string operandName = getStringRepresentationOfValue(operand);
                string operandType = getTypeFromAddress(operand->getType());
                typeMap[operandName] = operandType;

                addEdgeDDG(ddg, operandName, returnPointName, inst.getOpcodeName());
            }
            // errs()<<"\n";
        }
    }


}