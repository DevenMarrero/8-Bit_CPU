#include "8bit_cpu_def.asm"

; hardware const
HEXOUT = 0x8000

move a, #0

inc_loop:
    store [HEXOUT], a ; output a
    inc a

    cmp #255
    jz dec_loop
    jmp inc_loop

dec_loop:
    store [HEXOUT], a 
    dec a
    jz inc_loop
    jmp dec_loop
