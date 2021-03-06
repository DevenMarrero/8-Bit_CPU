EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 10 10
Title "GENERAL REGISTERS"
Date "2021-10-05"
Rev "1.0"
Comp ""
Comment1 "DEVEN MARRERO"
Comment2 ""
Comment3 ""
Comment4 "1x 74HC245, 74HC377"
$EndDescr
$Comp
L 8-Bit_Components:74HC245 U70
U 1 1 615D9411
P 5250 3400
F 0 "U70" V 5204 4244 50  0000 L CNN
F 1 "74HC245" V 5295 4244 50  0000 L CNN
F 2 "" H 5250 3400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 5250 3400 50  0001 C CNN
	1    5250 3400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7000 4200 5900 4200
Wire Wire Line
	7100 4250 6050 4250
Wire Wire Line
	7200 4300 6200 4300
Wire Wire Line
	7400 4400 6500 4400
Wire Wire Line
	7500 4450 6650 4450
Wire Wire Line
	4750 4500 6800 4500
$Comp
L power:GND #PWR0213
U 1 1 615EBAD3
P 6050 3400
F 0 "#PWR0213" H 6050 3150 50  0001 C CNN
F 1 "GND" H 6055 3227 50  0000 C CNN
F 2 "" H 6050 3400 50  0001 C CNN
F 3 "" H 6050 3400 50  0001 C CNN
	1    6050 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0214
U 1 1 615ED567
P 6300 3400
F 0 "#PWR0214" H 6300 3150 50  0001 C CNN
F 1 "GND" H 6305 3227 50  0000 C CNN
F 2 "" H 6300 3400 50  0001 C CNN
F 3 "" H 6300 3400 50  0001 C CNN
	1    6300 3400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0215
U 1 1 615EFCD6
P 7900 3400
F 0 "#PWR0215" H 7900 3250 50  0001 C CNN
F 1 "+5V" H 7915 3573 50  0000 C CNN
F 2 "" H 7900 3400 50  0001 C CNN
F 3 "" H 7900 3400 50  0001 C CNN
	1    7900 3400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0216
U 1 1 615F0E41
P 4450 3400
F 0 "#PWR0216" H 4450 3250 50  0001 C CNN
F 1 "+5V" H 4465 3573 50  0000 C CNN
F 2 "" H 4450 3400 50  0001 C CNN
F 3 "" H 4450 3400 50  0001 C CNN
	1    4450 3400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0217
U 1 1 615F3C21
P 5650 3900
F 0 "#PWR0217" H 5650 3750 50  0001 C CNN
F 1 "+5V" H 5665 4073 50  0000 C CNN
F 2 "" H 5650 3900 50  0001 C CNN
F 3 "" H 5650 3900 50  0001 C CNN
	1    5650 3900
	-1   0    0    1   
$EndComp
Wire Wire Line
	6900 3900 6900 4150
Wire Wire Line
	7000 3900 7000 4200
Wire Wire Line
	7100 3900 7100 4250
Wire Wire Line
	7200 3900 7200 4300
Wire Wire Line
	7300 3900 7300 4350
Wire Wire Line
	7400 3900 7400 4400
Wire Wire Line
	7500 3900 7500 4450
Wire Wire Line
	7600 3900 7600 4500
Wire Wire Line
	5450 3900 5450 4150
Wire Wire Line
	5350 3900 5350 4200
Wire Wire Line
	5250 3900 5250 4250
Wire Wire Line
	5150 3900 5150 4300
Wire Wire Line
	5050 3900 5050 4350
Wire Wire Line
	4950 3900 4950 4400
Wire Wire Line
	4850 3900 4850 4450
Wire Wire Line
	4750 3900 4750 4500
Wire Wire Line
	4750 2900 4750 2800
Wire Wire Line
	4750 2800 3750 2800
Wire Wire Line
	4750 2800 7600 2800
Wire Wire Line
	7600 2800 7600 2900
