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

## Maybe's
You may be able to run this example on arm64-based Linux and Windows with the same process. But I haven't tested it or made sure that the code isn't using any special-purpose registers for the other operating systems.
