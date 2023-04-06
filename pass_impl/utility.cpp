// STL dependencies
#include <algorithm>
#include <vector>
#include <map>
#include <stack>
#include <list>
#include <utility>
#include <string>
#include <regex>
#include <iterator>
#include <set>
#include <sys/file.h>
#include <fstream>

// LLVM dependencies
#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/CFG.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/AbstractCallSite.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Analysis/DDG.h"
#include "llvm/Analysis/DDGPrinter.h"
#include "llvm/IR/Constants.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/Support/CommandLine.h"
// JSON dependencies
#include <jsoncpp/json/json.h>
#include <jsoncpp/json/value.h>

// Boost dependencies
#include <boost/algorithm/string.hpp>

using namespace llvm;
using namespace std;
using namespace sys::fs;

typedef list<string> PATH;
typedef pair<string, string> EDGE;
typedef vector<string> EDGE_LIST;
typedef vector<EDGE> EDGE_VECTOR;
typedef map<string, EDGE_LIST> GRAPH;
typedef map<string, EDGE_VECTOR> DDG_GRAPH;
typedef map<string, BasicBlock *> BB_MAP;
 