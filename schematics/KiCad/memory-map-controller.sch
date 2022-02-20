EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 10
Title "Memory Map Controller"
Date "2021-10-22"
Rev "1.0"
Comp ""
Comment1 "DEVEN MARRERO"
Comment2 ""
Comment3 "2X 74C238"
Comment4 "1x 74HC08, 74HC04, 74HC02"
$EndDescr
Text HLabel 3100 6300 3    50   Input ~ 0
A0
Text HLabel 3000 6300 3    50   Input ~ 0
A1
Text HLabel 2900 6300 3    50   Input ~ 0
A2
Text HLabel 2800 6300 3    50   Input ~ 0
A3
Text HLabel 2700 6300 3    50   Input ~ 0
A4
Text HLabel 2600 6300 3    50   Input ~ 0
A5
Text HLabel 2500 6300 3    50   Input ~ 0
A6
Text HLabel 2400 6300 3    50   Input ~ 0
A7
Text HLabel 2300 6300 3    50   Input ~ 0
A8
Text HLabel 2200 6300 3    50   Input ~ 0
A9
Text HLabel 2100 6300 3    50   Input ~ 0
A10
Text HLabel 2000 6300 3    50   Input ~ 0
A11
Text HLabel 1900 6300 3    50   Input ~ 0
A12
Text HLabel 1800 6300 3    50   Input ~ 0
A13
Text HLabel 1700 6300 3    50   Input ~ 0
A14
Text HLabel 1600 6300 3    50   Input ~ 0
A15
Text HLabel 3100 1100 1    50   Input ~ 0
A0
Text HLabel 3000 1100 1    50   Input ~ 0
A1
Text HLabel 2900 1100 1    50   Input ~ 0
A2
Text HLabel 2800 1100 1    50   Input ~ 0
A3
Text HLabel 2700 1100 1    50   Input ~ 0
A4
Text HLabel 2600 1100 1    50   Input ~ 0
A5
Text HLabel 2500 1100 1    50   Input ~ 0
A6
Text HLabel 2400 1100 1    50   Input ~ 0
A7
Text HLabel 2300 1100 1    50   Input ~ 0
A8
Text HLabel 2200 1100 1    50   Input ~ 0
A9
Text HLabel 2100 1100 1    50   Input ~ 0
A10
Text HLabel 2000 1100 1    50   Input ~ 0
A11
Text HLabel 1900 1100 1    50   Input ~ 0
A12
Text HLabel 1800 1100 1    50   Input ~ 0
A13
Text HLabel 1700 1100 1    50   Input ~ 0
A14
Text HLabel 1600 1100 1    50   Input ~ 0
A15
Wire Wire Line
	2000 1100 2000 1800
Wire Wire Line
	1800 1100 1800 1600
Wire Wire Line
	1600 1100 1600 1200
Connection ~ 1600 1200
Wire Wire Line
	1600 1200 1600 1900
$Comp
L 4xxx:4002 U?
U 1 1 61758502
P 3650 1650
F 0 "U?" H 3650 2025 50  0000 C CNN
F 1 "4002" H 3650 1934 50  0000 C CNN
F 2 "" H 3650 1650 50  0001 C CNN
F 3 "http://www.intersil.com/content/dam/Intersil/documents/cd40/cd4000bms-01bms-02bms-25bms.pdf" H 3650 1650 50  0001 C CNN
	1    3650 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 1850 4100 1900
Wire Wire Line
	4100 1900 1600 1900
Wire Wire Line
	4100 1850 4300 1850
Connection ~ 1600 1900
Wire Wire Line
	1600 1900 1600 2500
Wire Wire Line
	3950 1650 4050 1650
Wire Wire Line
	3350 1500 1700 1500
Connection ~ 1700 1500
Wire Wire Line
	1700 1500 1700 1100
Wire Wire Line
	3350 1600 1800 1600
Connection ~ 1800 1600
Wire Wire Line
	1900 1700 3350 1700
Connection ~ 1900 1700
Wire Wire Line
	1900 1700 1900 1100
Wire Wire Line
	3350 1800 2000 1800
Connection ~ 2000 1800
$Comp
L 74xx:74HC04 U?
U 1 1 617669E4
P 4350 2300
F 0 "U?" H 4350 2617 50  0000 C CNN
F 1 "74HC04" H 4350 2526 50  0000 C CNN
F 2 "" H 4350 2300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4350 2300 50  0001 C CNN
	1    4350 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 2300 4050 1650
Connection ~ 4050 1650
Wire Wire Line
	4050 1650 4300 1650
Wire Wire Line
	4800 2300 4650 2300
