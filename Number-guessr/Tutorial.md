---

# Number Guessing Game in Assembly

## Overview

This is a simple number guessing game written in Assembly for Linux (x64/x86). The goal of this program is to demonstrate some basic concepts of Assembly language, such as register usage and system calls. The program generates a random number between 0 and 9 and asks the user to guess it. If the guessed number is correct, the user wins; otherwise, they lose.

## Educational Purpose

This program is designed to help understand the following Assembly concepts:

- Register usage (e.g., `rax`, `rdi`, `rsi`, `rdx`).
- System call management.
- Conditional branching with jump instructions (e.g., `je`, `jmp`).
- Data manipulation and comparison.

## Code Sections

### `.data` Section

- `wlc`: Welcome message prompt.
- `lose`: Message displayed when the user loses.
- `win`: Message displayed when the user wins.

### `.bss` Section

- `true_number`: Stores the randomly generated number.
- `my_number`: Stores the user's input.
- `random_number`: (Not used in this version but reserved for potential future use.)

### `.text` Section

- `_start`: Entry point of the program.
- `random`: Function to generate a random number.
- `correct`: Code path executed if the user's guess is correct.
- `fail`: Code path executed if the user's guess is incorrect.
- `exit`: Exits the program.


## Syscall

### Used syscalls

- `1`: Print a string
- `318`: Generate a number
- `0`: Read the input
- `60`: Exit


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

