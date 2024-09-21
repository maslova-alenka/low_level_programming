%include "io64.inc"

section .data
space db ' ', 0

section .bss
arr: resd 100

section .text
global main
main:
    GET_UDEC 4, r8d
    xor ecx, ecx
    
.cycle1_start:
    cmp ecx, r8d
    je .cycle1_end
    
    GET_DEC 4, [arr + 4*ecx]
    
    add ecx,1
    jmp .cycle1_start

.cycle1_end:

    xor r9d,r9d
    xor ecx,ecx
    
    mov r10d, r8d   ;m = n
    sub r10d, 1 ; m = m-1
  
    
.cycle2_start:
    cmp ecx, r10d ;if (i == m)                      
    je .cycle2_end 
    
    xor r9d,r9d
    
    mov r12d, r10d ;k = m
    sub r12d, ecx ;k-i

    jmp .cycle3_start
    
.cycle3_start:
    
    cmp r9d, r12d ;if (j == k)
    je .cycle3_end
    
    mov eax, [arr + 4*r9d]
    mov ebx, [arr + 4*r9d + 4]
    cmp eax, ebx
    
    jbe .no_swap  
    
    mov [arr + 4*r9d], ebx
    mov [arr + 4*r9d + 4], eax
    
.no_swap:    
    add r9d,1
    jmp .cycle3_start
    
.cycle3_end:
    add ecx,1
    jmp .cycle2_start
    
.cycle2_end:

    xor ecx,ecx

.cycle4_start:
    cmp ecx, r8d
    je .cycle4_end
    PRINT_DEC 4, [arr + 4*ecx]
    PRINT_STRING [space]
    add ecx, 1
    jmp .cycle4_start 
.cycle4_end:
    
    
    xor rax, rax
    ret