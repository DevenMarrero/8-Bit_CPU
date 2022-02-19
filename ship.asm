; https://vscode.dev/
; customasm extension
#include "8bit_cpu_def.asm"

; hardware constants
HEXOUT = 0x8000
LCDOUT = 0x8010
LCDSET = 0x8020
INPUT =  0x8030

E =  0b00000001 ; lcd enable pin
RW = 0b00000010 ; read/write
RS = 0b00000100 ; register select

; const
arrow = 0b01111110
block = 0b11111111

; vars
score = 0x8800
shipUp = 0x8801
blockPos = 0x8802
seed = 0x8803
screenInd = 0x8804

screen = 0x8900 ;0x8900 - 0x891F is screen memory

counter = 0x9000 ; 2 bytes
counterDone = 0x9002

gameSpeed = 0x9004
;gameSpeed = 5

; set random seed on startup
mov a, #0x95
store [seed], a

reset:
    ;initialize stack
    mov d, #0
    mov e, #0
    ; clear hex
    mov a, #0
    store [HEXOUT], a
    ; init lcd
    mov a, #0b00111000 ; set 8-bit mode; 2 line display; 5x8 font
    call lcd_instruction
    mov a, #0b00001110 ; display on; cursor on; blink off
    call lcd_instruction
    mov a, #0b00000110 ; increment and shift cursor; don't shift display
    call lcd_instruction
    mov a, #0b00000001 ; clear disoplay
    call lcd_instruction

    ; wait for lcd to clear
    call reset_clock
    wait:
        call clock
        load a, [counterDone]
        bit #0xFF
        jz wait
    call clear_screen ; clear screen
    call reset_clock ; clear counter

    ; vars
    mov a, #0
    store [shipUp], a
    store [score], a

    mov a, #0x0F
    store [blockPos], a 

    mov a, #6
    store [gameSpeed], a


; Display start screen: wait until a button is pressed
start:
    mov a, #startMsg >> 8
    store [screenInd], a
    call printMsg
    ; loop until any button is pressed
    .wait:
        load a, [INPUT]
        bit #0xFF
        jz .wait

; main game loop
loop:
    ; get input
    call set_input

    ; render screen
    call clear_screen
    call draw_ship
    call draw_block
    call draw_lcd

    ; update score
    load a, [score]
    store [HEXOUT], a

    ; update counter
    call clock
    load a, [counterDone]
    bit #0xFF
    calnz mov_block


    jmp loop

; sets bool shipUp using input
set_input:
    load a, [INPUT] ; get the input
    ; bit both buttons and jump to subroutine
    bit #0b00001000
    jnz .up
    bit #0b00000100
    jnz .down
    ret
    ; up button pressed
    .up:
        mov b, #1 
        store [shipUp], b
        ret
    ; down button pressed
    .down:
        mov b, #0
        store [shipUp], b
        ret

; renders screen
draw_lcd:
    ; clear lcd
    mov b, #0
    mov a, #0b10000000
    call lcd_instruction
    .printloop:
        load a, [screen], b ; get the next char
        ; error is occuring here, FF going to program counter
        nop ; might fix by aligning bytes
        
        bit #0xFF ; check for end of string
        jz .ret
        call print_char ; print the char
        inc b
        ; check to start on next line
        mov a, b
        cmp #16
        calz .nextLine

        jmp .printloop
        .nextLine: ; set cursor to next line
            mov a, #0b11000000
            call lcd_instruction
            ret
        .ret:
            ret

; Copies a string to vid memory; set screenInd to high byte
printMsg:
    call clear_screen
    mov c, #0
    .print:
        load b, [screenInd] ; start value of string 
        load a, [bc] ; load char to a
        mov b, #screen >> 8 ; paste value to screen meory
        store [bc], a 

        inc c ; next char
        mov a, c 
        cmp #0x20
        jnz .print
    
    call draw_lcd
    ret
; clear screen memory
clear_screen:
    ; go to start of screen memory
    mov b, #screen >> 8
    mov c, #screen - 1 & 0xFF
    ; loop through each byte and write " "
    .clear:
        inc c
        mov a, #" "
        store [bc], a
        mov a, c
        cmp #0x1F ; end of memory
        jnz .clear
    mov a, #0
    store [screen + 0x20], a 
    ret

; sets ship location in screen memory
draw_ship:
    load a, [shipUp]
    bit #0xFF
    jz .down
    .up: ; if shipUp is 1
        mov a, #arrow
        store [screen], a
        ret
    .down: ; if shipUp is 0
        mov a, #arrow
        store [screen + 16], a
        ret
