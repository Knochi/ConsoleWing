EESchema Schematic File Version 4
LIBS:ConsoleWing-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 4
Title "VWIF UniControlBox"
Date "2018-02-19"
Rev "0.1"
Comp "Volkswagen Infotainment GmbH"
Comment1 "David Nottebohm-Knochenhauer"
Comment2 "G-TE/E"
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 6750 1650 2    60   Input ~ 0
MISO
Text GLabel 6750 1750 2    60   Output ~ 0
MOSI
Text GLabel 6750 1850 2    60   Output ~ 0
SCK
$Comp
L power:GND #PWR01
U 1 1 5A266AD8
P 5950 3150
F 0 "#PWR01" H 5950 2900 50  0001 C CNN
F 1 "GND" H 5950 3000 50  0000 C CNN
F 2 "" H 5950 3150 50  0001 C CNN
F 3 "" H 5950 3150 50  0001 C CNN
	1    5950 3150
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR02
U 1 1 5A268AEB
P 1950 6600
F 0 "#PWR02" H 1950 6450 50  0001 C CNN
F 1 "+3.3V" H 1950 6740 50  0000 C CNN
F 2 "" H 1950 6600 50  0001 C CNN
F 3 "" H 1950 6600 50  0001 C CNN
	1    1950 6600
	1    0    0    -1  
$EndComp
Text GLabel 1550 1450 0    60   Output ~ 0
SCL
Text GLabel 1850 1350 0    60   BiDi ~ 0
SDA
$Comp
L power:+3.3V #PWR03
U 1 1 5A269B24
P 6300 1150
F 0 "#PWR03" H 6300 1000 50  0001 C CNN
F 1 "+3.3V" H 6300 1290 50  0000 C CNN
F 2 "" H 6300 1150 50  0001 C CNN
F 3 "" H 6300 1150 50  0001 C CNN
	1    6300 1150
	1    0    0    -1  
$EndComp
Text Notes 6100 2850 0    60   ~ 0
max. 100mA
Text Notes 7150 6800 0    60   ~ 0
See\nhttps://learn.adafruit.com/adafruit-feather/feather-specification\n
$Comp
L power:+BATT #PWR04
U 1 1 5A26B838
P 4200 925
F 0 "#PWR04" H 4200 775 50  0001 C CNN
F 1 "+BATT" H 4200 1065 50  0000 C CNN
F 2 "" H 4200 925 50  0001 C CNN
F 3 "" H 4200 925 50  0001 C CNN
	1    4200 925 
	1    0    0    -1  
$EndComp
$Comp
L ConsoleWing-rescue:VUSB-VWIFCOntrolBox-rescue #PWR05
U 1 1 5A26CC0A
P 4350 1000
F 0 "#PWR05" H 4350 850 50  0001 C CNN
F 1 "VUSB" H 4350 1140 50  0000 C CNN
F 2 "" H 4350 1000 50  0001 C CNN
F 3 "" H 4350 1000 50  0001 C CNN
	1    4350 1000
	1    0    0    -1  
$EndComp
Text GLabel 3950 2750 0    60   Input ~ 0
ENABLE
$Comp
L power:+5V #PWR06
U 1 1 5A33F949
P 1700 6600
F 0 "#PWR06" H 1700 6450 50  0001 C CNN
F 1 "+5V" H 1700 6740 50  0000 C CNN
F 2 "" H 1700 6600 50  0001 C CNN
F 3 "" H 1700 6600 50  0001 C CNN
	1    1700 6600
	1    0    0    -1  