Connection ~ 4750 2800
Wire Wire Line
	4850 2900 4850 2750
Wire Wire Line
	4850 2750 3750 2750
Wire Wire Line
	4950 2900 4950 2700
Wire Wire Line
	4950 2700 3750 2700
Wire Wire Line
	5050 2900 5050 2650
Wire Wire Line
	5050 2650 3750 2650
Wire Wire Line
	5150 2900 5150 2600
Wire Wire Line
	5150 2600 3750 2600
Wire Wire Line
	5250 2900 5250 2550
Wire Wire Line
	5250 2550 3750 2550
Wire Wire Line
	5350 2900 5350 2500
Wire Wire Line
	5350 2500 3750 2500
Wire Wire Line
	5450 2900 5450 2450
Wire Wire Line
	5450 2450 3750 2450
Wire Wire Line
	4850 2750 7500 2750
Wire Wire Line
	7500 2750 7500 2900
Connection ~ 4850 2750
Wire Wire Line
	7400 2900 7400 2700
Wire Wire Line
	7400 2700 4950 2700
Connection ~ 4950 2700
Wire Wire Line
	5050 2650 7300 2650
Wire Wire Line
	7300 2650 7300 2900
Connection ~ 5050 2650
Wire Wire Line
	7200 2900 7200 2600
Wire Wire Line
	7200 2600 5150 2600
Connection ~ 5150 2600
Wire Wire Line
	5250 2550 7100 2550
Wire Wire Line
	7100 2550 7100 2900
Connection ~ 5250 2550
Wire Wire Line
	7000 2900 7000 2500
Wire Wire Line
	7000 2500 5350 2500
Connection ~ 5350 2500
Wire Wire Line
	6900 2900 6900 2450
Wire Wire Line
	6900 2450 5450 2450
Connection ~ 5450 2450
Text GLabel 3750 2800 0    28   Input ~ 0
BUS_0
Text GLabel 3750 2750 0    28   Input ~ 0
BUS_1
Text GLabel 3750 2700 0    28   Input ~ 0
BUS_2
Text GLabel 3750 2650 0    28   Input ~ 0
BUS_3
Text GLabel 3750 2600 0    28   Input ~ 0
BUS_4
Text GLabel 3750 2550 0    28   Input ~ 0
BUS_5
Text GLabel 3750 2500 0    28   Input ~ 0
BUS_6
Text GLabel 3750 2450 0    28   Input ~ 0
BUS_7
Wire Wire Line
	5750 3900 6200 3900
Wire Wire Line
	6200 3900 6200 2050
Wire Wire Line
	6200 2050 3750 2050
Wire Wire Line
	6700 2900 6700 1750
Wire Wire Line
	6700 1750 3750 1750
Wire Wire Line
	6600 2900 6600 1900
Wire Wire Line
	6600 1900 3750 1900
Text GLabel 3750 2050 0    50   Input ~ 0
~OE
Text GLabel 3750 1900 0    50   Input ~ 0
CLK
Text GLabel 3750 1750 0    50   Input ~ 0
~WE
$Comp
L Device:LED D8
U 1 1 616454FB
P 6800 4800
F 0 "D8" V 6793 4682 50  0001 R CNN
F 1 "LED" V 6748 4682 50  0001 R CNN
F 2 "" H 6800 4800 50  0001 C CNN
F 3 "~" H 6800 4800 50  0001 C CNN
	1    6800 4800
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R23
U 1 1 616463F7
P 6800 5100
F 0 "R23" H 6870 5146 50  0001 L CNN
F 1 "R" H 6870 5100 50  0001 L CNN
F 2 "" V 6730 5100 50  0001 C CNN
F 3 "~" H 6800 5100 50  0001 C CNN
	1    6800 5100
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D7
U 1 1 616495DB
P 6650 4800
F 0 "D7" V 6643 4682 50  0001 R CNN
F 1 "LED" V 6598 4682 50  0001 R CNN
F 2 "" H 6650 4800 50  0001 C CNN
F 3 "~" H 6650 4800 50  0001 C CNN
	1    6650 4800
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R22
U 1 1 61649946
P 6650 5100
F 0 "R22" H 6720 5146 50  0001 L CNN
F 1 "R" H 6720 5100 50  0001 L CNN
F 2 "" V 6580 5100 50  0001 C CNN
F 3 "~" H 6650 5100 50  0001 C CNN
	1    6650 5100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R21