; sets block location in screen memory
draw_block:
    ; set address in screen memory
    load c, [blockPos]
    mov b, #screen >> 8
    ; insert block
    mov a, #block
    store [bc], a
    ret
; moves single block to the left and resets counter
mov_block:
    load a, [blockPos]
    sub #1 ; subtract 1 from block index
    store [blockPos], a
    call reset_clock ; reset timer for when to move block again

    call block_collision ; test if block hit player
    ret

; controls point and game over
block_collision:
    ; block off in top row
    load a, [blockPos]
    cmp #0xFF
    jz .up

    ; block off in bottom row
    cmp #0xF
    jz .down
    ret
    ; check if ship is also up
    .up:
        load a, [shipUp]
        bit #0xFF
        jnz .end
        jmp .point
    ; check if ship is also down
    .down:
        load a, [shipUp]
        bit #0xFF
        jz .end
        jmp .point

    ; block has not hit player
    .point:
        inc [score]
        call reset_block
        call update_game_speed ; check for speed increase
        ret

    ; block hit player
    .end:
        jmp gameOver
        
; generates random number to set block location
reset_block:
    load a, [seed]
    bit #0xFF ; set flags
    jz .doXor
    shl
    jz .noXor
    jnc .noXor

    .doXor:
        xor #0x1D
    .noXor:
        store [seed], a

    bit #0x01
    jnz .odd
    .even:
        mov a, #0xF
        store [blockPos], a
        ret
    .odd:
        mov a, #0x1F
        store [blockPos], a
        ret
; speed up game
update_game_speed:
    ; return if speed is already maxed
    load a, [gameSpeed]
    bit #0xFF
    retz
    
    load a, [score]
    cmp #10
    jz .dec

    cmp #20
    jz .dec

    cmp #35
    jz .dec

    cmp #70
    jz .dec

    ret
    ; increase speed
    .dec:
        load a, [gameSpeed]
        sub #1
        store [gameSpeed], a
        ret

; display end msg
gameOver:
    ; display game over message
    mov a, #gameOverMsg >> 8
    store [screenInd], a
    call printMsg

    ; set new random seed
    load a, [seed]
    adc [score]
    shl
    store [seed], a
    .input:
        load a, [INPUT] ; get the input
        ; bit both buttons and jump to subroutine
        bit #0b00000010
        jnz .three
        bit #0b00000001
        jnz .four
        jmp .input
        .three:
            jmp reset
        .four:
            hlt



; DO NOT USE - until 74hc377 input is bufferd by 74hc245 to LCD
lcd_wait:
    push a
    .lcd_busy:
        mov a, #RW
        store [LCDSET],a 
        mov a, #RW|E
        store [LCDSET], a 
        load a, [LCDOUT]
        and #0b10000000
        jnz .lcd_busy

        mov a, #RW
        store [LCDSET], a
        pop a
        ret 

; sends instruction in A reg to lcd
lcd_instruction:
    ;call lcd_wait
    store [LCDOUT], a 

    ; toggle enable
    mov a, #0
    store [LCDSET], a
    mov a, #E
    store [LCDSET], a 
    mov a, #0
    store [LCDSET], a
    ret

; sends char in A reg to lcd
print_char:
    ;call lcd_wait
    store [LCDOUT], A
    
    mov a, #RS ; select data register
    store [LCDSET], a
    mov a, #RS|E ; turn on enable
    store [LCDSET], a
    mov a, #RS ; turn off enable
    store [LCDSET], a
    ret

; increments a 16 bit digit until it hits gameSpeed; stores in counterDone
; check with:
    ; load a, [counterDone]
    ; bit #0xFF
    ; jnz {address}
clock:
    ; increment
    load a, [counter]
    add #1
    store [counter], a

    load a, [counter + 1]
    adc #0
    store [counter + 1], a

    ; check low
    load a, [counter]
    load b, [gameSpeed]
    cmp b
    jnc .ret

    ; check high
    load a, [counter + 1]
    cmp #0
    jnz .ret

    mov a, #1
    store [counterDone], a
    .ret:
        ret

; sets clock to 0
reset_clock:
    mov a, #0
    store [counter], a
    store [counter + 1], a
    store [counterDone], a
    ret

; String messages
#align 2048
startMsg:
    #d " b1-up  b2-down  Press to Start ", 0x00
#align 2048
gameOverMsg:
    #d "   Game Over     3-Play  4-End ", 0x00