$EndComp
$Sheet
S 8450 4700 950  1000
U 5A3782E7
F0 "Power" 60
F1 "ConsoleWing_PWR.sch" 60
$EndSheet
Text Notes 6450 5150 0    60   ~ 0
ext. Interrupts\n32u4: 0..3,7          -Pin14,15,17,18-\nM0:   all excpt. 4/22  -Pin 22- (not)\nHuzzah: none\nESP32: \n328:  2,3\nnRF52: any
$Sheet
S 8200 1825 700  975 
U 5A385513
F0 "Rotary Encoder" 60
F1 "ConsoleWing_RotEnc.sch" 60
F2 "EncA" O L 8200 1950 60 
F3 "EncB" O L 8200 2100 60 
F4 "EncBtn" O L 8200 2250 60 
F5 "NeoPx_In" I L 8200 2450 60 
F6 "NeoPx_Out" O R 8900 2650 60 
$EndSheet
Text Notes 7600 1600 0    60   ~ 0
Rotary Encoder will not work with Huzzah Feather\n
Text Notes 4300 4650 0    60   ~ 0
PWM\n32u4: 3,5,6,9..11,13 - Pin 18..23,25\nM0:    5,6,9..13    -     Pin 19..25\nHuzzah: all except ADC - Pin 5\nnRF52:   any
Text GLabel 6450 1450 2    60   Output ~ 0
TxD
Text GLabel 6450 1550 2    60   Input ~ 0
RxD
Text Label 2500 2300 0    60   ~ 0
FTH_J3P5
$Sheet
S 1600 1550 650  1050
U 5A3A4A70
F0 "Displays" 60
F1 "ConsoleWing_DISP.sch" 60
F2 "TFT_LITE" I R 2250 2400 60 
F3 "TFT_CS" I R 2250 1650 60 
F4 "uSD_CS" I R 2250 1800 60 
F5 "TFT_DC" I R 2250 1950 60 
F6 "TFT_RST" I R 2250 2100 60 
$EndSheet
Text Label 7600 2450 0    60   ~ 0
NeoPx_In
$Comp
L ConsoleWing-rescue:TEST-VWIFCOntrolBox-rescue TP1
U 1 1 5A3AF870
P 3000 2650
F 0 "TP1" H 3000 2950 50  0000 C BNN
F 1 "Pn24" H 3000 2900 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 3000 2650 50  0001 C CNN
F 3 "" H 3000 2650 50  0001 C CNN
	1    3000 2650
	-1   0    0    1   
$EndComp
Text Label 2500 1750 0    60   ~ 0
FTH_J3P9
Text Label 2500 1900 0    60   ~ 0
FTH_J3P8
Text Label 2500 2050 0    60   ~ 0
FTH_J3P7
Text Label 2500 2200 0    60   ~ 0
FTH_J3P6
Text Label 2500 2500 0    60   ~ 0
FTH_J3P4
Text GLabel 2200 4700 0    60   Input ~ 0
MISO
Text GLabel 2200 4800 0    60   Output ~ 0
MOSI
Text GLabel 2200 4900 0    60   Output ~ 0
SCK
Text GLabel 2200 4400 0    60   Output ~ 0
TxD
Text GLabel 2200 4500 0    60   Input ~ 0
RxD
Text GLabel 2200 5200 0    60   Output ~ 0
SCL
Text GLabel 2200 5100 0    60   BiDi ~ 0
SDA
Text Label 2200 5400 0    60   ~ 0
FTH_J3P9
Text Label 2200 5500 0    60   ~ 0
FTH_J3P8
Text Label 2200 5600 0    60   ~ 0
FTH_J3P7
Text Label 2200 5700 0    60   ~ 0
FTH_J3P6
Text Label 2200 5900 0    60   ~ 0
FTH_J3P4
Text Label 2200 5800 0    60   ~ 0
FTH_J3P5
$Comp
L ConsoleWing-rescue:Jumper_NCNO_Dual-VWIFCOntrolBox-rescue JP1
U 1 1 5A3BDBB3
P 3250 1700
F 0 "JP1" H 3370 1650 50  0000 L CNN
F 1 "NCNO" H 3550 1750 50  0000 C BNN
F 2 "Jumper:SolderJumper_01x03_NCNO" H 3320 1750 50  0001 C CNN
F 3 "" H 3320 1750 50  0001 C CNN
	1    3250 1700
	1    0    0    -1  
$EndComp
$Comp
L ConsoleWing-rescue:Jumper_NCNO_Dual-VWIFCOntrolBox-rescue JP3
U 1 1 5A3BE458
P 3750 1850
F 0 "JP3" H 3870 1800 50  0000 L CNN
F 1 "NCNO" H 4050 1900 50  0000 C BNN
F 2 "Jumper:SolderJumper_01x03_NCNO" H 3820 1900 50  0001 C CNN
F 3 "" H 3820 1900 50  0001 C CNN
	1    3750 1850
	1    0    0    -1  
