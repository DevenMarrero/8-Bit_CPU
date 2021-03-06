EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 8 10
Title "RAM ROM"
Date "2021-10-17"
Rev "1.0"
Comp ""
Comment1 "DEVEN MARRERO"
Comment2 ""
Comment3 "2x 74HC00, 74HC257"
Comment4 "1x AT28C256, AS6C62256, 74HC245"
$EndDescr
$Comp
L 8-Bit_Components:AS6C62256 U54
U 1 1 616C7737
P 4950 2250
F 0 "U54" V 4904 3494 50  0000 L CNN
F 1 "AS6C62256" V 4995 3494 50  0000 L CNN
F 2 "" V 5200 2200 50  0001 C CNN
F 3 "https://www.alliancememory.com/wp-content/uploads/pdf/AS6C62256.pdf" V 5200 2200 50  0001 C CNN
	1    4950 2250
	0    1    1    0   
$EndComp
$Comp
L 8-Bit_Components:AT28C256 U52
U 1 1 616CCA79
P 2000 2250
F 0 "U52" V 1954 3494 50  0000 L CNN
F 1 "AT28C256" V 2045 3494 50  0000 L CNN
F 2 "" H 2400 2000 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/AT28C256-%E2%80%93-Industrial-Grade-256-Kbit-(32,768-x-8)-Paged-Parallel-EEPROM.pdf" H 2400 2000 50  0001 C CNN
	1    2000 2250
	0    1    1    0   
$EndComp
$Comp
L 74xx:74LS257 U51
U 1 1 616D1DB5
P 1900 4350
F 0 "U51" V 1946 3306 50  0000 R CNN
F 1 "74LS257" V 1855 3306 50  0000 R CNN
F 2 "" H 1900 4350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS257" H 1900 4350 50  0001 C CNN
	1    1900 4350
	0    -1   -1   0   
$EndComp
$Comp
L 74xx:74LS257 U53
U 1 1 616D3491
P 4250 4350
F 0 "U53" V 4296 3306 50  0000 R CNN
F 1 "74LS257" V 4205 3306 50  0000 R CNN
F 2 "" H 4250 4350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS257" H 4250 4350 50  0001 C CNN
	1    4250 4350
	0    -1   -1   0   
$EndComp
$Comp
L 8-Bit_Components:74HC245 U55
U 1 1 616D53AF
P 6600 4350
F 0 "U55" V 6554 5194 50  0000 L CNN
F 1 "74HC245" V 6645 5194 50  0000 L CNN
F 2 "" H 6600 4350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 6600 4350 50  0001 C CNN
	1    6600 4350
	0    1    1    0   
$EndComp
Text Notes 4300 1700 0    79   ~ 0
16 Address Bus
Text Notes 1350 1700 0    79   ~ 0
16 Address Bus
Wire Wire Line
	6400 4850 6400 4900
Wire Wire Line
	6400 4900 7550 4900
Wire Wire Line
	6500 4850 6500 4950
Wire Wire Line
	6500 4950 7550 4950
Wire Wire Line
	6600 4850 6600 5000
Wire Wire Line
	6600 5000 7550 5000
Wire Wire Line
	6700 4850 6700 5050
Wire Wire Line
	6700 5050 7550 5050
Wire Wire Line
	6800 4850 6800 5100
Wire Wire Line
	6800 5100 7550 5100
Wire Wire Line
	6900 4850 6900 5150
Wire Wire Line
	6900 5150 7550 5150
Wire Wire Line
	7000 4850 7000 5200
Wire Wire Line
	7000 5200 7550 5200
Wire Wire Line
	7100 4850 7100 5250
Wire Wire Line
	7100 5250 7550 5250
Wire Wire Line
	7100 5250 4650 5250
Wire Wire Line
	4650 5250 4650 4850
Connection ~ 7100 5250
Wire Wire Line
	7000 5200 4350 5200
Wire Wire Line
	4350 5200 4350 4850
Connection ~ 7000 5200
Wire Wire Line
	6900 5150 4050 5150
Wire Wire Line
	4050 5150 4050 4850
Connection ~ 6900 5150
Wire Wire Line
	6800 5100 3750 5100
Wire Wire Line
	3750 5100 3750 4850
Connection ~ 6800 5100
Wire Wire Line
	6700 5050 2300 5050
