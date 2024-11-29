# asm-fizz-buzz
Apple Silicon assembly fizz buzz example

## How to run
To run this code, you need to:
1. Compile the `main.s` file
```bash
as -o main.o main.s
```
2. Link the object file with `libc`:
```bash
gcc -o main -lc main.o
```
3. Run the executable:
```bash
./main
```

## Debugging
Usually, to debug an assembly code, you use [gdb](https://en.wikipedia.org/wiki/GNU_Debugger), but right now doesn't work on MacOS's arm64 assembly. Fortunately, a similar tool called [LLDB](https://lldb.llvm.org) can already be used on MacOS's arm64 assembly.

To use a debugger on the assembly code, you need to compile and link it with `-gdwarf-4` flag, like so:
```bash
$ as main.s -o main.o -gdwarf-4
$ gcc main.o -o main -lc -gdwarf-4
```
This tells the compiler to add debugging information inside the executable file for the debugger. To debug your code, run this command (replacing `main` with the name of your compiled executable):
```bash
lldb ./main
```
This command will display a REPL that allows, you to set breakpoints, step over and into lines, and view the current values of all registers among others. You can learn more about what you can do with LLDB in [Apple's GDB and LLDB Command Examples archived documentation](https://developer.apple.com/library/archive/documentation/IDEs/Conceptual/gdb_to_lldb_transition_guide/document/lldb-command-examples.html) or [LLDB's GDB to LLDB command map documentation page](https://lldb.llvm.org/use/map.html).

## Maybe's
You may be able to run this example on arm64-based Linux and Windows with the same processes, but I haven't tried it out yet.