U 1 1 6164A7FB
P 6500 5100
F 0 "R21" H 6570 5146 50  0001 L CNN
F 1 "R" H 6570 5100 50  0001 L CNN
F 2 "" V 6430 5100 50  0001 C CNN
F 3 "~" H 6500 5100 50  0001 C CNN
	1    6500 5100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R20
U 1 1 6164AA77
P 6350 5100
F 0 "R20" H 6420 5146 50  0001 L CNN
F 1 "R" H 6420 5100 50  0001 L CNN
F 2 "" V 6280 5100 50  0001 C CNN
F 3 "~" H 6350 5100 50  0001 C CNN
	1    6350 5100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R19
U 1 1 6164ADFC
P 6200 5100
F 0 "R19" H 6270 5146 50  0001 L CNN
F 1 "R" H 6270 5100 50  0001 L CNN
F 2 "" V 6130 5100 50  0001 C CNN
F 3 "~" H 6200 5100 50  0001 C CNN
	1    6200 5100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R18
U 1 1 6164B0E4
P 6050 5100
F 0 "R18" H 6120 5146 50  0001 L CNN
F 1 "R" H 6120 5100 50  0001 L CNN
F 2 "" V 5980 5100 50  0001 C CNN
F 3 "~" H 6050 5100 50  0001 C CNN
	1    6050 5100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R17
U 1 1 6164B4C3
P 5900 5100
F 0 "R17" H 5970 5146 50  0001 L CNN
F 1 "R" H 5970 5100 50  0001 L CNN
F 2 "" V 5830 5100 50  0001 C CNN
F 3 "~" H 5900 5100 50  0001 C CNN
	1    5900 5100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R16
U 1 1 6164B723
P 5750 5100
F 0 "R16" H 5820 5146 50  0001 L CNN
F 1 "R" H 5820 5100 50  0001 L CNN
F 2 "" V 5680 5100 50  0001 C CNN
F 3 "~" H 5750 5100 50  0001 C CNN
	1    5750 5100
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D6
U 1 1 6164B9C8
P 6500 4800
F 0 "D6" V 6493 4682 50  0001 R CNN
F 1 "LED" V 6448 4682 50  0001 R CNN
F 2 "" H 6500 4800 50  0001 C CNN
F 3 "~" H 6500 4800 50  0001 C CNN
	1    6500 4800
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D5
U 1 1 6164BE59
P 6350 4800
F 0 "D5" V 6343 4682 50  0001 R CNN
F 1 "LED" V 6298 4682 50  0001 R CNN
F 2 "" H 6350 4800 50  0001 C CNN
F 3 "~" H 6350 4800 50  0001 C CNN
	1    6350 4800
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D4
U 1 1 6164C262
P 6200 4800
F 0 "D4" V 6193 4682 50  0001 R CNN
F 1 "LED" V 6148 4682 50  0001 R CNN
F 2 "" H 6200 4800 50  0001 C CNN
F 3 "~" H 6200 4800 50  0001 C CNN
	1    6200 4800
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D3
U 1 1 6164C591
P 6050 4800
F 0 "D3" V 6043 4682 50  0001 R CNN
F 1 "LED" V 5998 4682 50  0001 R CNN
F 2 "" H 6050 4800 50  0001 C CNN
F 3 "~" H 6050 4800 50  0001 C CNN
	1    6050 4800
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D2
U 1 1 6164C946
P 5900 4800
F 0 "D2" V 5893 4682 50  0001 R CNN
F 1 "LED" V 5848 4682 50  0001 R CNN
F 2 "" H 5900 4800 50  0001 C CNN
F 3 "~" H 5900 4800 50  0001 C CNN
	1    5900 4800
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D1
U 1 1 6164CC32
P 5750 4800
F 0 "D1" V 5743 4682 50  0001 R CNN
F 1 "LED" V 5698 4682 50  0001 R CNN
F 2 "" H 5750 4800 50  0001 C CNN
F 3 "~" H 5750 4800 50  0001 C CNN
	1    5750 4800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6800 4500 6800 4650
