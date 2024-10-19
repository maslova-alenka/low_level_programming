section .rodata
    x: dd 1.571
    loop_count: dd 10
    sum: dd 0.0
    start: dd 1.0
    i: dd 1.0
    sign: dd -1.0

section .bss
    result: resd 1
    n: resd 1
    y: resd 1

section .text
global main
main:
    mov rbp, rsp
    movss xmm0, [x]
    movss xmm1, [sum]
    movss xmm2, [sign]
    movss xmm3, xmm0
    movss xmm4, [start]
    movss xmm5, [i]
    movss xmm6, [sign]
    addss xmm1, xmm0
    mov ecx,3
    
.cycle:    
        mulss xmm3, xmm0
        mulss xmm3, xmm0 ;x^3
        movss xmm7, xmm3
        
        movss dword[n], xmm3
        
        addss xmm5, [i] ;2
        mulss xmm4, xmm5 ; 1* 2
        addss xmm5, [i] ; 3
        mulss xmm4, xmm5 ; 2*3
        
        movss dword[y], xmm5
        
        divss xmm7, xmm4
        
        mulss xmm7, xmm6
        addss xmm1, xmm7
        
        mulss xmm6, [sign]
        
        inc ecx
        inc ecx
    cmp ecx, dword[loop_count]
    jb .cycle
    
.end_cycle:        
    movss dword[result], xmm1
    xor rax, rax
    ret