
## NOTES
- Little Endian  
    
- 8 bit processor 
    
- 16 bit address bus (65k RAM)
    
- Each instuction is 1-3 bytes, OpCode, Operand 1, Operand 2 
    
- Decide how to do the I/O
    1st option: Like Rolf, add custom microcode for everything. ie OUTLC_A, OUTLD_A, OUTLC_B, OUTLD_B = Send command from A, data from A, command from B, Data from B, ect. 
    
    Advantages: All I/O can be connected to bus             Disadvantages: Requires tons of microcode, more tedius to program
        
    -2nd option: Like 65c02, Wire the I/O to the ram address lines. 
    
    Advantages: Simpler to program, looks better            Disadvantages: I/0 to be wired to second address Bus, Takes up memory space

    RESETING:
        -74HC377 does not have reset, registers will have garbage on startup
        -Only a problem for the instruction register because control lines will activate 
        -Idea is to connect reset switch to upper half of unused ROM, 0x8000 - 0xFFF will be bootcode to clear registers.

## ADDRESSING MODES
Immediate Value  #$8000 - Value directly provided in machine code via instruction

Absolute          $8000 - Value located at memory address provided in machine code

Register           R1 - Value is being stored in one of the registers 

Register Indirect [R1]- Value is at memory address currently contained in a register


## INSTRUCTIONS 
NOP

HLT

OUT


ADD

ADC

SUB

SUBB

CMP


AND

OR

NOT

NOR

XOR-


INC

DEC

SHL

SHR

ASR


LOD

STO

MOV


JMP

JE

JZ

JN


PUSH

POP

CALL

RET


## INSTRUCTION LAYOUT
xxyyyzzz

Where xx is the OpCode

yyy is the first register/Operand

zzz is the second register/Operand


## OPCODES
Registers:
- A : 000
- B : 001
- C : 010
- T : 011
- SP : 100
- PC : 101
- IMM : 111
    
  
- 8 Bit value source
    - A
    - B
    - C
    - Value at specific memory address
    - Immediate
- 8 bit value destination
    - A
    - B
    - C
    - Value at memory address
- 16 bit value source
    - Value at address in MAR
    - 2 byte value starting at specific memory address
    - 2 byte immediate 
- 16 bit value destination
    - MAR
    - 2 byte value starting at specific memory address
    - 2 byte immediate 
        
- Address Source
    - 2 byte value starting at specific memory address
    - 2 byte immediate 

- MOV 00- copy register to register
- DATA -Move immediate to register
- JMP

- LOD 01- Load register from inderect register value
- POP -Increment stack (01 xxx 110)
- RET - POP PC from stack (01 xxx)

- STO 10- Store register to indirect register value
- PUSH -Decrement stack
- CALL -Push PC to stack
- ALU 11

### NOT USED
- MOV SPi/d,xxx     00 110 xxx
- MOV #,xxx         00 111 xxx
- LOD #,[xxx]       01 111 xxx
- STO [xxx], SPi/d  10 xxx 110


## ALU FUNCTIONS
| Number | Logic |  No Carry (H) | Carry (L)|
| :-: | :-- | :-- | :-- |
| 0  | Invert A                           | A                              | INC |
| 1  | NOR                                | OR                             | OR PLUS 1 |
| 2  | True when only B is on             | False when only B is on        | False when only B is on PLUS 1 |
| 3  | 0                                  | 2's COMPL                      | 0 |
| 4  | NAND                               |             |  |
| 5  | Invert B                           |             |  |
| 6  | XOR                                | A MINUS B MINUS 1              | A MINUS B |
| 7  | True when only A is on             | True when only A is on MINUS 1 | True when only A is on |
| 8  | False when only A is on            | A PLUS AB                      | A PLUS AB PLUS 1  |
| 9  | Both on or Both off (inverted XOR) | A PLUS B                       | A PLUS B PLUS 1 |
| 10 | B                                  |             |  |
| 11 | AND                                | AND MINUS 1                    | AND |
| 12 | 1                                  | Shift Left                     | Shift Left PLUS 1 |
| 13 | False when only B is on            | OR PLUS A                      | OR PLUS A PLUS 1 |
| 14 | OR                                 | False when only B is on PLUS A | False when only B is on PLUS A PLUS 1 |
| 15 | A                                  | DEC                            | A |