Wire Wire Line
	4800 2500 1600 2500
Connection ~ 1600 2500
Wire Wire Line
	1600 1200 6050 1200
Wire Wire Line
	4900 1750 5700 1750
Wire Wire Line
	5400 2400 6050 2400
$Comp
L 74xx:74LS08 U?
U 1 1 617718E7
P 5100 2400
F 0 "U?" H 5100 2725 50  0000 C CNN
F 1 "74LS08" H 5100 2634 50  0000 C CNN
F 2 "" H 5100 2400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5100 2400 50  0001 C CNN
	1    5100 2400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U?
U 1 1 61771F44
P 4600 1750
F 0 "U?" H 4600 2075 50  0000 C CNN
F 1 "74LS08" H 4600 1984 50  0000 C CNN
F 2 "" H 4600 1750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 4600 1750 50  0001 C CNN
	1    4600 1750
	1    0    0    -1  
$EndComp
Text GLabel 6050 1200 2    79   Input ~ 0
~ROM
Text GLabel 6050 1750 2    79   Input ~ 0
IO
Text GLabel 6050 2400 2    79   Input ~ 0
~RAM
$Comp
L 8-Bit_Components:74HC238 U?
U 1 1 61776C5C
P 6200 3250
F 0 "U?" H 6200 3766 50  0000 C CNN
F 1 "74HC238" H 6200 3675 50  0000 C CNN
F 2 "" H 6200 3250 50  0001 C CNN
F 3 "https://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=https%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fcd74hc138" H 6200 3250 50  0001 C CNN
	1    6200 3250
	1    0    0    -1  
$EndComp
$Comp
L 8-Bit_Components:74HC238 U?
U 1 1 617794A4
P 4850 4550
F 0 "U?" H 4850 5066 50  0000 C CNN
F 1 "74HC238" H 4850 4975 50  0000 C CNN
F 2 "" H 4850 4550 50  0001 C CNN
F 3 "https://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=https%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fcd74hc138" H 4850 4550 50  0001 C CNN
	1    4850 4550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U?
U 1 1 6177AB08
P 3700 3050
F 0 "U?" H 3700 3367 50  0000 C CNN
F 1 "74HC04" H 3700 3276 50  0000 C CNN
F 2 "" H 3700 3050 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 3700 3050 50  0001 C CNN
	1    3700 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 4500 4500 4500
Wire Wire Line
	5850 3200 5700 3200
Wire Wire Line
	5700 3200 5700 3050
Connection ~ 5700 3050
Wire Wire Line
	5700 3050 5850 3050
Text HLabel 6800 3050 2    59   Input ~ 0
M_MAP_0
Text HLabel 6800 3150 2    59   Input ~ 0
M_MAP_1
Text HLabel 6800 3250 2    59   Input ~ 0
M_MAP_2
Text HLabel 6800 3350 2    59   Input ~ 0
M_MAP_3
Text HLabel 6800 3450 2    59   Input ~ 0
M_MAP_4
Text HLabel 6800 3550 2    59   Input ~ 0
M_MAP_5
Text HLabel 6800 3650 2    59   Input ~ 0
M_MAP_6
Text HLabel 6800 3750 2    59   Input ~ 0
M_MAP_7
Text HLabel 5450 4450 2    59   Input ~ 0
M_MAP_8
Text HLabel 5450 4550 2    59   Input ~ 0
M_MAP_9
Text HLabel 5450 4650 2    59   Input ~ 0
M_MAP_10
Text HLabel 5450 4750 2    59   Input ~ 0
M_MAP_11
Text HLabel 5450 4850 2    59   Input ~ 0
M_MAP_12
Text HLabel 5450 4950 2    59   Input ~ 0
M_MAP_13
Text HLabel 5450 5050 2    59   Input ~ 0
M_MAP_14
Text HLabel 5850 5650 2    59   Input ~ 0
M_MAP_15
$Comp
L 74xx:74LS08 U?
U 1 1 61792F25
P 3700 5650
F 0 "U?" H 3700 5975 50  0000 C CNN
F 1 "74LS08" H 3700 5884 50  0000 C CNN
F 2 "" H 3700 5650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 3700 5650 50  0001 C CNN
	1    3700 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 1100 3100 6300
Wire Wire Line
	3000 1100 3000 6300
Wire Wire Line
	2900 1100 2900 6300
Wire Wire Line
	2800 1100 2800 6300
Wire Wire Line
	2700 1100 2700 3600
Wire Wire Line
	2600 1100 2600 3700
Wire Wire Line
	2500 1100 2500 3800
Wire Wire Line
	2400 1100 2400 4900
