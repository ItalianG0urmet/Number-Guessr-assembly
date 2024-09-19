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

## Code

```
section .data
  wlc db "Chose a number (0-9):", 0xA
  wlc_len equ $ - wlc
  lose db "Lose!", 0xA
  lose_len equ $ - lose
  win db "Win!", 0xA
  win_len equ $ - win

section .bss
  true_number resd 1;
  my_number resd 1;
  random_number resd 1;

  section .text
global _start

_start:

  mov byte [true_number], 1
  mov byte [my_number], 1

  ; Welcome
  mov rax, 1
  mov rdi, 1  
  mov rsi, wlc  
  mov rdx, wlc_len
  syscall

  ; Input   
  mov rax, 0
  mov rdi, 0
  mov rsi, my_number
  mov rdx, 1
  syscall

  ; Generate
  call random
  
  ; Compare
  mov eax, dword [true_number]
  cmp eax, dword [my_number]
  je correct
  jmp fail

  

random:
  xor rdx, rdx
  mov rdi, true_number
  mov rax, 318
  mov rdx, 0
  mov rsi, 1
  syscall      

  movzx rax, byte [true_number]
  xor rdx, rdx
  mov rcx, 10
  div rcx
  add edx, 1
  add edx, '0'

  mov [true_number], edx
  ret

correct:
  xor rax, rax
  xor rdi, rdi
  mov rax, 1
  mov rdi, 1
  mov rsi, win
  mov rdx, win_len
  syscall

  call exit

fail:
  xor rax, rax
  xor rdi, rdi
  mov rax, 1
  mov rdi, 1
  mov rsi, lose
  mov rdx, lose_len
  syscall

  call exit

exit:
  mov rax, 60
  xor rdi, rdi
  syscall

```
---