$EndComp
$Comp
L ConsoleWing-rescue:Jumper_NCNO_Dual-VWIFCOntrolBox-rescue JP2
U 1 1 5A3BE4BE
P 3250 2000
F 0 "JP2" H 3370 1950 50  0000 L CNN
F 1 "NCNO" H 3550 2000 50  0000 C BNN
F 2 "Jumper:SolderJumper_01x03_NCNO" H 3320 2050 50  0001 C CNN
F 3 "" H 3320 2050 50  0001 C CNN
	1    3250 2000
	1    0    0    -1  
$EndComp
$Comp
L ConsoleWing-rescue:Jumper_NCNO_Dual-VWIFCOntrolBox-rescue JP4
U 1 1 5A3BE521
P 3750 2150
F 0 "JP4" H 3870 2100 50  0000 L CNN
F 1 "NCNO" H 4050 2200 50  0000 C BNN
F 2 "Jumper:SolderJumper_01x03_NCNO" H 3820 2200 50  0001 C CNN
F 3 "" H 3820 2200 50  0001 C CNN
	1    3750 2150
	1    0    0    -1  
$EndComp
$Comp
L ConsoleWing-rescue:Jumper_NONC_Dual-VWIFCOntrolBox-rescue JP5
U 1 1 5A3BE9E2
P 3750 2450
F 0 "JP5" H 3870 2400 50  0000 L CNN
F 1 "NONC" H 4050 2450 50  0000 C BNN
F 2 "Jumper:SolderJumper_01x03_NONC" H 3820 2500 50  0001 C CNN
F 3 "" H 3820 2500 50  0001 C CNN
	1    3750 2450
	1    0    0    -1  
$EndComp
$Comp
L ConsoleWing-rescue:Jumper_NCNO_Dual-VWIFCOntrolBox-rescue JP6
U 1 1 5A3C169E
P 6500 2000
F 0 "JP6" H 6620 1950 50  0000 L CNN
F 1 "NCNO" H 6800 2050 50  0000 C BNN
F 2 "Jumper:SolderJumper_01x03_NCNO" H 6570 2050 50  0001 C CNN
F 3 "" H 6570 2050 50  0001 C CNN
	1    6500 2000
	-1   0    0    -1  
$EndComp
$Comp
L ConsoleWing-rescue:Jumper_NCNO_Dual-VWIFCOntrolBox-rescue JP8
U 1 1 5A3C1D0D
P 6850 2150
F 0 "JP8" H 6970 2100 50  0000 L CNN
F 1 "NCNO" H 7150 2200 50  0000 C BNN
F 2 "Jumper:SolderJumper_01x03_NCNO" H 6920 2200 50  0001 C CNN
F 3 "" H 6920 2200 50  0001 C CNN
	1    6850 2150
	-1   0    0    -1  
$EndComp
$Comp
L ConsoleWing-rescue:Jumper_NCNO_Dual-VWIFCOntrolBox-rescue JP7
U 1 1 5A3C1D8B
P 6500 2300
F 0 "JP7" H 6620 2250 50  0000 L CNN
F 1 "NCNO" H 6800 2350 50  0000 C BNN
F 2 "Jumper:SolderJumper_01x03_NCNO" H 6570 2350 50  0001 C CNN
F 3 "" H 6570 2350 50  0001 C CNN
	1    6500 2300
	-1   0    0    -1  
$EndComp
Text Label 7450 2050 2    60   ~ 0
FTH_J1P7
Text Label 7450 2350 2    60   ~ 0
FTH_J1P9
Text Label 7450 2200 2    60   ~ 0
FTH_J1P8
Text Label 7450 2550 2    60   ~ 0
FTH_J1P11
Text Label 7450 2650 2    60   ~ 0
FTH_J1P12
Text Label 2200 6300 0    60   ~ 0
FTH_J1P9
Text Label 2200 5300 0    60   ~ 0
FTH_J3P10
Text Label 2200 6100 0    60   ~ 0
FTH_J1P11
Text Label 2200 6000 0    60   ~ 0
FTH_J1P12
Text Label 2200 6400 0    60   ~ 0
FTH_J1P8
Text Label 2200 6500 0    60   ~ 0
FTH_J1P7
$Comp
L power:GND #PWR07
U 1 1 5A3C883A
P 3150 7150
F 0 "#PWR07" H 3150 6900 50  0001 C CNN
F 1 "GND" H 3150 7000 50  0000 C CNN
F 2 "" H 3150 7150 50  0001 C CNN
F 3 "" H 3150 7150 50  0001 C CNN
	1    3150 7150
	1    0    0    -1  
