#include "8bit_cpu_def.asm"

; hardware const
HEXOUT = 0x8000

move a, #0 ; clear a register

inc_loop:
    store [HEXOUT], a ; output a
    inc a 

    cmp #255 ; jump to dec_loop if a = 255
    jz dec_loop
    
    jmp inc_loop ; otherwise go back to inc_loop

dec_loop:
    store [HEXOUT], a ; output a
    dec a
    
    jz inc_loop ; jump to inc_loop if a = 0
    
    jmp dec_loop ; otherwise go back to dec_loop
