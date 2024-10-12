;2^ctg(x)=a
;x = arctan(1/log2(a))
;полиз  x = 1 a log2  / arctan


section .rodata
a: dd 8.0


section .bss
x: resd 1


section .text
global main
main:
    fld1
    fld1
    fld1
    fld dword[a]
    fyl2x
    fdiv
    fxch st0, st1
    fpatan
    fstp dword[x]
    
    xor rax, rax
    ret