Wire Wire Line
	2300 5050 2300 4850
Connection ~ 6700 5050
Wire Wire Line
	6600 5000 2000 5000
Wire Wire Line
	2000 5000 2000 4850
Connection ~ 6600 5000
Wire Wire Line
	6500 4950 1700 4950
Wire Wire Line
	1700 4950 1700 4850
Connection ~ 6500 4950
Wire Wire Line
	6400 4900 1400 4900
Wire Wire Line
	1400 4900 1400 4850
Connection ~ 6400 4900
Text Notes 7600 5100 0    59   ~ 0
8 Data Bus
Wire Wire Line
	5150 2750 5150 2800
Wire Wire Line
	5150 2800 4550 2800
Wire Wire Line
	2200 2800 2200 2750
Wire Wire Line
	5250 2750 5250 2850
Wire Wire Line
	5250 2850 4250 2850
Wire Wire Line
	2300 2850 2300 2750
Wire Wire Line
	5350 2750 5350 2900
Wire Wire Line
	5350 2900 3950 2900
Wire Wire Line
	2400 2900 2400 2750
Wire Wire Line
	5450 2750 5450 2950
Wire Wire Line
	5450 2950 3650 2950
Wire Wire Line
	2500 2950 2500 2750
Wire Wire Line
	5550 2750 5550 3000
Wire Wire Line
	5550 3000 2600 3000
Wire Wire Line
	2600 3000 2600 2750
Wire Wire Line
	5650 2750 5650 3050
Wire Wire Line
	5650 3050 2700 3050
Wire Wire Line
	2700 3050 2700 2750
Wire Wire Line
	5750 2750 5750 3100
Wire Wire Line
	5750 3100 2800 3100
Wire Wire Line
	2800 3100 2800 2750
Wire Wire Line
	5850 2750 5850 3150
Wire Wire Line
	5850 3150 2900 3150
Wire Wire Line
	2900 3150 2900 2750
Wire Wire Line
	5150 2800 7100 2800
Wire Wire Line
	7100 2800 7100 3850
Connection ~ 5150 2800
Wire Wire Line
	5250 2850 7000 2850
Wire Wire Line
	7000 2850 7000 3850
Connection ~ 5250 2850
Wire Wire Line
	5350 2900 6900 2900
Wire Wire Line
	6900 2900 6900 3850
Connection ~ 5350 2900
Wire Wire Line
	5450 2950 6800 2950
Wire Wire Line
	6800 2950 6800 3850
Connection ~ 5450 2950
Wire Wire Line
	5550 3000 6700 3000
Wire Wire Line
	6700 3000 6700 3850
Connection ~ 5550 3000
Wire Wire Line
	5650 3050 6600 3050
Wire Wire Line
	6600 3050 6600 3850
Connection ~ 5650 3050
Wire Wire Line
	5750 3100 6500 3100
Wire Wire Line
	6500 3100 6500 3850
Connection ~ 5750 3100
Wire Wire Line
	5850 3150 6400 3150
Wire Wire Line
	6400 3150 6400 3850
Connection ~ 5850 3150
Wire Wire Line
	4550 3850 4550 2800
Connection ~ 4550 2800
Wire Wire Line
	4550 2800 2200 2800
Wire Wire Line
	4250 3850 4250 2850
Connection ~ 4250 2850
Wire Wire Line
	4250 2850 2300 2850
Wire Wire Line
	3950 3850 3950 2900
Connection ~ 3950 2900
Wire Wire Line
	3950 2900 2400 2900
Wire Wire Line
	3650 3850 3650 2950
Connection ~ 3650 2950
Wire Wire Line
	3650 2950 2500 2950
Wire Wire Line
	1300 3850 1300 3150
Wire Wire Line
	1300 3150 2900 3150
Connection ~ 2900 3150
Wire Wire Line
	1600 3850 1600 3100
Wire Wire Line
	1600 3100 2800 3100
Connection ~ 2800 3100
Wire Wire Line
	1900 3850 1900 3050
Wire Wire Line
	1900 3050 2700 3050
Connection ~ 2700 3050
Wire Wire Line
	2200 3850 2200 3000
Wire Wire Line
	2200 3000 2600 3000
