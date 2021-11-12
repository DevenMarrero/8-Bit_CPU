HLT

MIH
MIL

MDI
MDO

II
SCR

PCE
PRO
PCO
PRI
PCI

AI
AO
FI
FO
FLAG BUS OR ALU

5 ALU Control lines
EO

TI
TO
PBI
PBO

BI
BO
CI
CO

SIH
SIL
SOH
SOL

SPE
UP/DOWN

TOTAL: 38 CONTROL LINES

10 direct lines, 14 select lines per chip


Only one output active at a time: MDO, -PRO, -PCO, -AO, -FO, -EO, -TO, -PBO, -BO, -CO, SOH, SOL  = 12

Only one input active at a time: MIH, MIL, MDI, II, PRI, PCI, AI, FI,-TI, PBI, BI, CI, SIH, STL  = 14

LEFTOVER: HLT, SCR, PCE, ALU0, ALU1, ALU2, AL3, ALU4, SPE, UP/DOWN, FlagSelect  = 11

Idea 1: Bitwise OR with active HIGH lines, AND with active LOW.
Idea 2: XOR all bits.

00000000000000000000000000000000

| Control Line Position | Bank | Group | HEX | Symbol | Active H/L | Notes |
| :-: | :-- | :-- | :-: | :-: | :-: | :-- |
|1  | RIGHT | LOW    | 00000001 | PRI  |  |Read bus into upper byte of program counter (page register) |
|2  | RIGHT | LOW    | 00000002 | PCI  |  |Read bus into lower byte of program counter |
|3  | RIGHT | LOW    | 00000003 | AI   |  | Read bus into `A` register |
|4  | RIGHT | LOW    | 00000004 | FI   |  | Read flags from bus or ALU into flags register, indicated by `FSEL` |
|5  | RIGHT | LOW    | 00000005 | TIN  |  | Read bus into `Temp` register |
|6  | RIGHT | LOW    | 00000006 | PRBI |  |Read bus into Page Register Buffer |
|7  | RIGHT | LOW    | 00000007 | BI   |  | Read bus into `B` register |
|8  | RIGHT | HIGH   | 00000008 | CI   |  | Read bus into `C` register |
|9  | RIGHT | HIGH   | 00000010 | MIH  |  | Read bus into upper byte of memory address register |
|10 | RIGHT | HIGH   | 00000018 | MIL  |  | Read bus into upper byte of memory address register |
|11 | RIGHT | HIGH   | 00000020 | MDI  |  | Read bus into memory device |
|12 | RIGHT | HIGH   | 00000028 | II   |  | Read bus into instruction register |
|13 | RIGHT | HIGH   | 00000030 | SIH  |  | Read bus into upper byte of stack pointer |
|14 | RIGHT | HIGH   | 00000038 | SIL  |  | Read bus into lower byte of stack pointer |
|15 | RIGHT | DIRECT | 00000040 | PCE  |  | Activate program counter increment |
|16 | RIGHT | DIRECT | 00000080 | FSEL |  | Selects to read flags from bus or ALU |
|17 | RIGHT | DIRECT | 00000100 | SPE  |  | Activate stack pointer increment or secrement indicated by `U/D` |
|18 | RIGHT | DIRECT | 00000200 | U/D  |  | Indicates whether stack is increasing (LOW) or decreasing (HIGH) |
|19 | RIGHT | DIRECT | 00000400 |  |   |  |  |
|20 | RIGHT | DIRECT | 00000800 |  |   |  |
|21 | RIGHT | DIRECT | 00001000 |  |   |  |
|22 | RIGHT | DIRECT | 00002000 |  |   |  |
|23 | RIGHT | DIRECT | 00004000 |  |   |  |
|24 | RIGHT | DIRECT | 00008000 |  |   |  |
|25 | LEFT  | LOW    | 00010000 | PRO  |  | Write upper byte of program counter to bus (page register) |
|26 | LEFT  | LOW    | 00020000 | PCO  |  | Write lower byte of program counter to bus |
|27 | LEFT  | LOW    | 00030000 | AO   |  | Write contents of `A` register to bus |
|28 | LEFT  | LOW    | 00040000 | FO   |  | Write contents of flags register to bus |
|29 | LEFT  | LOW    | 00050000 | EO   |  | Write contents of ALU to bus |
|30 | LEFT  | LOW    | 00060000 | TO   |  | Write contents of `Temp` register to bus |
|31 | LEFT  | LOW    | 00070000 | PRBO |  | Write contents of Page Register Buffer to bus |
|32 | LEFT  | HIGH   | 00080000 | BO   |  | Write contents of `B` register to bus |
|33 | LEFT  | HIGH   | 00100000 | CO   |  | Write contents of `C` register to bus |
|34 | LEFT  | HIGH   | 00180000 | SOH  |  | Write upper byte of stack pointer to bus |
|35 | LEFT  | HIGH   | 00200000 | SOL  |  | Write lower byte of stack pointer to bus |
|36 | LEFT  | HIGH   | 00280000 | MDO  |  | Write contents of memory device to bus |
|37 | LEFT  | HIGH   | 00300000 |  |   |  |
|38 | LEFT  | HIGH   | 00380000 |  |   |  |
|39 | LEFT  | DIRECT | 00400000 | ALU0 | H | Indicate ALU operation |
|40 | LEFT  | DIRECT | 00800000 | ALU1 | H | Indicate ALU operation |
|41 | LEFT  | DIRECT | 01000000 | ALU2 | H | Indicate ALU operation |
|42 | LEFT  | DIRECT | 02000000 | ALU3 | H | Indicate ALU operation |
|43 | LEFT  | DIRECT | 04000000 | ALU4 | H | Indicate ALU operation |
|44 | LEFT  | DIRECT | 08000000 |  |  |  |
|45 | LEFT  | DIRECT | 10000000 |  |  |  |
|46 | LEFT  | DIRECT | 20000000 |  |  |  |
|47 | LEFT  | DIRECT | 40000000 | SCR |  | Resets the step counter |
|48 | LEFT  | DIRECT | 80000000 | HLT | L | Stops to computer and sets it to manual mode | 
