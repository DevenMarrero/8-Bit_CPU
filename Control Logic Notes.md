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


Only one output active at a time: MDO, PRO, PCO, AO, FO, EO, TO, PBO, BO, CO, SOH, SOL  		12

Only one input  active at a time: MIH, MIL, MDI, II, PRI, PCI, AI, FI, TI, PBI, BI, CI, SIH, STL	14

LEFTOVER: HLT, SCR, PCE, ALU0, ALU1, ALU2, AL3, ALU4, SPE, UP/DOWN, FlagSelect				11
													--
													37



| Control Line Position | Bank | Group | Symbol | Notes |
| :-: | :-- | :-- | :-: | :-- |
|1  | RIGHT | LOW    | 00000001 |  |
|2  | RIGHT | LOW    | 00000002 |  |
|3  | RIGHT | LOW    | 00000003 |  |
|4  | RIGHT | LOW    | 00000004 |  |
|5  | RIGHT | LOW    | 00000005 |  |
|6  | RIGHT | LOW    | 00000006 |  |
|7  | RIGHT | LOW    | 00000007 |  |
|8  | RIGHT | HIGH   | 00000008 |  |
|9  | RIGHT | HIGH   | 00000009 |  |
|10 | RIGHT | HIGH   | 0000000A |  |
|11 | RIGHT | HIGH   | 0000000B |  |
|12 | RIGHT | HIGH   | 0000000C |  |
|13 | RIGHT | HIGH   | 0000000D |  |
|14 | RIGHT | HIGH   | 0000000E |  |
|15 | RIGHT | DIRECT | 0000000x |  |
|16 | RIGHT | DIRECT | 0000000x |  |
|17 | RIGHT | DIRECT | 0000000x |  |
|18 | RIGHT | DIRECT | 0000000x |  |
|19 | RIGHT | DIRECT | 0000000x |  |
|20 | RIGHT | DIRECT |  |  |
|21 | RIGHT | DIRECT |  |  |
|22 | RIGHT | DIRECT |  |  |
|23 | RIGHT | DIRECT |  |  |
|24 | RIGHT | DIRECT |  |  |
|25 | LEFT | LOW |  |  |