Connection ~ 6800 4500
Wire Wire Line
	6800 4500 7600 4500
Wire Wire Line
	6650 4650 6650 4450
Connection ~ 6650 4450
Wire Wire Line
	6650 4450 4850 4450
Wire Wire Line
	6500 4650 6500 4400
Connection ~ 6500 4400
Wire Wire Line
	6500 4400 4950 4400
Wire Wire Line
	6350 4650 6350 4350
Wire Wire Line
	5050 4350 6350 4350
Connection ~ 6350 4350
Wire Wire Line
	6350 4350 7300 4350
Wire Wire Line
	6200 4650 6200 4300
Connection ~ 6200 4300
Wire Wire Line
	6200 4300 5150 4300
Wire Wire Line
	6050 4650 6050 4250
Connection ~ 6050 4250
Wire Wire Line
	6050 4250 5250 4250
Wire Wire Line
	5900 4650 5900 4200
Connection ~ 5900 4200
Wire Wire Line
	5900 4200 5350 4200
Wire Wire Line
	5750 4650 5750 4150
Wire Wire Line
	5450 4150 5750 4150
Connection ~ 5750 4150
Wire Wire Line
	5750 4150 6900 4150
Wire Wire Line
	6800 5250 6800 5300
Wire Wire Line
	6800 5300 6650 5300
Wire Wire Line
	5750 5250 5750 5300
Connection ~ 5750 5300
Wire Wire Line
	5750 5300 5550 5300
Wire Wire Line
	5900 5250 5900 5300
Connection ~ 5900 5300
Wire Wire Line
	5900 5300 5750 5300
Wire Wire Line
	6050 5250 6050 5300
Connection ~ 6050 5300
Wire Wire Line
	6050 5300 5900 5300
Wire Wire Line
	6200 5250 6200 5300
Connection ~ 6200 5300
Wire Wire Line
	6200 5300 6050 5300
Wire Wire Line
	6350 5250 6350 5300
Connection ~ 6350 5300
Wire Wire Line
	6350 5300 6200 5300
Wire Wire Line
	6500 5250 6500 5300
Connection ~ 6500 5300
Wire Wire Line
	6500 5300 6350 5300
Wire Wire Line
	6650 5250 6650 5300
Connection ~ 6650 5300
Wire Wire Line
	6650 5300 6500 5300
$Comp
L power:GND #PWR0218
U 1 1 6166FA08
P 5550 5300
F 0 "#PWR0218" H 5550 5050 50  0001 C CNN
F 1 "GND" V 5555 5172 50  0000 R CNN
F 2 "" H 5550 5300 50  0001 C CNN
F 3 "" H 5550 5300 50  0001 C CNN
	1    5550 5300
	0    1    1    0   
$EndComp
$Comp
L 8-Bit_Components:74HC377 U71
U 1 1 6211EAE4
P 7100 3400
F 0 "U71" V 7054 4244 50  0000 L CNN
F 1 "74HC377" V 7145 4244 50  0000 L CNN
F 2 "" H 7100 3950 50  0001 C CNN
F 3 "" H 7100 3950 50  0001 C CNN
	1    7100 3400
	0    1    1    0   
$EndComp
$EndSCHEMATC
