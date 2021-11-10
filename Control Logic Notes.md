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


Only one output active at a time: MDO, PRO, PCO, AO, FO, EO, TO, PBO, BO, CO, SOH, SOL  = 12

Only one input  active at a time: MIH, MIL, MDI, II, PRI, PCI, AI, FI, TI, PBI, BI, CI, SIH, STL  = 14

LEFTOVER: -LT, SCR, PCE, ALU0, ALU1, ALU2, AL3, ALU4, SPE, UP/DOWN, FlagSelect  = 11

Idea 1: Bitwise OR with active HIGH lines, AND with active LOW.
Idea 2: XOR all bits.

00000000000000000000000000000000

| Control Line Position | Bank | Group | HEX | Symbol | Active H/L | Notes |
| :-: | :-- | :-- | :-: | :-: | :-: | :-- |
|1  | RIGHT | LOW    | 00000001 |  |  |
|2  | RIGHT | LOW    | 00000002 |  |  |
|3  | RIGHT | LOW    | 00000003 |  |  |
|4  | RIGHT | LOW    | 00000004 |  |  |
|5  | RIGHT | LOW    | 00000005 |  |  |
|6  | RIGHT | LOW    | 00000006 |  |  |
|7  | RIGHT | LOW    | 00000007 |  |  |
|8  | RIGHT | HIGH   | 00000008 |  |  |
|9  | RIGHT | HIGH   | 00000010 |  |  |
|10 | RIGHT | HIGH   | 00000018 |  |  |
|11 | RIGHT | HIGH   | 00000020 |  |  |
|12 | RIGHT | HIGH   | 00000028 |  |  |
|13 | RIGHT | HIGH   | 00000030 |  |  |
|14 | RIGHT | HIGH   | 00000038 |  |  |
|15 | RIGHT | DIRECT | 00000040 |  |  |
|16 | RIGHT | DIRECT | 00000080 |  |  |
|17 | RIGHT | DIRECT | 00000100 |  |  |
|18 | RIGHT | DIRECT | 00000200 |  |  |
|19 | RIGHT | DIRECT | 00000400 |  |  |
|20 | RIGHT | DIRECT | 00000800 |  |  |
|21 | RIGHT | DIRECT | 00001000 |  |  |
|22 | RIGHT | DIRECT | 00002000 |  |  |
|23 | RIGHT | DIRECT | 00004000 |  |  |
|24 | RIGHT | DIRECT | 00008000 |  |  |
|25 | LEFT  | LOW    | 00010000 |  |  |
|26 | LEFT  | LOW    | 00020000 |  |  |
|27 | LEFT  | LOW    | 00030000 |  |  |
|28 | LEFT  | LOW    | 00040000 |  |  |
|29 | LEFT  | LOW    | 00050000 |  |  |
|30 | LEFT  | LOW    | 00060000 |  |  |
|31 | LEFT  | LOW    | 00070000 |  |  |
|32 | LEFT  | HIGH   | 00080000 |  |  |
|33 | LEFT  | HIGH   | 00100000 |  |  |
|34 | LEFT  | HIGH   | 00180000 |  |  |
|35 | LEFT  | HIGH   | 00200000 |  |  |
|36 | LEFT  | HIGH   | 00280000 |  |  |
|37 | LEFT  | HIGH   | 00300000 |  |  |
|38 | LEFT  | HIGH   | 00380000 |  |  |
|39 | LEFT  | DIRECT | 00400000 | ALU |  |
|40 | LEFT  | DIRECT | 00800000 | ALU |  |
|41 | LEFT  | DIRECT | 01000000 | ALU |  |
|42 | LEFT  | DIRECT | 02000000 | ALU |  |
|43 | LEFT  | DIRECT | 04000000 | ALU |  |
|44 | LEFT  | DIRECT | 08000000 |  |  |
|45 | LEFT  | DIRECT | 10000000 |  |  |
|46 | LEFT  | DIRECT | 20000000 |  |  |
|47 | LEFT  | DIRECT | 40000000 |  |  |
|48 | LEFT  | DIRECT | 80000000 | HLT| Stops to computer and sets it to manual mode | 
