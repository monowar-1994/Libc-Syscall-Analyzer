# Syscall Extraction From musl-libc Source Code

## Preparation 
- Get the musl-libc source-code
- Build from the source using cmake and ninja
- Save the intermediate IR files (bitcode or .ll files)
- Use them later as input for the pass in the project.

## Running the project
- Build the project using the build.sh script
- Modify the test.c file in the ```Target``` folder. This is just a sanity check.
- Run the pass on all the IR files of the musl-libs source code. The script for that will be added soon.
## Interpreting the results
- [ TODO ]