Connection ~ 2600 3000
$Comp
L power:GND #PWR0182
U 1 1 6172817C
P 800 2250
F 0 "#PWR0182" H 800 2000 50  0001 C CNN
F 1 "GND" H 805 2077 50  0000 C CNN
F 2 "" H 800 2250 50  0001 C CNN
F 3 "" H 800 2250 50  0001 C CNN
	1    800  2250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0183
U 1 1 617284BF
P 5800 4350
F 0 "#PWR0183" H 5800 4100 50  0001 C CNN
F 1 "GND" H 5805 4177 50  0000 C CNN
F 2 "" H 5800 4350 50  0001 C CNN
F 3 "" H 5800 4350 50  0001 C CNN
	1    5800 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0184
U 1 1 61729853
P 5250 4350
F 0 "#PWR0184" H 5250 4100 50  0001 C CNN
F 1 "GND" H 5255 4177 50  0000 C CNN
F 2 "" H 5250 4350 50  0001 C CNN
F 3 "" H 5250 4350 50  0001 C CNN
	1    5250 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0185
U 1 1 6172B0D3
P 2900 4350
F 0 "#PWR0185" H 2900 4100 50  0001 C CNN
F 1 "GND" H 2905 4177 50  0000 C CNN
F 2 "" H 2900 4350 50  0001 C CNN
F 3 "" H 2900 4350 50  0001 C CNN
	1    2900 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0186
U 1 1 6172C1CB
P 3750 2250
F 0 "#PWR0186" H 3750 2000 50  0001 C CNN
F 1 "GND" H 3755 2077 50  0000 C CNN
F 2 "" H 3750 2250 50  0001 C CNN
F 3 "" H 3750 2250 50  0001 C CNN
	1    3750 2250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0187
U 1 1 6172EF0A
P 3200 2250
F 0 "#PWR0187" H 3200 2100 50  0001 C CNN
F 1 "+5V" H 3215 2423 50  0000 C CNN
F 2 "" H 3200 2250 50  0001 C CNN
F 3 "" H 3200 2250 50  0001 C CNN
	1    3200 2250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0188
U 1 1 61731096
P 6150 2250
F 0 "#PWR0188" H 6150 2100 50  0001 C CNN
F 1 "+5V" H 6165 2423 50  0000 C CNN
F 2 "" H 6150 2250 50  0001 C CNN
F 3 "" H 6150 2250 50  0001 C CNN
	1    6150 2250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0189
U 1 1 61731E92
P 7400 4350
F 0 "#PWR0189" H 7400 4200 50  0001 C CNN
F 1 "+5V" H 7415 4523 50  0000 C CNN
F 2 "" H 7400 4350 50  0001 C CNN
F 3 "" H 7400 4350 50  0001 C CNN
	1    7400 4350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0190
U 1 1 617324E0
P 3350 4350
F 0 "#PWR0190" H 3350 4200 50  0001 C CNN
F 1 "+5V" H 3365 4523 50  0000 C CNN
F 2 "" H 3350 4350 50  0001 C CNN
F 3 "" H 3350 4350 50  0001 C CNN
	1    3350 4350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0191
U 1 1 617332B9
P 1000 4350
F 0 "#PWR0191" H 1000 4200 50  0001 C CNN
F 1 "+5V" H 1015 4523 50  0000 C CNN
F 2 "" H 1000 4350 50  0001 C CNN
F 3 "" H 1000 4350 50  0001 C CNN
	1    1000 4350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0192
U 1 1 61734C53
P 6200 3850
F 0 "#PWR0192" H 6200 3700 50  0001 C CNN
F 1 "+5V" H 6215 4023 50  0000 C CNN
F 2 "" H 6200 3850 50  0001 C CNN
F 3 "" H 6200 3850 50  0001 C CNN
	1    6200 3850
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_DIP_x08 SW7
U 1 1 617374FC
P 900 5550
F 0 "SW7" H 900 4983 50  0000 C CNN
F 1 "SW_DIP_x08" H 900 5074 50  0000 C CNN
F 2 "" H 900 5550 50  0001 C CNN
F 3 "~" H 900 5550 50  0001 C CNN
	1    900  5550
	-1   0    0    1   
$EndComp
Wire Wire Line
	600  5250 600  5350
Wire Wire Line
	600  5450 600  5550
Wire Wire Line
	600  5650 600  5750
Wire Wire Line
	600  5850 600  5750