$EndComp
$Comp
L ConsoleWing-rescue:CONN_01X28-VWIFCOntrolBox-rescue J2
U 1 1 5A3CA221
P 3600 5650
F 0 "J2" H 3600 7100 50  0000 C CNN
F 1 "CONN_01X28" V 3700 5650 50  0000 C CNN
F 2 "MPE-Garry:PinHeader_1x28_P1.27mm_Horizontal_Series204" H 3600 5650 50  0001 C CNN
F 3 "" H 3600 5650 50  0001 C CNN
F 4 "MPE Garry" H 3600 5650 60  0001 C CNN "MFG"
F 5 "204-1-028-0-HTF-LS0" H 3600 5650 60  0001 C CNN "Prod.ID"
	1    3600 5650
	1    0    0    -1  
$EndComp
$Comp
L ConsoleWing-rescue:+BATT_SW-VWIFCOntrolBox-rescue #PWR08
U 1 1 5A3CBB0D
P 1350 6600
F 0 "#PWR08" H 1350 6450 50  0001 C CNN
F 1 "+BATT_SW" H 1350 6740 50  0000 C CNN
F 2 "" H 1350 6600 50  0001 C CNN
F 3 "" H 1350 6600 50  0001 C CNN
	1    1350 6600
	1    0    0    -1  
$EndComp
$Comp
L ConsoleWing-rescue:TEST-VWIFCOntrolBox-rescue TP2
U 1 1 5A3CD10C
P 5900 1025
F 0 "TP2" H 5900 1325 50  0000 C BNN
F 1 "J1P1" H 5900 1275 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 5900 1025 50  0001 C CNN
F 3 "" H 5900 1025 50  0001 C CNN
	1    5900 1025
	1    0    0    -1  
$EndComp
$Comp
L ConsoleWing-rescue:TEST-VWIFCOntrolBox-rescue TP3
U 1 1 5A3CDE33
P 5750 3125
F 0 "TP3" H 5750 3425 50  0000 C BNN
F 1 "RST" H 5750 3375 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 5750 3125 50  0001 C CNN
F 3 "" H 5750 3125 50  0001 C CNN
	1    5750 3125
	-1   0    0    1   
$EndComp
$Comp
L ConsoleWing-rescue:TEST-VWIFCOntrolBox-rescue TP4
U 1 1 5A3CE02A
P 5850 3375
F 0 "TP4" H 5850 3675 50  0000 C BNN
F 1 "AREF" H 5850 3625 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 5850 3375 50  0001 C CNN
F 3 "" H 5850 3375 50  0001 C CNN
	1    5850 3375
	-1   0    0    1   
$EndComp
$Comp
L ConsoleWing-rescue:VUSB-VWIFCOntrolBox-rescue #PWR09
U 1 1 5A3B861F
P 1000 6600
F 0 "#PWR09" H 1000 6450 50  0001 C CNN
F 1 "VUSB" H 1000 6740 50  0000 C CNN
F 2 "" H 1000 6600 50  0001 C CNN
F 3 "" H 1000 6600 50  0001 C CNN
	1    1000 6600
	1    0    0    -1  
