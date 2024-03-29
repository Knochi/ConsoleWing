EESchema Schematic File Version 4
LIBS:ConsoleWing-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 4
Title "VWIF UniControlBox"
Date "2018-02-19"
Rev "0.1"
Comp "Volkswagen Infotainment GmbH"
Comment1 "David Nottebohm-Knochenhauer"
Comment2 "G-TE/E"
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 2350 2500 0    60   Output ~ 0
MISO
Text GLabel 2350 2700 0    60   Input ~ 0
MOSI
Text GLabel 2350 2600 0    60   Input ~ 0
SCK
$Comp
L power:+5V #PWR037
U 1 1 5A3A4B54
P 2600 1900
F 0 "#PWR037" H 2600 1750 50  0001 C CNN
F 1 "+5V" H 2600 2040 50  0000 C CNN
F 2 "" H 2600 1900 50  0001 C CNN
F 3 "" H 2600 1900 50  0001 C CNN
	1    2600 1900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR038
U 1 1 5A3A4B5A
P 2600 3450
F 0 "#PWR038" H 2600 3200 50  0001 C CNN
F 1 "GND" H 2600 3300 50  0000 C CNN
F 2 "" H 2600 3450 50  0001 C CNN
F 3 "" H 2600 3450 50  0001 C CNN
	1    2600 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 2500 2350 2500
Wire Wire Line
	2750 2600 2350 2600
Wire Wire Line
	2750 2700 2350 2700
Wire Wire Line
	2600 1900 2600 3200
Wire Wire Line
	2600 3200 2750 3200
Wire Wire Line
	2750 3300 2600 3300
Wire Wire Line
	2600 3300 2600 3450
Wire Wire Line
	2750 2400 2250 2400
Wire Wire Line
	2100 2800 2750 2800
Wire Wire Line
	2750 2900 2100 2900
Wire Wire Line
	2750 3100 2100 3100
Wire Wire Line
	2750 3000 2100 3000
Text HLabel 2100 2400 0    60   Input ~ 0
TFT_LITE
Text HLabel 2100 2800 0    60   Input ~ 0
TFT_CS
Text HLabel 2100 2900 0    60   Input ~ 0
uSD_CS
Text HLabel 2100 3000 0    60   Input ~ 0
TFT_DC
Text HLabel 2100 3100 0    60   Input ~ 0
TFT_RST
Text HLabel 3550 2400 2    60   Input ~ 0
TFT_LITE
Wire Wire Line
	3550 2400 3250 2400
Text GLabel 3550 2600 2    60   Output ~ 0
MISO
Text GLabel 3550 2700 2    60   Input ~ 0
MOSI
Text GLabel 3550 2500 2    60   Input ~ 0
SCK
Wire Wire Line
	3250 2500 3550 2500
Wire Wire Line
	3250 2600 3550 2600
Wire Wire Line
	3250 2700 3550 2700
Text HLabel 3550 2800 2    60   Input ~ 0
TFT_CS
Text HLabel 3550 2900 2    60   Input ~ 0
uSD_CS
Text HLabel 3550 3100 2    60   Input ~ 0
TFT_DC
Text HLabel 3550 3000 2    60   Input ~ 0
TFT_RST
Wire Wire Line
	3550 2800 3250 2800
Wire Wire Line
	3550 2900 3250 2900
Wire Wire Line
	3550 3000 3250 3000
Wire Wire Line
	3550 3100 3250 3100
$Comp
L power:GND #PWR039
U 1 1 5A3A57FA
P 3400 3450
F 0 "#PWR039" H 3400 3200 50  0001 C CNN
F 1 "GND" H 3400 3300 50  0000 C CNN
F 2 "" H 3400 3450 50  0001 C CNN
F 3 "" H 3400 3450 50  0001 C CNN
	1    3400 3450
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR040
U 1 1 5A3A580E
P 3400 1900
F 0 "#PWR040" H 3400 1750 50  0001 C CNN
F 1 "+5V" H 3400 2040 50  0000 C CNN
F 2 "" H 3400 1900 50  0001 C CNN
F 3 "" H 3400 1900 50  0001 C CNN
	1    3400 1900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3400 1900 3400 3200
Wire Wire Line
	3400 3200 3250 3200
Wire Wire Line
	3250 3300 3400 3300
Wire Wire Line
	3400 3300 3400 3450