Connection ~ 600  5750
Wire Wire Line
	600  5550 600  5650
Connection ~ 600  5550
Connection ~ 600  5650
Wire Wire Line
	600  5450 600  5350
Connection ~ 600  5450
Connection ~ 600  5350
Wire Wire Line
	600  5850 600  5950
Connection ~ 600  5850
Wire Wire Line
	600  5950 600  6050
Connection ~ 600  5950
$Comp
L power:GND #PWR0193
U 1 1 6176110D
P 600 6050
F 0 "#PWR0193" H 600 5800 50  0001 C CNN
F 1 "GND" H 605 5877 50  0000 C CNN
F 2 "" H 600 6050 50  0001 C CNN
F 3 "" H 600 6050 50  0001 C CNN
	1    600  6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 5250 1300 5250
Wire Wire Line
	1200 5350 1600 5350
Wire Wire Line
	1200 5450 1900 5450
Wire Wire Line
	1200 5550 2200 5550
Wire Wire Line
	1200 5650 3650 5650
Wire Wire Line
	1200 5750 3950 5750
Wire Wire Line
	1200 5850 4250 5850
Wire Wire Line
	1200 5950 4550 5950
Wire Wire Line
	1300 5250 1300 4850
Wire Wire Line
	1600 5350 1600 4850
Wire Wire Line
	1900 5450 1900 4850
Wire Wire Line
	2200 5550 2200 4850
Wire Wire Line
	3650 5650 3650 4850
Wire Wire Line
	3950 5750 3950 4850
Wire Wire Line
	4250 5850 4250 4850
Wire Wire Line
	4550 5950 4550 4850
Text GLabel 10600 1250 2    79   Input ~ 0
CLK
Text GLabel 10600 1450 2    79   Input ~ 0
MDi
Text GLabel 5950 3750 0    79   Input ~ 0
MDo
Text GLabel 10600 1700 2    79   Input ~ 0
~PROG
Text GLabel 10600 2150 2    79   Input ~ 0
~PB
$Comp
L 74xx:74LS00 U61
U 1 1 6178A028
P 10050 1350
F 0 "U61" H 10050 1033 50  0000 C CNN
F 1 "74LS00" H 10050 1124 50  0000 C CNN
F 2 "" H 10050 1350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 10050 1350 50  0001 C CNN
	1    10050 1350
	-1   0    0    1   
$EndComp
Wire Wire Line
	10600 1250 10350 1250
Wire Wire Line
	10600 1450 10350 1450
$Comp
L 74xx:74LS00 U59
U 1 1 617A397D
P 9300 1450
F 0 "U59" H 9300 1133 50  0000 C CNN
F 1 "74LS00" H 9300 1224 50  0000 C CNN
F 2 "" H 9300 1450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 9300 1450 50  0001 C CNN
	1    9300 1450
	-1   0    0    1   
$EndComp
Wire Wire Line
	9600 1350 9750 1350
$Comp
L 74xx:74LS00 U57
U 1 1 617AF815
P 8600 1750
F 0 "U57" H 8600 1433 50  0000 C CNN
F 1 "74LS00" H 8600 1524 50  0000 C CNN
F 2 "" H 8600 1750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 8600 1750 50  0001 C CNN
	1    8600 1750
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74LS00 U60
U 1 1 617B1DE9
P 9300 2050
F 0 "U60" H 9300 1733 50  0000 C CNN
F 1 "74LS00" H 9300 1824 50  0000 C CNN
F 2 "" H 9300 2050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 9300 2050 50  0001 C CNN
	1    9300 2050
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74AHC04 U62
U 1 1 617B90E7
P 10050 1950
F 0 "U62" H 10050 1633 50  0000 C CNN
F 1 "74AHC04" H 10050 1724 50  0000 C CNN
F 2 "" H 10050 1950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74AHC_AHCT04.pdf" H 10050 1950 50  0001 C CNN
	1    10050 1950
	-1   0    0    1   
$EndComp
Wire Wire Line
	10600 1700 10500 1700
Wire Wire Line
	10500 1700 10500 1550
Wire Wire Line
	9600 1550 10350 1550
Wire Wire Line
	10350 1550 10350 1950
Connection ~ 10350 1550
Wire Wire Line
	10350 1550 10500 1550