$EndComp
Text Label 9400 2650 2    60   ~ 0
NeoPx_Out
Text Label 2200 6200 0    60   ~ 0
NeoPx_Out
$Comp
L ConsoleWing-rescue:CONN_01X12-VWIFCOntrolBox-rescue J3
U 1 1 5A61FCBF
P 4600 1900
F 0 "J3" H 4600 1250 50  0000 C CNN
F 1 "CONN_01X12" V 4700 1900 50  0000 C CNN
F 2 "MPE-Garry:098-1-012" H 4600 1900 50  0001 C CNN
F 3 "" H 4600 1900 50  0001 C CNN
F 4 "MPE Garry" H 4600 1900 60  0001 C CNN "MFG"
F 5 "098-1-012" H 4600 1900 60  0001 C CNN "Prod.ID"
	1    4600 1900
	1    0    0    1   
$EndComp
$Comp
L ConsoleWing-rescue:CONN_01X16-VWIFCOntrolBox-rescue J1
U 1 1 5A620399
P 5500 2100
F 0 "J1" H 5500 2950 50  0000 C CNN
F 1 "CONN_01X16" V 5600 2100 50  0000 C CNN
F 2 "MPE-Garry:098-1-016" H 5500 2100 50  0001 C CNN
F 3 "" H 5500 2100 50  0001 C CNN
F 4 "MPE Garry" H 5500 2100 60  0001 C CNN "MFG"
F 5 "098-1-016" H 5500 2100 60  0001 C CNN "Prod.ID"
	1    5500 2100
	-1   0    0    -1  
$EndComp
Text Notes 5200 2450 1    118  ~ 0
Adafruit\nFeather
Wire Wire Line
	6750 1650 5700 1650
Wire Wire Line
	6750 1750 5700 1750
Wire Wire Line
	6750 1850 5700 1850
Wire Wire Line
	5950 3150 5950 2550
Wire Wire Line
	5950 2550 5700 2550
Wire Wire Line
	1850 1350 4400 1350
Wire Wire Line
	1550 1450 4400 1450
Wire Wire Line
	6300 1150 6300 2750
Wire Wire Line
	6300 2750 5700 2750
Wire Wire Line
	4200 2450 4200 925 
Wire Wire Line
	4400 2250 4350 2250
Wire Wire Line
	4350 2250 4350 1000
Wire Wire Line
	4300 2750 3950 2750
Wire Wire Line
	6300 2000 6250 2000
Wire Wire Line
	6200 2150 6650 2150
Wire Wire Line
	6150 2300 6300 2300
Wire Wire Line
	6450 1450 5700 1450
Wire Wire Line
	6450 1550 5700 1550
Wire Wire Line
	2500 2300 3000 2300
Wire Wire Line
	6100 2450 8200 2450
Wire Wire Line
	3000 2650 3000 2300
Connection ~ 3000 2300
Wire Wire Line
	2500 1750 3050 1750
Wire Wire Line
	2500 1900 3550 1900
Wire Wire Line
	2500 2050 3050 2050
Wire Wire Line
	2500 2200 3550 2200
Wire Wire Line
	2500 2500 3550 2500
Wire Wire Line
	2500 1550 4400 1550
Wire Wire Line
	3450 1700 3750 1700
Wire Wire Line
	3950 2150 4050 2150
Wire Wire Line
	4000 2000 3450 2000
Wire Wire Line
	4150 2450 3950 2450
Wire Wire Line
	6700 2250 8200 2250
Wire Wire Line
	8200 1950 6700 1950
Wire Wire Line
	8200 2100 7050 2100
Wire Wire Line
	6700 2050 7450 2050
Wire Wire Line
	7450 2350 6700 2350
Wire Wire Line
	7450 2200 7050 2200
Wire Wire Line
	6050 2550 7450 2550
Wire Wire Line
	6000 2650 7450 2650
Wire Wire Line
	2250 1650 3050 1650
Wire Wire Line
	3550 1800 2250 1800
Wire Wire Line
	3050 1950 2250 1950
Wire Wire Line
	3550 2100 2250 2100
Wire Wire Line
	3550 2400 2250 2400
Wire Wire Line
	3150 4600 3400 4600
Wire Wire Line
	3150 5000 3400 5000
Connection ~ 3150 5000
Wire Wire Line
	2200 4400 3400 4400
Wire Wire Line
	3400 4500 2200 4500
Wire Wire Line
	2200 4700 3400 4700
Wire Wire Line
	3400 4800 2200 4800
Wire Wire Line
	2200 4900 3400 4900