$Comp
L power:+5V #PWR041
U 1 1 5A3A59E4
P 5700 2100
F 0 "#PWR041" H 5700 1950 50  0001 C CNN
F 1 "+5V" H 5700 2240 50  0000 C CNN
F 2 "" H 5700 2100 50  0001 C CNN
F 3 "" H 5700 2100 50  0001 C CNN
	1    5700 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 2100 5700 3050
Wire Wire Line
	5700 3050 5800 3050
$Comp
L power:GND #PWR042
U 1 1 5A3A5A1B
P 5500 3700
F 0 "#PWR042" H 5500 3450 50  0001 C CNN
F 1 "GND" H 5500 3550 50  0000 C CNN
F 2 "" H 5500 3700 50  0001 C CNN
F 3 "" H 5500 3700 50  0001 C CNN
	1    5500 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 3150 5500 3150
Wire Wire Line
	5500 3000 5500 3150
Text HLabel 5350 2750 0    60   Input ~ 0
TFT_RST
Wire Wire Line
	5800 2750 5350 2750
Text GLabel 5350 2550 0    60   Output ~ 0
SCL
Text GLabel 5350 2450 0    60   BiDi ~ 0
SDA
Wire Wire Line
	5350 2450 5800 2450
Wire Wire Line
	5800 2550 5350 2550
$Comp
L Device:R_Small R14
U 1 1 5A3A705C
P 5500 2900
F 0 "R14" H 5530 2920 50  0000 L CNN
F 1 "0r" H 5530 2860 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 5500 2900 50  0001 C CNN
F 3 "" H 5500 2900 50  0001 C CNN
F 4 "DNP" H 5350 2900 60  0000 C CNN "MOUNT"
	1    5500 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 2650 5500 2650
Wire Wire Line
	5500 2650 5500 2800
Connection ~ 5500 3150
Text Notes 6000 3600 0    60   ~ 0
using I2C to safe pins\n
$Comp
L ConsoleWing-rescue:CONN_02X10-VWIFCOntrolBox-rescue J4
U 1 1 5A62F1E7
P 3000 2850
F 0 "J4" H 3000 3400 50  0000 C CNN
F 1 "CONN_02X10" V 3000 2850 50  0000 C CNN
F 2 "MPE-Garry:098-3-020" H 3000 1650 50  0001 C CNN
F 3 "" H 3000 1650 50  0001 C CNN
F 4 "MPE Garry" H 3000 2850 60  0001 C CNN "MFG"
F 5 "098-3-020" H 3000 2850 60  0001 C CNN "Prod.ID"
	1    3000 2850
	1    0    0    -1  
$EndComp
Text Notes 3600 3850 2    60   ~ 0
Adafruit 1.8" or 2.2" TFT
$Comp
L ConsoleWing-rescue:CONN_01X08-VWIFCOntrolBox-rescue J5
U 1 1 5A62FB8F
P 6000 2800
F 0 "J5" H 6000 3250 50  0000 C CNN
F 1 "CONN_01X08" V 6100 2800 50  0000 C CNN
F 2 "MPE-Garry:098-1-008" H 6000 2800 50  0001 C CNN
F 3 "" H 6000 2800 50  0001 C CNN
F 4 "MPE Garry" H 6000 2800 60  0001 C CNN "MFG"
F 5 "098-1-008" H 6000 2800 60  0001 C CNN "Prod.ID"
	1    6000 2800
	1    0    0    -1  
$EndComp
Text Notes 1575 2225 0    60   ~ 0
1.8" TFT
Text Notes 3600 2225 0    60   ~ 0
2.2" TFT
$Comp
L Device:R_Small R16
U 1 1 5A71EEDF
P 2250 2150
F 0 "R16" H 2280 2170 50  0000 L CNN
F 1 "1k" H 2280 2110 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 2250 2150 50  0001 C CNN
F 3 "" H 2250 2150 50  0001 C CNN
	1    2250 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 2250 2250 2400
Connection ~ 2250 2400
$Comp
L power:+5V #PWR043
U 1 1 5A71F01F
P 2250 1900
F 0 "#PWR043" H 2250 1750 50  0001 C CNN
F 1 "+5V" H 2250 2040 50  0000 C CNN
F 2 "" H 2250 1900 50  0001 C CNN
F 3 "" H 2250 1900 50  0001 C CNN
	1    2250 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 2050 2250 1900
Wire Wire Line
	5500 3150 5500 3700
Wire Wire Line
	2250 2400 2100 2400
$EndSCHEMATC
