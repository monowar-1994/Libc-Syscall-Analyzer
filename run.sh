#!/bin/bash

ROOT_DIR=`pwd`
mkdir -p ${ROOT_DIR}/Temp
cd build/pass_impl
PASS_LOCATION=`pwd`
cd ${ROOT_DIR}/Test
mkdir -p Target
cd Target
#rm -rf *
#cd ..
#clang -S -emit-llvm -o ./Target/target.ll test.c
#cd Target
#pwd
opt -load ${PASS_LOCATION}/libSyscallExtractPass.so -syscall-find -temp-location ${ROOT_DIR}/Temp target.ll -enable-new-pm=0 > /dev/null