Wire Wire Line
	3400 5100 2200 5100
Wire Wire Line
	2200 5200 3400 5200
Wire Wire Line
	3150 6600 3400 6600
Connection ~ 3150 6600
Wire Wire Line
	3400 4300 3150 4300
Connection ~ 3150 4600
Wire Wire Line
	2200 5500 3400 5500
Wire Wire Line
	2200 5600 3400 5600
Wire Wire Line
	2200 5700 3400 5700
Wire Wire Line
	2200 5800 3400 5800
Wire Wire Line
	2200 5900 3400 5900
Wire Wire Line
	2200 6000 3400 6000
Wire Wire Line
	2200 6100 3400 6100
Wire Wire Line
	2200 6200 3400 6200
Wire Wire Line
	2200 6300 3400 6300
Wire Wire Line
	2200 6400 3400 6400
Wire Wire Line
	2200 6500 3400 6500
Wire Wire Line
	5900 1025 5900 1350
Wire Wire Line
	5900 1350 5700 1350
Wire Wire Line
	5750 3125 5750 2850
Wire Wire Line
	5750 2850 5700 2850
Wire Wire Line
	3150 4300 3150 4600
Wire Wire Line
	1950 6600 1950 6700
Wire Wire Line
	1950 6700 3400 6700
Wire Wire Line
	1700 6600 1700 6800
Wire Wire Line
	1700 6800 3400 6800
Wire Wire Line
	1350 6600 1350 6900
Wire Wire Line
	1350 6900 3400 6900
Wire Wire Line
	1000 6600 1000 7000
Wire Wire Line
	1000 7000 3400 7000
Wire Wire Line
	8900 2650 9400 2650
Wire Wire Line
	2200 5300 3400 5300
Wire Wire Line
	3750 1700 3750 1650
Wire Wire Line
	3750 1650 4400 1650
Wire Wire Line
	3950 1850 3950 1750
Wire Wire Line
	3950 1750 4400 1750
Wire Wire Line
	4000 2000 4000 1850
Wire Wire Line
	4000 1850 4400 1850
Wire Wire Line
	4050 2150 4050 1950
Wire Wire Line
	4050 1950 4400 1950
Wire Wire Line
	4100 2300 4100 2050
Wire Wire Line
	4100 2050 4400 2050
Wire Wire Line
	4150 2450 4150 2150
Wire Wire Line
	4150 2150 4400 2150
Wire Wire Line
	4200 2450 4400 2450
Wire Wire Line
	4300 2750 4300 2350
Wire Wire Line
	4300 2350 4400 2350
Wire Wire Line
	6250 2000 6250 1950
Wire Wire Line
	6250 1950 5700 1950
Wire Wire Line
	6200 2050 6200 2150
Wire Wire Line
	5700 2050 6200 2050
Wire Wire Line
	6150 2300 6150 2150
Wire Wire Line
	6150 2150 5700 2150
Wire Wire Line
	6100 2450 6100 2250
Wire Wire Line
	6100 2250 5700 2250
Wire Wire Line
	6050 2550 6050 2350
Wire Wire Line
	6050 2350 5700 2350
Wire Wire Line
	6000 2650 6000 2450
Wire Wire Line
	6000 2450 5700 2450
Wire Wire Line
	5850 3375 5850 2650
Wire Wire Line
	5850 2650 5700 2650
Wire Notes Line
	4750 1400 5350 1400
Wire Notes Line
	5350 1400 5350 2800
Wire Notes Line
	5350 2800 4750 2800
Wire Notes Line
	4750 2800 4750 1400
Wire Wire Line
	3400 5400 2200 5400
Text Label 2500 1550 0    60   ~ 0
FTH_J3P10
Text Label 5900 1350 1    60   ~ 0
FTH_J1P1
Text Label 5750 2850 3    60   ~ 0
FTH_RST
Wire Wire Line
	3000 2300 4100 2300
Wire Wire Line
	3150 5000 3150 6600
Wire Wire Line
	3150 6600 3150 7150
Wire Wire Line
	3150 4600 3150 5000
Text Notes 3725 700  0    50   ~ 0
+BATT is directly connected to LiPo connector\n
$EndSCHEMATC
