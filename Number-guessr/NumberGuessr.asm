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


  
