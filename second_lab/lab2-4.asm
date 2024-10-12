; Проверить на неравенство y != cth(x*a)
; Полиз: x a * 2 * e ^ (x*a*2) 1 + e ^ (x*a*2) 1 - /

%include "io64.inc"

section .rodata
e: dd 2.71828
a: dd 3.0
x: dd 2.0
y: dd 128.0
two: dd 2.0

section .data
help: dd 0.0
num: dd 0.0
denom: dd 0.0
result: dd 0.0

section .text
global main
main:
fld dword[x]
fld dword[a]
fmul
fld dword[two]
fmul
fstp dword[help]

fld dword[help]
fld dword[e]
fyl2x
fld1
fld st1
fprem
f2xm1
fadd
fscale
fstp st1
fstp dword[help] 

fld dword[help]
fld1
fadd
fstp dword[num]

fld dword[help]
fld1
fsub
fstp dword[denom]

fld dword[num]
fld dword[denom]
fdiv
fstp dword[result]

fld dword[y]
fld dword[result]
fcomip
fstp st0
ja true
jmp false
true:
PRINT_DEC 4, 1
jmp end
false:
PRINT_DEC 4, 0
jmp end

end:
xor rax, rax
ret