## LAYOUT
                +-----------|BUS|-----------+
    HLT     -   |    CLK    |   |  PR / PC  | PCE PRO PCO JMPH JMPL (OPT. HILO) - 
                +-----------|   |-----------+
    MIH MIL     |Reset/ MAR |   | A / F REG | AI AO FI FO - 
                +-----------|   |-----------+
                |   MAR     |   |    ALU    | 5 ALU EO - 
                +-----------|   |-----------+
            -   |  MEM MAP  |   |TEMP/Pr Buf| TI TO PRI PRO - 
                +-----------|   |-----------+
    MDI MDO -   | RAM / ROM |   | B / C REG | BI BO CI CO - 
                +-----------|   |-----------+
            -   | Mem Prog  |   |     SP    | SOH SOL SIH SOL SPE UP/DOWN (OPT HILO)
                +-----------|   |-----------+
            -   | Control   |   | OUT HEX   | MDI - 
                +-----------|   |-----------+
    II SCR      | SC  / IR  |   | OUT LCD   | MDI MDO
                +-----------|   |-----------+
    IN          | INPUT     |   |           |
                +-----------|   |-----------+

CLK-
PC-
MAR-
RAM-
ROM-
A REGISTER-
B REGISTER-
C REGISTER-
FLAGS REGISTER-
STACK POINTER-
TEMP REGISTER-
ALU-
INSTRUCTION REGISTER-
STEP COUNTER-

OUT HEX-
OUT LCD-
IN BUTTONS-


### Page Register -8 bit:
-2x 74HC161 - 4 bit counter

-1x 74HC245 Bus transfer

### Program Counter -8 bit:
-2x 74HC161 - 4 bit counter

-1x 74HC245 Bus transfer


### Memory Address Register  -16 bit:
-2x 74HC377

-4x 74HC157

-2 registers, MAR-H, MAR-L 

-8 Dip switches for MAR-L 


Program mode for MAR-H 157's is 

tied to 8800 (First Page of RAM)


## CLOCK
3x TCL555 
1x 74hc14 
1x 75hc08
2x button
1x npn transistor
1M Potentiometer

1x MXO45(HS) 
1x 74hc151 
1x 74hc161

Crystal into 74hc161, 
6 auto outputs into 74hc151
3 dip switches active HIGH


## Memory
### ROM
32K x 8 ROM 28c256 (Active low, CE, OE, WE)


### RAM
1x 32K x 8 RAM 62256 (Active low, CE, OE, WE)

1x 74HC245

### Ram has common I/O lines, requires second bus to seperate multiplexer
    Steps to write to RAM
    1. OE1 signal low, multiplexer data is on second bus
    2. OE of 62256 set high, set I/O to input
    3. WE of 62256 pulsed to store data on second bus to RAM


### Memory Map to RAM/ROM ~CE

RAM ~WE/257 ~OE HIGH (Do not input data)

RAM/ROM ~OE LOW (Always output, depend on mem map select)


If (CLK and MDi and RUN) or (PROG and PUSH)


RAM/ROM ~OE HIGH (stop output)

RAM ~WE/257 ~OE LOW (set RAM input, output data)


### Stack:
-255 bytes

4X 74HC191 (4 bit binary up/down counter)


PUSH - Write value to stack then decrease pointer

PULL


By using instructions to store the stack pointer on the stack (ST_SPH, ST_SPL) 
 the stack register is freed up to be used as two regular registers (with inc and dcr)


