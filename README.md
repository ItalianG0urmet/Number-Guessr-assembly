---

# Assembly projects

## Overview

In this repository, I will showcase some basic projects done in Assembly x64/x86 for Linux systems. I will explain basic concepts of Assembly x64/x86 for Linux.

## Projects list

1. Random number generator: [ReadMe](./Number-guessr/Tutorial.md)

## How to Assemble and Run

### 1. Assemble the Code

```bash
nasm -f elf64 -o game.o game.asm
```

- `nasm`: The assembler (a tool that translates assembly code into an object file).
- `-f elf64`: Specifies the output format. `elf64` indicates that the object file should be created in the 64-bit ELF (Executable and Linkable Format) format, which is common on Linux systems.
- `-o game.o`: Specifies the name of the resulting object file. In this case, the object file will be named `game.o`.
- `game.asm`: The input file containing the assembly code to be assembled.

#### 2. Link the Object File

```bash
ld -o game game.o
```

- `ld`: The linker, a tool that combines the object file with any other necessary libraries or object files to produce an executable file.
- `-o game`: Specifies the name of the resulting executable file. Here, the executable will be named `game`.
- `game.o`: The object file to be linked.

#### 3. Run the Program

```bash
./game
```

- `./game`: Executes the resulting executable file. The `./` prefix indicates that the file `game` is located in the current directory.


## Notes

- This program is a very simple educational example. The random number generation is basic and may not be secure for more serious uses.
- The program assumes that user input is always valid (a single numeric character).

## License

This project is provided without warranties and for educational purposes. It is free to be used and modified for learning purposes.

---

