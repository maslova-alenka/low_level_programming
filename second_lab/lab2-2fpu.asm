section .rodata
    x: dd 5.0
    loop_count: dd 10
    one: dd 1.0
    two: dd 2.0
    
section .data
    sign: dd -1.0
    start: dd 1.0
    denom: dd 1.0

section .bss
    result: resd 1
    n: resd 1
    y: resd 1
    num: resd 1
    i: resd 1
    sum: resd 1

section .text
global main
main:
    mov rbp, rsp
    fld dword[x]
    fld dword[sum]
    fadd
    fstp dword[sum]
    
    mov ecx, 3
    
.cycle:
    fld dword[n]
    fld1
    fadd
    fstp dword[n]
    
    fld dword[n]
    fld dword[two]
    fmul
    fld1
    fadd
    fstp dword[y]
    
    fld dword[y]
    fld dword[x]
    fyl2x
    fld1
    fld st1
    fprem
    f2xm1
    fadd
    fscale
    fstp st1
    fstp dword[num] ;числитель

    fld dword[y]
    fstp dword[i]
    
    fld dword[i]

    
;factorial
    fld dword[i]
    fld1
    fsub
    fmul
    fld dword[denom]
    fmul
    fstp dword[denom]
     
           
fld dword[num]
    fld dword[denom]
    fdiv                ; num / denom
    fld dword[sign]
    fmul                ; sign * (num / denom)
    fld dword[sum]
    fadd                ; sum + результат
    fstp dword[sum]    ; Сохраняем результат
    
    fld dword[sign]
    fchs
    fstp dword[sign]
    
    fld dword[start]
    fld1
    fld1
    fadd
    fadd
    fstp dword[start]

    ; Условие выхода из цикла
    inc ecx
    inc ecx
    cmp ecx, dword[loop_count]
    jb .cycle
    
fld dword[sum]
fstp dword[result]
    xor rax, rax
    ret