## MEMORY LAYOUT
    0x0000..0x77FF ROM   (0000 0000 0000 0000..0111 0111 1111 1111) 0..30,719
    0x7800..0x7FFF I/O   (0111 1000 0000 0000..0111 1111 1111 1111) 30,720..32,767
    0x8000..0xFFFF RAM   (1000 0000 0000 0000..1111 1111 1111 1111) 32,768..65,535            

    0xFF00..0xFFFF Stack (1111 1111 0000 0000..1111 1111 1111 1111) 65,280..65,535

### MEMORY DECODE LOGIC
~a15 = ~RAM

~a15 & a14-a11 = I/O

a15 | a14-a11 = ~ROM


16 chip enabled by Y0 on pin E3

128 chip enabled by ~10

1024 enabled by 10

## MEMORY LAYOUT IO IN RAM
    0x0000..0x7FFF ROM  (0000 0000 0000 0000..0111 1111 1111 1111)
    0X8000..0X87FF IO   (1000 0000 0000 0000..1000 0111 1111 1111)
    0X8800..0XFFFF RAM  (1000 1000 0000 0000..1111 1111 1111 1111)

A15 LOW = ROM

A15 HIGH AND A14-A11 LOW = IO

A15 HIGH AND A14-A11 NOT ALL LOW = RAM


A15 directly to ROM

NOR A14-A11, AND with A15 

NOR then Invert A14-11, AND with A15

## Registers 
A (1): GP/ACC register

B (2): GP register -Indirect capable

C (3): GP register -Indirect capable

#### F (4):    Flags register   

CARRY    - Carry bit on ALU
    
NEGATIVE - MSB of AlU
    
ZERO     - NOR all bits together
    
OVERFLOW - https://stackoverflow.com/questions/19301498/carry-flag-auxiliary-flag-and-overflow-flag-in-assembly/19301682


SPH (): Stack Pointer High

SPL (): Stack Pointer Low


PCH (): Program Counter High

PCL (): Program Counter Low


IR (): Instruction Register


-7x 74HC377

-7X 74H245


-All registers use 74HC377

-A & Flags on one board

-B & C on one board

-Temporary Register and PR-Buf on one board


-STPH & STPL on one board

-Flags connected to bus


## ALU
-2x 74HC181

### 6 control signals:
-4 operation mode select. Addition, subtraction, AND, OR, etc

-1 mode selection. Slecting arithmatic or logic operation

-A carry in, attached to a control signal


-Carry flag comes from ALU with higher 4 bits

-Sign flag is the MS

-Zero flag is identical to Ben Eaters. Nand all bits


## Flag Masking:
-1x 74HC157

-Avoids massive EEPROM array for all combinatin of flags

-Multiplexer A inputs tied to ground

-B inputs attached to flags

-Select is MSB of instruction register


-First 127 instructions A is selected and flag lines are Zero

-Flag instruction are 128 upwards, need multiple copies


Step Counter:
    -Increase steps from t0-t4 to t0-t7 by moving reset from pin 10 to pin 7 of 74ls138


## POWER: 
-Split left and right, only join at top

-1000uf in middle of each half

-220uf at feeding point

-0.1uf on each rail

## BUGS:
-Resistors on control EEPROM outputs. Pull down for active high, pull up for active low

### Add low pass filters to:
-Count enable of program counter

-Instruction in of instruction register

-Count enable of step counter

-Control signals of stack pointer


