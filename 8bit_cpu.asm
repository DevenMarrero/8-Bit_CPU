;#include "8bit_cpu.def"

#subruledef register{
    a => 0b000
    b => 0b001
    c => 0b010
    d => 0b100 ; SPH
    e => 0b011 ; SPL
}

#subruledef source{
    {register: register} => register
    #{immediate: u8} => 0b111 @ immediate
}

#subruledef register2{
    [bc] => 0b001
    [de] => 0b011
}

#subruledef source2{
    {register: register2} => register
    [{immediate: u16}] => 0b111 @ le(immediate)
}

#subruledef aluReg{
    b => 0b00
    c => 0b01
    #{immediate: u8} => 0b10 @ immediate
    [{address: u16}] => 0b11 @ address
}

#ruledef{
    nop => 0x00
    hlt => 0xFF

    ; register copy from source
    mov {r: register}, {src: source} => 0b00 @ r @ src

    ; [#], [bc], [de]
    load {r: register}, {src: source2} => 0b01 @ r @ src

    sto {r2: register2}, {r: register} => 0b10 @ r2 @ r
    sto {immediate: u16}, {r: register} => 0b10 @ 0b111 @ r @ le(immediate)

    ; -----------------------------------------
    ;   jumps
    jmp   {address: u16} => 0x2F @ le(address)
    jz    {address: u16} => 0x30 @ le(address)
    jc    {address: u16} => 0x31 @ le(address)
    jn    {address: u16} => 0x32 @ le(address)
    jnz   {address: u16} => 0x33 @ le(address)
    jnc   {address: u16} => 0x34 @ le(address)
    jp    {address: u16} => 0x35 @ le(address)
    jmp_r {address: u8} => 0x37 @ address

    ; ------------------------------------------
    ;   calls
    call  {address: u16} => 0xB5 @ le(address)
    calz  {address: u16} => 0xA0 @ le(address)
    calc  {address: u16} => 0xA1 @ le(address)
    caln  {address: u16} => 0xA2 @ le(address)
    calnz {address: u16} => 0xA3 @ le(address)
    calnc {address: u16} => 0xA4 @ le(address)
    calp  {address: u16} => 0xA5 @ le(address)

    ; -----------------------------------------
    ;   return
    ret => 0x6E
    retz => 0x70
    retc => 0x71
    retn => 0x72
    retnz => 0x73
    retnc => 0x74
    retp => 0x75
    
    ; -----------------------------------------
    ;   stack
    pop a => 0x46
    pop b => 0x4E
    pop c => 0x56
    pop psw => 0x7E

    push a => 0xB0
    push b => 0xB1
    push c => 0xB2
    push psw => 0xB3
    push #{immediate: u8} => 0xB7 @ immediate

    ; -----------------------------------------
    ;   alu
    add {src: aluReg} => 0b110000 @ src
    adc {src: aluReg} => 0b110001 @ src
    sub {src: aluReg} => 0b110010 @ src
    sbb {src: aluReg} => 0b110011 @ src
    and {src: aluReg} => 0b110100 @ src
    or  {src: aluReg} => 0b110101 @ src
    xor {src: aluReg} => 0b110110 @ src
    cmp {src: aluReg} => 0b111001 @ src

    inc a => 0xDC
    inc b => 0xDD
    inc c => 0xDE
    inc [{address: u16}] => 0xDF @ address

    dec a => 0xE0
    dec b => 0xE1
    dec c => 0xE2
    dec [{address: u16}] => 0xE3 @ address

    nota => 0b11101000
    shl => 0xE9
    shr => 0xEA
    rol => 0xEB
    ror => 0xEC
    rcl => 0xED
    rcr => 0xEE

    bit b => 0xF0
    bit c => 0xF1
    bit d => 0xF3
    bit e => 0xF2
    bit #{immediate: u8} => 0xF4 @ immediate
    bit [{address: u16}] => 0xF5 @ address

    clr_c => 0xFC
    set_c => 0xFD
}

adc b
and c
push psw
push #0x55