Wire Wire Line
	2300 1100 2300 5000
Wire Wire Line
	2200 1100 2200 5100
Wire Wire Line
	2000 1800 2000 6300
Wire Wire Line
	1900 1700 1900 6300
Wire Wire Line
	1800 1600 1800 6300
Wire Wire Line
	1700 1500 1700 6300
Wire Wire Line
	1600 2500 1600 6300
Wire Wire Line
	3400 5750 2100 5750
Wire Wire Line
	3400 3050 3400 2650
Wire Wire Line
	3400 2650 5700 2650
Wire Wire Line
	5700 2650 5700 1750
Connection ~ 5700 1750
Wire Wire Line
	5700 1750 6050 1750
Wire Wire Line
	4000 3050 4050 3050
Wire Wire Line
	2100 1100 2100 4350
Connection ~ 2100 5750
Wire Wire Line
	2100 5750 2100 6300
Wire Wire Line
	5850 5650 4000 5650
Text Notes 6750 2900 0    67   ~ 0
16 Bit Map
Wire Notes Line width 8 style solid
	6750 2950 7300 2950
Wire Notes Line width 8 style solid
	7300 2950 7300 3850
Wire Notes Line width 8 style solid
	7300 3850 6750 3850
Wire Notes Line width 8 style solid
	6750 3850 6750 2950
Text Notes 5400 4300 0    67   ~ 0
128 Bit Map
Wire Notes Line width 8 style solid
	5400 4350 6000 4350
Wire Notes Line width 8 style solid
	6000 4350 6000 5150
Wire Notes Line width 8 style solid
	6000 5150 5400 5150
Wire Notes Line width 8 style solid
	5400 5150 5400 4350
Text Notes 5750 5500 0    67   ~ 0
1024 Bit Map
Wire Notes Line width 8 style solid
	5800 5550 6400 5550
Wire Notes Line width 8 style solid
	6400 5550 6400 5750
Wire Notes Line width 8 style solid
	6400 5750 5800 5750
Wire Notes Line width 8 style solid
	5800 5750 5800 5550
Wire Wire Line
	3400 3050 3400 4650
Connection ~ 3400 3050
Wire Wire Line
	4050 3050 4050 4500
Connection ~ 4050 3050
Wire Wire Line
	4050 3050 5700 3050
Wire Wire Line
	4500 4650 3400 4650
Connection ~ 3400 4650
Wire Wire Line
	3400 4650 3400 5550
Wire Wire Line
	4500 4350 2100 4350
Connection ~ 2100 4350
Wire Wire Line
	2100 4350 2100 5750
Wire Wire Line
	4500 5100 2200 5100
Connection ~ 2200 5100
Wire Wire Line
	2200 5100 2200 6300
Wire Wire Line
	4500 5000 2300 5000
Connection ~ 2300 5000
Wire Wire Line
	2300 5000 2300 6300
Wire Wire Line
	2400 4900 4500 4900
Connection ~ 2400 4900
Wire Wire Line
	2400 4900 2400 6300
Wire Wire Line
	5850 3600 2700 3600
Connection ~ 2700 3600
Wire Wire Line
	2700 3600 2700 6300
Wire Wire Line
	5850 3700 2600 3700
Connection ~ 2600 3700
Wire Wire Line
	2600 3700 2600 6300
Wire Wire Line
	2500 3800 5850 3800
Connection ~ 2500 3800
Wire Wire Line
	2500 3800 2500 6300
Wire Wire Line
	6550 3050 6800 3050
Wire Wire Line
	6800 3150 6550 3150
Wire Wire Line
	6550 3250 6800 3250
Wire Wire Line
	6800 3350 6550 3350
Wire Wire Line
	6550 3450 6800 3450
Wire Wire Line
	6800 3550 6550 3550
Wire Wire Line
	6550 3650 6800 3650
Wire Wire Line
	6800 3750 6550 3750
Wire Wire Line
	5200 4450 5450 4450
Wire Wire Line
	5450 4550 5200 4550
Wire Wire Line
	5200 4650 5450 4650
Wire Wire Line
	5450 4750 5200 4750
Wire Wire Line
	5200 4850 5450 4850
Wire Wire Line
	5450 4950 5200 4950
Wire Wire Line
	5200 5050 5450 5050
Text Notes 7450 1350 0    79   ~ 0
Memory Map controller\n4 input NOR can be 2x 2 input NOR + AND
Wire Wire Line
	5200 4350 5300 4350
Wire Wire Line
	5300 4350 5300 3350
Wire Wire Line
	5300 3350 5850 3350
$EndSCHEMATC