## Total Parts
    74hc00 = NAND
    74hc02 = NOR
    74hc08 = AND
    74hc14 = Schitt Inverter
    74hc21 = quad AND

    A, B, C:            3x 74hc245, 3x 74hc377, 3x 8 LEDs
    Temp Reg:           1x 74hc245, 1x 74hc377, 8 LEDs
    Flags Reg:          1x 74hc245, 1x 74hc377, 1x 74hc157, 4 LEDs
    ALU:                1x 74hc245, 2x 74hc181, 1x 74hc02, 1x 74hc08, 8 LEDs

    INST Reg:           1x 74hc245, 1x 74hc377, 1x 74hc161, 8 inst LEDS, 4 step LEDs
    Program Counter:    2x 74hc245, 4x 74hc161, 16 LEDs
    Pr Buffer:          1x 74hc245, 1x 74hc377, 8 LEds
    Stack Pointer:      1x 74hc245, 4x 74hc191, 16 LEDS
    MAR:                2x 74hc377, 16 LEDs
    Run Selection:      1x switch, 1x button, 2x 74hc157                
    Memory Map:         1x 74hc00, 1x 74hc32, 16 LEDs
    RAM/ROM:            1x 62256, 1x 28c256 2x 74hc257, 1x 74hc245, 8x LEDs
                        1x 8 dip switch, 1x 74hc00, 1x 74hc08

    CONTROL:            2x 27c4096, 4x 74hc138

    HEX Out:            1x 74hc377, 1x 74hc161, 1x TLC555, 1x 28c64, 1x 74hc107, 1x 74hc139
    Serial Out:         1x 74hc377, ...
    Hex In:             1x 74hc245, 4x button, 1x 4-dip, 1x 8-dip

    CLK:                3x TLC555, 74hc14, 74hc08, 74hc32, 2x button, 1M Potentiometer,
                        1x MXO45(HS), 1x 74hc151, 1x 74hc161

    TOTAL:  13x TC74HC245APF - Bus 
            11x SN74HC377N - Register
            3x SN74HC157N - 4x 2:1 multiplexer
            1x SN74HC151N - 1x 8:1 multiplxer
            7x SN74HC161N - Counter
            2x 74hc181 - ALU
            4x SN74HC191N - Up/Down counter
            2x SN74HC257N - 4x 2:1 multiplexer
            1x CD74HC107E - JK Flip Flop
            4x CD74HC138E - 3:8 Multiplexer
            1x CD74HC139E - 2x 2:4 Decoder


            2x 74hc00 - NAND                    (MOUSER)
            2x CD74HC02E - NOR
            2x CD74HC04E - Inverter
            3x CD74HC08E - AND
            1x 74hc14 - SCHMITT INVERTER        (MOUSER)
            2x CD74HC32E - OR

            1x AS6C62256 - RAM
            1x AT28C256-15PU - ROM
            1x 28c64 - OUTPUT ROM               (MOUSER)

            2x 27c4096                          (MOUSER)

            4x TLC555IP - 555 Timer
            1x ECS-2100A-010 - Crystal Oscillator

            1x slide switch                     (HARD TO FIND)
            7x MJTP1230G - Tactile switch
            3x  - toggle switch                 (HARD TO FIND)
            2x DS04-254-1L-08BK - 8-dip 
            1x DS04-254-1L-04BK - 4-dip
            2x DS04-254-1L-02BK - 2-dip
            1x - 1M Potentiometer               (MOUSER)

            XSVG18D - Green LED (48)
            XSMDK18D - Red LED  (56)
            XSUY18D - Yellow LED (10)
            SSL-LX2573USBD - Blue LED (10)

            4609X-101-271LF - 270ohm resistor array
            4609X-101-102LF - 1k resistor array
            4609X-101-681LF - 680 4609X-101-681LF


            == ORDER ==
            2x 74hc238 for MEM_MAP
            2x 74HC157 for MAR

            (New control EPROMS that are actually erasable)

            1xADC0820 Analogue to Digital
            1xTLC5628CN Digital to Analogue

            16x680 resistor arrays




        



## Possibly Build Custom Assembler?
Python

https://www.youtube.com/watch?v=5ImTvOyvH2w -Write your own assembler for your own CPU

Search how to make a programming language with python

## Build EEPROM Porgrammer to Read from Bin File directly:
-Python send file to arduino

    NOP = 0xea
    EEPROM_SIZE = 32768

    code = bytearray([
        0xa9, 0xff        # lda #$ff
        0x86, 0x02, 0x60  # sta $6002
    ])

    rom = code + bytearray([NOP] * (EEPROM_SIZE - len(code)))

    rom[0xffc] = 0x00
    rom[0xffd] = 0x80

    with open("rom.bin", "wb") as out_file:
        out_file.write(rom)