Wire Wire Line
	9750 1950 9600 1950
Wire Wire Line
	10600 2150 9600 2150
Wire Wire Line
	9000 2050 9000 1850
Wire Wire Line
	9000 1850 8900 1850
Wire Wire Line
	8900 1650 9000 1650
Wire Wire Line
	9000 1650 9000 1450
Text Notes 8750 950  0    71   ~ 0
Control logic for when RAM/ROM\n is reading/writing
$Comp
L 74xx:74HC00 U63
U 1 1 617E0B76
P 10050 2950
F 0 "U63" H 10050 2633 50  0000 C CNN
F 1 "74HC00" H 10050 2724 50  0000 C CNN
F 2 "" H 10050 2950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 10050 2950 50  0001 C CNN
	1    10050 2950
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74HC00 U58
U 1 1 617E3BD6
P 8900 2950
F 0 "U58" H 8900 2633 50  0000 C CNN
F 1 "74HC00" H 8900 2724 50  0000 C CNN
F 2 "" H 8900 2950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 8900 2950 50  0001 C CNN
	1    8900 2950
	-1   0    0    1   
$EndComp
$Comp
L Device:R R14
U 1 1 617E99C4
P 9450 3200
F 0 "R14" H 9520 3246 50  0000 L CNN
F 1 "1k" H 9520 3155 50  0000 L CNN
F 2 "" V 9380 3200 50  0001 C CNN
F 3 "~" H 9450 3200 50  0001 C CNN
	1    9450 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C9
U 1 1 617EB616
P 9600 2950
F 0 "C9" V 9348 2950 50  0000 C CNN
F 1 "0.01uf" V 9439 2950 50  0000 C CNN
F 2 "" H 9638 2800 50  0001 C CNN
F 3 "~" H 9600 2950 50  0001 C CNN
	1    9600 2950
	0    1    1    0   
$EndComp
Wire Wire Line
	9450 2950 9450 3050
Wire Wire Line
	9250 2850 9200 2850
Wire Wire Line
	9250 3050 9200 3050
Wire Wire Line
	9250 2850 9250 2950
Wire Wire Line
	9450 2950 9250 2950
Connection ~ 9450 2950
Connection ~ 9250 2950
Wire Wire Line
	9250 2950 9250 3050
$Comp
L power:GND #PWR0194
U 1 1 61802042
P 9450 3350
F 0 "#PWR0194" H 9450 3100 50  0001 C CNN
F 1 "GND" H 9455 3177 50  0000 C CNN
F 2 "" H 9450 3350 50  0001 C CNN
F 3 "" H 9450 3350 50  0001 C CNN
	1    9450 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 2550 10400 2850
Wire Wire Line
	10400 2850 10350 2850
$Comp
L 74xx:74HC00 U56
U 1 1 61841E9D
P 8000 2700
F 0 "U56" H 8000 2383 50  0000 C CNN
F 1 "74HC00" H 8000 2474 50  0000 C CNN
F 2 "" H 8000 2700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 8000 2700 50  0001 C CNN
	1    8000 2700
	-1   0    0    1   
$EndComp
Wire Wire Line
	8300 1750 8250 1750
Wire Wire Line
	8250 1750 8250 2300
Wire Wire Line
	8250 2300 10500 2300
Wire Wire Line
	10500 2300 10500 3050
Wire Wire Line
	10500 3050 10350 3050
Text Notes 9000 2500 0    79   ~ 0
Pulse Generator ~L
Wire Wire Line
	8350 2600 8300 2600
Wire Wire Line
	8350 2800 8300 2800
Wire Wire Line
	7700 1500 5750 1500
Wire Wire Line
	2800 1500 2800 1750
Wire Wire Line
	5750 1500 5750 1750
Connection ~ 5750 1500
Wire Wire Line
	5750 1500 2800 1500
Wire Wire Line
	8550 2550 10400 2550
Wire Wire Line
	8550 2950 8600 2950
Wire Wire Line
	4950 4850 4950 5450
Wire Wire Line
	4950 5450 2600 5450
Wire Wire Line
	2600 5450 2600 4850
Connection ~ 4950 5450
Wire Wire Line
	7700 2700 7700 1500
Connection ~ 8550 2950
Wire Wire Line
	4950 5450 8350 5450
Wire Wire Line
	8550 2950 8350 2950
