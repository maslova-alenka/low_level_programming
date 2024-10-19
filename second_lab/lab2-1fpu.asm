%include "io64.inc"
%include "io64_float.inc"
section .text
global main
set_round_down:
    sub rsp,8
    fstcw [rsp]
    mov al, [rsp+1]
    and al, 0xF3
    or al, 4
    mov [rsp+1],al
    fldcw [rsp]
    add rsp, 8
    ret
main:
    call set_round_down
    READ_FLOAT [rax]
    fld dword[rax]
    fistp dword[rax]
    PRINT_DEC 4, [rax]
    xor rax, rax
    ret