Wire Wire Line
	7600 2950 7600 1600
Wire Wire Line
	7600 1600 5850 1600
Wire Wire Line
	5850 1600 5850 1750
Wire Wire Line
	8350 2600 8350 2800
Wire Wire Line
	8550 2550 8550 2950
Wire Wire Line
	8350 2800 8350 2950
Connection ~ 8350 2800
Connection ~ 8350 2950
Wire Wire Line
	8350 2950 7600 2950
Wire Wire Line
	8350 2950 8350 5450
$Comp
L Switch:SW_Push SW8
U 1 1 61916F9F
P 9400 4900
F 0 "SW8" H 9400 5185 50  0000 C CNN
F 1 "SW_Push" H 9400 5094 50  0000 C CNN
F 2 "" H 9400 5100 50  0001 C CNN
F 3 "~" H 9400 5100 50  0001 C CNN
	1    9400 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0195
U 1 1 6192A533
P 9300 4050
F 0 "#PWR0195" H 9300 3800 50  0001 C CNN
F 1 "GND" H 9305 3877 50  0000 C CNN
F 2 "" H 9300 4050 50  0001 C CNN
F 3 "" H 9300 4050 50  0001 C CNN
	1    9300 4050
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0196
U 1 1 6192B4E0
P 9200 4900
F 0 "#PWR0196" H 9200 4650 50  0001 C CNN
F 1 "GND" H 9205 4727 50  0000 C CNN
F 2 "" H 9200 4900 50  0001 C CNN
F 3 "" H 9200 4900 50  0001 C CNN
	1    9200 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R15
U 1 1 61952ED5
P 9650 4750
F 0 "R15" H 9720 4796 50  0000 L CNN
F 1 "1k" H 9720 4705 50  0000 L CNN
F 2 "" V 9580 4750 50  0001 C CNN
F 3 "~" H 9650 4750 50  0001 C CNN
	1    9650 4750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0197
U 1 1 61953AA3
P 9650 4600
F 0 "#PWR0197" H 9650 4450 50  0001 C CNN
F 1 "+5V" H 9665 4773 50  0000 C CNN
F 2 "" H 9650 4600 50  0001 C CNN
F 3 "" H 9650 4600 50  0001 C CNN
	1    9650 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 4900 9650 4900
Text GLabel 9900 4900 2    79   Input ~ 0
~PB
Wire Wire Line
	9650 4900 9900 4900
Connection ~ 9650 4900
Text GLabel 9900 4150 2    79   Input ~ 0
~PROG
Wire Wire Line
	9700 4150 9900 4150
Wire Wire Line
	5650 1750 5650 1150
Wire Wire Line
	5650 1150 5750 1150
Wire Wire Line
	2700 1150 2800 1150
Wire Wire Line
	2700 1150 2700 1700
Text GLabel 5750 1150 2    79   Input ~ 0
M_Map_RAM
Text GLabel 2800 1150 2    79   Input ~ 0
M_MAP_ROM
Wire Wire Line
	6100 3750 6100 3850
Wire Wire Line
	5950 3750 6100 3750
Text GLabel 4950 6150 2    79   Input ~ 0
~PROG
Wire Wire Line
	4950 6150 4850 6150
Wire Wire Line
	4850 6150 4850 4850
Wire Wire Line
	4850 6150 2500 6150
Wire Wire Line
	2500 6150 2500 4850
Connection ~ 4850 6150
$Comp
L Switch:SW_SPDT SW9
U 1 1 61781998
P 9500 4150
F 0 "SW9" H 9500 3825 50  0000 C CNN
F 1 "SW_SPDT" H 9500 3916 50  0000 C CNN
F 2 "" H 9500 4150 50  0001 C CNN
F 3 "~" H 9500 4150 50  0001 C CNN
	1    9500 4150
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR0198
U 1 1 617A6A57
P 9300 4250
F 0 "#PWR0198" H 9300 4100 50  0001 C CNN
F 1 "+5V" V 9315 4378 50  0000 L CNN
F 2 "" H 9300 4250 50  0001 C CNN
F 3 "" H 9300 4250 50  0001 C CNN
	1    9300 4250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2900 1750 2900 1600
Wire Wire Line
	2900 1600 5850 1600
Connection ~ 5850 1600
$EndSCHEMATC
