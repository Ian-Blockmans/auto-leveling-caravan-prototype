EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ent-rescue:LIS2DHTR-ian U2
U 1 1 5E442FEF
P 5100 3050
F 0 "U2" H 5150 3731 50  0000 C CNN
F 1 "LIS2DHTR" H 5150 3640 50  0000 C CNN
F 2 "Package_LGA:LGA-14_2x2mm_P0.35mm_LayoutBorder3x4y" H 5200 2400 50  0001 C CNN
F 3 "http://www.st.com/web/en/resource/technical/document/datasheet/DM00042751.pdf" H 4750 3050 50  0001 C CNN
	1    5100 3050
	-1   0    0    1   
$EndComp
$Comp
L MCU_ST_STM32F0:STM32F030K6Tx U3
U 1 1 5E446B8F
P 7300 2900
F 0 "U3" H 7250 1811 50  0000 C CNN
F 1 "STM32F030K6Tx" H 7250 1720 50  0000 C CNN
F 2 "Package_QFP:LQFP-32_7x7mm_P0.8mm" H 6800 2000 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00088500.pdf" H 7300 2900 50  0001 C CNN
	1    7300 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 2950 5850 2950
Wire Wire Line
	6350 2950 6350 3600
Wire Wire Line
	6250 3700 6250 3150
Wire Wire Line
	6250 3150 5850 3150
$Comp
L power:GND #PWR08
U 1 1 5E44CD2D
P 5050 2300
F 0 "#PWR08" H 5050 2050 50  0001 C CNN
F 1 "GND" H 5055 2127 50  0000 C CNN
F 2 "" H 5050 2300 50  0001 C CNN
F 3 "" H 5050 2300 50  0001 C CNN
	1    5050 2300
	-1   0    0    1   
$EndComp
Wire Wire Line
	4950 2550 4950 2450
Wire Wire Line
	4950 2450 5050 2450
Wire Wire Line
	5050 2450 5050 2300
Wire Wire Line
	5050 2450 5050 2550
Connection ~ 5050 2450
Wire Wire Line
	5150 2550 5150 2450
Wire Wire Line
	5150 2450 5050 2450
Wire Wire Line
	4600 2850 4450 2850
Wire Wire Line
	4450 2850 4450 2450
Wire Wire Line
	4450 2450 4950 2450
Connection ~ 4950 2450
Wire Wire Line
	4600 2950 4450 2950
Wire Wire Line
	4450 2950 4450 2850
Connection ~ 4450 2850
Wire Wire Line
	4600 3050 4450 3050
Wire Wire Line
	4450 3050 4450 2950
Connection ~ 4450 2950
$Comp
L power:+3V3 #PWR09
U 1 1 5E44EBB9
P 5050 3800
F 0 "#PWR09" H 5050 3650 50  0001 C CNN
F 1 "+3V3" H 5065 3973 50  0000 C CNN
F 2 "" H 5050 3800 50  0001 C CNN
F 3 "" H 5050 3800 50  0001 C CNN
	1    5050 3800
	-1   0    0    1   
$EndComp
Wire Wire Line
	5100 3800 5050 3800
Wire Wire Line
	5000 3550 5000 3800
Wire Wire Line
	5000 3800 5050 3800
Connection ~ 5050 3800
$Comp
L power:+3V3 #PWR013
U 1 1 5E450F16
P 5850 3550
F 0 "#PWR013" H 5850 3400 50  0001 C CNN
F 1 "+3V3" H 5865 3723 50  0000 C CNN
F 2 "" H 5850 3550 50  0001 C CNN
F 3 "" H 5850 3550 50  0001 C CNN
	1    5850 3550
	-1   0    0    1   
$EndComp
$Comp
L Device:R R4
U 1 1 5E451943
P 5850 3400
F 0 "R4" H 5920 3446 50  0000 L CNN
F 1 "10k" H 5920 3355 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5780 3400 50  0001 C CNN
F 3 "~" H 5850 3400 50  0001 C CNN
	1    5850 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 3250 5850 3150
Connection ~ 5850 3150
Wire Wire Line
	5850 3150 5500 3150
$Comp
L Device:C C3
U 1 1 5E452999
P 4100 3900
F 0 "C3" H 4215 3946 50  0000 L CNN
F 1 "10µ" H 4215 3855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4138 3750 50  0001 C CNN
F 3 "~" H 4100 3900 50  0001 C CNN
	1    4100 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5E455EB0
P 4450 3900
F 0 "C4" H 4565 3946 50  0000 L CNN
F 1 "100n" H 4565 3855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4488 3750 50  0001 C CNN
F 3 "~" H 4450 3900 50  0001 C CNN
	1    4450 3900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5E456974
P 4300 4150
F 0 "#PWR07" H 4300 3900 50  0001 C CNN
F 1 "GND" H 4305 3977 50  0000 C CNN
F 2 "" H 4300 4150 50  0001 C CNN
F 3 "" H 4300 4150 50  0001 C CNN
	1    4300 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 4050 4450 4150
Wire Wire Line
	4450 4150 4300 4150
Wire Wire Line
	4450 3750 4450 3650
Wire Wire Line
	4450 3650 4300 3650
$Comp
L power:+3V3 #PWR020
U 1 1 5E458F34
P 7300 1700
F 0 "#PWR020" H 7300 1550 50  0001 C CNN
F 1 "+3V3" H 7315 1873 50  0000 C CNN
F 2 "" H 7300 1700 50  0001 C CNN
F 3 "" H 7300 1700 50  0001 C CNN
	1    7300 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 1700 7300 1800
Wire Wire Line
	7300 1800 7200 1800
Wire Wire Line
	7200 1800 7200 2000
Wire Wire Line
	7300 2000 7300 1800
Connection ~ 7300 1800
$Comp
L power:GND #PWR019
U 1 1 5E45BDA8
P 7250 4200
F 0 "#PWR019" H 7250 3950 50  0001 C CNN
F 1 "GND" H 7255 4027 50  0000 C CNN
F 2 "" H 7250 4200 50  0001 C CNN
F 3 "" H 7250 4200 50  0001 C CNN
	1    7250 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 4200 7250 4200
Wire Wire Line
	7300 3900 7300 4200
Wire Wire Line
	7300 4200 7250 4200
Connection ~ 7250 4200
$Comp
L Device:C C8
U 1 1 5E45EF1A
P 8650 1350
F 0 "C8" H 8765 1396 50  0000 L CNN
F 1 "100n" H 8765 1305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8688 1200 50  0001 C CNN
F 3 "~" H 8650 1350 50  0001 C CNN
	1    8650 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 5E45FAF9
P 8250 1350
F 0 "C7" H 8365 1396 50  0000 L CNN
F 1 "100n" H 8365 1305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8288 1200 50  0001 C CNN
F 3 "~" H 8250 1350 50  0001 C CNN
	1    8250 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 5E46033E
P 7850 1350
F 0 "C6" H 7965 1396 50  0000 L CNN
F 1 "4.7µ" H 7965 1305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7888 1200 50  0001 C CNN
F 3 "~" H 7850 1350 50  0001 C CNN
	1    7850 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR026
U 1 1 5E464C89
P 8250 1750
F 0 "#PWR026" H 8250 1500 50  0001 C CNN
F 1 "GND" H 8255 1577 50  0000 C CNN
F 2 "" H 8250 1750 50  0001 C CNN
F 3 "" H 8250 1750 50  0001 C CNN
	1    8250 1750
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR025
U 1 1 5E465814
P 8250 950
F 0 "#PWR025" H 8250 800 50  0001 C CNN
F 1 "+3V3" H 8265 1123 50  0000 C CNN
F 2 "" H 8250 950 50  0001 C CNN
F 3 "" H 8250 950 50  0001 C CNN
	1    8250 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 950  8250 1050
Wire Wire Line
	7850 1200 7850 1050
Wire Wire Line
	7850 1050 8250 1050
Connection ~ 8250 1050
Wire Wire Line
	8250 1050 8250 1200
Wire Wire Line
	8650 1200 8650 1050
Wire Wire Line
	8650 1050 8250 1050
Wire Wire Line
	8250 1750 8250 1650
Wire Wire Line
	8650 1500 8650 1650
Wire Wire Line
	8650 1650 8250 1650
Connection ~ 8250 1650
Wire Wire Line
	8250 1650 8250 1500
Wire Wire Line
	7850 1500 7850 1650
Wire Wire Line
	7850 1650 8250 1650
Wire Wire Line
	5100 3550 5100 3800
$Comp
L power:+3V3 #PWR06
U 1 1 5E46F448
P 4300 3650
F 0 "#PWR06" H 4300 3500 50  0001 C CNN
F 1 "+3V3" H 4315 3823 50  0000 C CNN
F 2 "" H 4300 3650 50  0001 C CNN
F 3 "" H 4300 3650 50  0001 C CNN
	1    4300 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 4050 4100 4150
Wire Wire Line
	4100 4150 4300 4150
Connection ~ 4300 4150
Wire Wire Line
	4100 3750 4100 3650
Wire Wire Line
	4100 3650 4300 3650
Connection ~ 4300 3650
$Comp
L Regulator_Switching:TPS62172DSG U1
U 1 1 5E48DF15
P 2000 2600
F 0 "U1" H 2000 3167 50  0000 C CNN
F 1 "TPS62172DSG" H 2000 3076 50  0000 C CNN
F 2 "Package_SON:WSON-8-1EP_2x2mm_P0.5mm_EP0.9x1.6mm_ThermalVias" H 2150 2250 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/tps62170.pdf" H 2000 3150 50  0001 C CNN
	1    2000 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5E48F0DB
P 850 2550
F 0 "C1" H 965 2596 50  0000 L CNN
F 1 "10µ" H 965 2505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 888 2400 50  0001 C CNN
F 3 "~" H 850 2550 50  0001 C CNN
	1    850  2550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5E4905F7
P 3300 2500
F 0 "C2" H 3415 2546 50  0000 L CNN
F 1 "22µf" H 3415 2455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3338 2350 50  0001 C CNN
F 3 "~" H 3300 2500 50  0001 C CNN
	1    3300 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:L L1
U 1 1 5E4915D1
P 2700 2300
F 0 "L1" V 2890 2300 50  0000 C CNN
F 1 "2.2µH" V 2799 2300 50  0000 C CNN
F 2 "Inductor_SMD:L_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2700 2300 50  0001 C CNN
F 3 "~" H 2700 2300 50  0001 C CNN
	1    2700 2300
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 5E492353
P 1600 2850
F 0 "R1" H 1670 2896 50  0000 L CNN
F 1 "100k" H 1670 2805 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1530 2850 50  0001 C CNN
F 3 "~" H 1600 2850 50  0001 C CNN
	1    1600 2850
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR01
U 1 1 5E49332E
P 850 2200
F 0 "#PWR01" H 850 2050 50  0001 C CNN
F 1 "+12V" H 865 2373 50  0000 C CNN
F 2 "" H 850 2200 50  0001 C CNN
F 3 "" H 850 2200 50  0001 C CNN
	1    850  2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  2200 850  2300
Wire Wire Line
	850  2700 850  2850
Connection ~ 850  2300
Wire Wire Line
	850  2300 850  2400
Wire Wire Line
	2100 3000 2100 3100
Wire Wire Line
	2100 3100 2000 3100
Wire Wire Line
	1350 3100 1350 2850
Connection ~ 850  2850
Wire Wire Line
	850  2850 850  2900
Wire Wire Line
	2000 3000 2000 3100
Connection ~ 2000 3100
Wire Wire Line
	2000 3100 1900 3100
Wire Wire Line
	1900 3000 1900 3100
Connection ~ 1900 3100
Text GLabel 1600 3000 0    50   Input ~ 0
VOS
Wire Wire Line
	1350 2850 850  2850
Wire Wire Line
	1350 3100 1900 3100
Text GLabel 3100 2200 1    50   Input ~ 0
VOS
Wire Wire Line
	2400 2300 2550 2300
Wire Wire Line
	2850 2300 3100 2300
Wire Wire Line
	3100 2300 3100 2200
Wire Wire Line
	3300 2350 3300 2300
Wire Wire Line
	3300 2300 3100 2300
Connection ~ 3100 2300
Wire Wire Line
	2400 2400 3100 2400
Wire Wire Line
	3100 2400 3100 2300
Wire Wire Line
	2400 2500 2700 2500
Wire Wire Line
	2700 2500 2700 2700
Wire Wire Line
	2700 2700 3300 2700
Wire Wire Line
	3300 2700 3300 2650
$Comp
L power:+3V3 #PWR04
U 1 1 5E4BC5DF
P 3600 2250
F 0 "#PWR04" H 3600 2100 50  0001 C CNN
F 1 "+3V3" H 3615 2423 50  0000 C CNN
F 2 "" H 3600 2250 50  0001 C CNN
F 3 "" H 3600 2250 50  0001 C CNN
	1    3600 2250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5E4BD6FA
P 3600 2850
F 0 "#PWR05" H 3600 2600 50  0001 C CNN
F 1 "GND" H 3605 2677 50  0000 C CNN
F 2 "" H 3600 2850 50  0001 C CNN
F 3 "" H 3600 2850 50  0001 C CNN
	1    3600 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 2700 3600 2700
Wire Wire Line
	3600 2700 3600 2850
Connection ~ 3300 2700
Wire Wire Line
	3600 2250 3600 2300
Wire Wire Line
	3600 2300 3300 2300
Connection ~ 3300 2300
Wire Wire Line
	7200 3900 7200 4200
Text GLabel 6700 3300 0    50   Input ~ 0
SPI1_SCK
Text GLabel 6700 3400 0    50   Input ~ 0
SPI1_MISO
Text GLabel 6700 3500 0    50   Input ~ 0
SPI1_MOSI
Text GLabel 6700 3100 0    50   Input ~ 0
NSS1
Text GLabel 6700 3200 0    50   Input ~ 0
NSS2
Text GLabel 7800 2800 2    50   Input ~ 0
NSS3
Text GLabel 7800 2900 2    50   Input ~ 0
NSS4
Text GLabel 8800 2900 0    50   Input ~ 0
SPI1_MOSI
Text GLabel 8800 2800 0    50   Input ~ 0
SPI1_MISO
Text GLabel 8800 2700 0    50   Input ~ 0
SPI1_SCK
Text GLabel 8800 2500 0    50   Input ~ 0
NSS4
Text GLabel 8800 2400 0    50   Input ~ 0
NSS3
Text GLabel 8800 2300 0    50   Input ~ 0
NSS2
Text GLabel 8800 2200 0    50   Input ~ 0
NSS1
$Comp
L Device:R R3
U 1 1 5E5062A9
P 5850 2800
F 0 "R3" H 5920 2846 50  0000 L CNN
F 1 "10k" H 5920 2755 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5780 2800 50  0001 C CNN
F 3 "~" H 5850 2800 50  0001 C CNN
	1    5850 2800
	1    0    0    -1  
$EndComp
Connection ~ 5850 2950
Wire Wire Line
	5850 2950 6350 2950
$Comp
L power:+3V3 #PWR012
U 1 1 5E50671A
P 5850 2650
F 0 "#PWR012" H 5850 2500 50  0001 C CNN
F 1 "+3V3" H 5865 2823 50  0000 C CNN
F 2 "" H 5850 2650 50  0001 C CNN
F 3 "" H 5850 2650 50  0001 C CNN
	1    5850 2650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR030
U 1 1 5E50BF14
P 8800 3000
F 0 "#PWR030" H 8800 2750 50  0001 C CNN
F 1 "GND" H 8805 2827 50  0000 C CNN
F 2 "" H 8800 3000 50  0001 C CNN
F 3 "" H 8800 3000 50  0001 C CNN
	1    8800 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR028
U 1 1 5E597546
P 8800 2000
F 0 "#PWR028" H 8800 1750 50  0001 C CNN
F 1 "GND" V 8805 1827 50  0000 C CNN
F 2 "" H 8800 2000 50  0001 C CNN
F 3 "" H 8800 2000 50  0001 C CNN
	1    8800 2000
	0    1    1    0   
$EndComp
$Comp
L power:+12V #PWR027
U 1 1 5E598788
P 8800 1900
F 0 "#PWR027" H 8800 1750 50  0001 C CNN
F 1 "+12V" H 8815 2073 50  0000 C CNN
F 2 "" H 8800 1900 50  0001 C CNN
F 3 "" H 8800 1900 50  0001 C CNN
	1    8800 1900
	1    0    0    -1  
$EndComp
Text GLabel 7800 3500 2    50   Input ~ 0
SWDIO
Text GLabel 7800 3600 2    50   Input ~ 0
SWCLK
$Comp
L power:GND #PWR02
U 1 1 5E5A4306
P 850 2900
F 0 "#PWR02" H 850 2650 50  0001 C CNN
F 1 "GND" H 855 2727 50  0000 C CNN
F 2 "" H 850 2900 50  0001 C CNN
F 3 "" H 850 2900 50  0001 C CNN
	1    850  2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  2300 1100 2300
$Comp
L Switch:SW_SPDT SW1
U 1 1 5E5A5383
P 1300 2050
F 0 "SW1" H 1300 1725 50  0000 C CNN
F 1 "SW_SPDT" H 1300 1816 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 1300 2050 50  0001 C CNN
F 3 "~" H 1300 2050 50  0001 C CNN
	1    1300 2050
	-1   0    0    1   
$EndComp
Wire Wire Line
	1100 2150 1100 2300
Connection ~ 1100 2300
Wire Wire Line
	1100 2300 1600 2300
Wire Wire Line
	1500 2050 1500 2400
Wire Wire Line
	1500 2400 1600 2400
$Comp
L power:GND #PWR03
U 1 1 5E5ACEDB
P 1100 1950
F 0 "#PWR03" H 1100 1700 50  0001 C CNN
F 1 "GND" V 1105 1777 50  0000 C CNN
F 2 "" H 1100 1950 50  0001 C CNN
F 3 "" H 1100 1950 50  0001 C CNN
	1    1100 1950
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x04_Male J1
U 1 1 5E5AE12E
P 6300 4250
F 0 "J1" V 6150 4300 50  0000 R CNN
F 1 "Conn_01x04_Male" V 6250 4550 50  0000 R CNN
F 2 "Connector_JST:JST_XH_B4B-XH-A_1x04_P2.50mm_Vertical" H 6300 4250 50  0001 C CNN
F 3 "~" H 6300 4250 50  0001 C CNN
	1    6300 4250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6250 3700 6300 3700
Wire Wire Line
	6350 3600 6400 3600
$Comp
L power:GND #PWR016
U 1 1 5E5AF923
P 6200 4050
F 0 "#PWR016" H 6200 3800 50  0001 C CNN
F 1 "GND" H 6205 3877 50  0000 C CNN
F 2 "" H 6200 4050 50  0001 C CNN
F 3 "" H 6200 4050 50  0001 C CNN
	1    6200 4050
	-1   0    0    1   
$EndComp
Wire Wire Line
	6300 4050 6300 3700
Connection ~ 6300 3700
Wire Wire Line
	6300 3700 6700 3700
Wire Wire Line
	6400 4050 6400 3600
Connection ~ 6400 3600
Wire Wire Line
	6400 3600 6700 3600
$Comp
L Connector:Conn_01x04_Male J5
U 1 1 5E5B5B5B
P 9000 3650
F 0 "J5" H 8972 3532 50  0000 R CNN
F 1 "Conn_01x04_Male" H 8972 3623 50  0000 R CNN
F 2 "Connector_JST:JST_XH_B4B-XH-A_1x04_P2.50mm_Vertical" H 9000 3650 50  0001 C CNN
F 3 "~" H 9000 3650 50  0001 C CNN
	1    9000 3650
	-1   0    0    1   
$EndComp
Text GLabel 8800 3650 0    50   Input ~ 0
SWCLK
Text GLabel 8800 3550 0    50   Input ~ 0
SWDIO
$Comp
L power:GND #PWR032
U 1 1 5E5B738E
P 8800 3750
F 0 "#PWR032" H 8800 3500 50  0001 C CNN
F 1 "GND" H 8805 3577 50  0000 C CNN
F 2 "" H 8800 3750 50  0001 C CNN
F 3 "" H 8800 3750 50  0001 C CNN
	1    8800 3750
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR031
U 1 1 5E5B7E1D
P 8800 3450
F 0 "#PWR031" H 8800 3300 50  0001 C CNN
F 1 "+3V3" H 8815 3623 50  0000 C CNN
F 2 "" H 8800 3450 50  0001 C CNN
F 3 "" H 8800 3450 50  0001 C CNN
	1    8800 3450
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x12_Male J4
U 1 1 5E5BE1AD
P 9000 2500
F 0 "J4" H 8972 2382 50  0000 R CNN
F 1 "Conn_01x12_Male" H 8972 2473 50  0000 R CNN
F 2 "Connector_JST:JST_XH_B12B-XH-A_1x12_P2.50mm_Vertical" H 9000 2500 50  0001 C CNN
F 3 "~" H 9000 2500 50  0001 C CNN
	1    9000 2500
	-1   0    0    1   
$EndComp
Wire Wire Line
	7300 1800 7400 1800
Wire Wire Line
	7400 1800 7400 2000
NoConn ~ 7800 3000
NoConn ~ 7800 3100
NoConn ~ 7800 3200
NoConn ~ 6700 2800
NoConn ~ 6700 2900
$Comp
L Device:C C5
U 1 1 5E5F622C
P 6300 1800
F 0 "C5" V 6550 1750 50  0000 L CNN
F 1 "100nF" V 6450 1700 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6338 1650 50  0001 C CNN
F 3 "~" H 6300 1800 50  0001 C CNN
	1    6300 1800
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR015
U 1 1 5E5FA9E2
P 6150 1800
F 0 "#PWR015" H 6150 1550 50  0001 C CNN
F 1 "GND" V 6155 1627 50  0000 C CNN
F 2 "" H 6150 1800 50  0001 C CNN
F 3 "" H 6150 1800 50  0001 C CNN
	1    6150 1800
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR018
U 1 1 5E5FB0EB
P 6700 2400
F 0 "#PWR018" H 6700 2150 50  0001 C CNN
F 1 "GND" V 6705 2227 50  0000 C CNN
F 2 "" H 6700 2400 50  0001 C CNN
F 3 "" H 6700 2400 50  0001 C CNN
	1    6700 2400
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5E615C0D
P 5500 3400
F 0 "R2" H 5570 3446 50  0000 L CNN
F 1 "10k" H 5570 3355 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5430 3400 50  0001 C CNN
F 3 "~" H 5500 3400 50  0001 C CNN
	1    5500 3400
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR011
U 1 1 5E618E8C
P 5500 3550
F 0 "#PWR011" H 5500 3400 50  0001 C CNN
F 1 "+3V3" H 5515 3723 50  0000 C CNN
F 2 "" H 5500 3550 50  0001 C CNN
F 3 "" H 5500 3550 50  0001 C CNN
	1    5500 3550
	-1   0    0    1   
$EndComp
Text GLabel 4600 3150 0    50   Input ~ 0
INT2
Text GLabel 4600 3250 0    50   Input ~ 0
INT1
Text GLabel 7800 3300 2    50   Input ~ 0
INT1
Text GLabel 7800 3400 2    50   Input ~ 0
INT2
$Comp
L power:+3V3 #PWR029
U 1 1 5E61BC89
P 8800 2100
F 0 "#PWR029" H 8800 1950 50  0001 C CNN
F 1 "+3V3" V 8815 2228 50  0000 L CNN
F 2 "" H 8800 2100 50  0001 C CNN
F 3 "" H 8800 2100 50  0001 C CNN
	1    8800 2100
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR017
U 1 1 5E61D41F
P 6500 4050
F 0 "#PWR017" H 6500 3900 50  0001 C CNN
F 1 "+3V3" H 6515 4223 50  0000 C CNN
F 2 "" H 6500 4050 50  0001 C CNN
F 3 "" H 6500 4050 50  0001 C CNN
	1    6500 4050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5E61E635
P 5500 3050
F 0 "#PWR010" H 5500 2800 50  0001 C CNN
F 1 "GND" V 5505 2922 50  0000 R CNN
F 2 "" H 5500 3050 50  0001 C CNN
F 3 "" H 5500 3050 50  0001 C CNN
	1    5500 3050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7800 3700 8250 3700
Wire Wire Line
	8250 3700 8250 2600
Wire Wire Line
	8250 2600 8800 2600
Text GLabel 7800 2200 2    50   Input ~ 0
STOP1
Text GLabel 7800 2300 2    50   Input ~ 0
STOP2
Text GLabel 7800 2400 2    50   Input ~ 0
STOP3
Text GLabel 7800 2500 2    50   Input ~ 0
STOP4
Text GLabel 9400 4350 0    50   Input ~ 0
STOP2
$Comp
L Connector:TestPoint TP3
U 1 1 5E62DAAE
P 3600 2700
F 0 "TP3" V 3554 2888 50  0000 L CNN
F 1 "TestPoint" V 3645 2888 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 3800 2700 50  0001 C CNN
F 3 "~" H 3800 2700 50  0001 C CNN
	1    3600 2700
	0    1    1    0   
$EndComp
Connection ~ 3600 2700
$Comp
L Connector:TestPoint TP2
U 1 1 5E63A0CD
P 3600 2300
F 0 "TP2" V 3554 2488 50  0000 L CNN
F 1 "TestPoint" V 3645 2488 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 3800 2300 50  0001 C CNN
F 3 "~" H 3800 2300 50  0001 C CNN
	1    3600 2300
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP1
U 1 1 5E63D09F
P 1600 2700
F 0 "TP1" V 1554 2888 50  0000 L CNN
F 1 "TestPoint" V 1645 2888 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 1800 2700 50  0001 C CNN
F 3 "~" H 1800 2700 50  0001 C CNN
	1    1600 2700
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x03_Male J6
U 1 1 5E643DB8
P 9600 4350
F 0 "J6" H 9572 4282 50  0000 R CNN
F 1 "Conn_01x03_Male" H 9572 4373 50  0000 R CNN
F 2 "Connector_JST:JST_XH_B3B-XH-A_1x03_P2.50mm_Vertical" H 9600 4350 50  0001 C CNN
F 3 "~" H 9600 4350 50  0001 C CNN
	1    9600 4350
	-1   0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR033
U 1 1 5E656DEC
P 9400 4250
F 0 "#PWR033" H 9400 4100 50  0001 C CNN
F 1 "+3.3V" H 9415 4423 50  0000 C CNN
F 2 "" H 9400 4250 50  0001 C CNN
F 3 "" H 9400 4250 50  0001 C CNN
	1    9400 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR034
U 1 1 5E65891B
P 9400 4450
F 0 "#PWR034" H 9400 4200 50  0001 C CNN
F 1 "GND" H 9405 4277 50  0000 C CNN
F 2 "" H 9400 4450 50  0001 C CNN
F 3 "" H 9400 4450 50  0001 C CNN
	1    9400 4450
	1    0    0    -1  
$EndComp
Text GLabel 9400 5000 0    50   Input ~ 0
STOP4
$Comp
L Connector:Conn_01x03_Male J7
U 1 1 5E66711D
P 9600 5000
F 0 "J7" H 9572 4932 50  0000 R CNN
F 1 "Conn_01x03_Male" H 9572 5023 50  0000 R CNN
F 2 "Connector_JST:JST_XH_B3B-XH-A_1x03_P2.50mm_Vertical" H 9600 5000 50  0001 C CNN
F 3 "~" H 9600 5000 50  0001 C CNN
	1    9600 5000
	-1   0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR035
U 1 1 5E667123
P 9400 4900
F 0 "#PWR035" H 9400 4750 50  0001 C CNN
F 1 "+3.3V" H 9415 5073 50  0000 C CNN
F 2 "" H 9400 4900 50  0001 C CNN
F 3 "" H 9400 4900 50  0001 C CNN
	1    9400 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR036
U 1 1 5E667129
P 9400 5100
F 0 "#PWR036" H 9400 4850 50  0001 C CNN
F 1 "GND" H 9405 4927 50  0000 C CNN
F 2 "" H 9400 5100 50  0001 C CNN
F 3 "" H 9400 5100 50  0001 C CNN
	1    9400 5100
	1    0    0    -1  
$EndComp
Text GLabel 8100 4350 0    50   Input ~ 0
STOP1
$Comp
L Connector:Conn_01x03_Male J2
U 1 1 5E66BEE7
P 8300 4350
F 0 "J2" H 8272 4282 50  0000 R CNN
F 1 "Conn_01x03_Male" H 8272 4373 50  0000 R CNN
F 2 "Connector_JST:JST_XH_B3B-XH-A_1x03_P2.50mm_Vertical" H 8300 4350 50  0001 C CNN
F 3 "~" H 8300 4350 50  0001 C CNN
	1    8300 4350
	-1   0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR021
U 1 1 5E66BEED
P 8100 4250
F 0 "#PWR021" H 8100 4100 50  0001 C CNN
F 1 "+3.3V" H 8115 4423 50  0000 C CNN
F 2 "" H 8100 4250 50  0001 C CNN
F 3 "" H 8100 4250 50  0001 C CNN
	1    8100 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR022
U 1 1 5E66BEF3
P 8100 4450
F 0 "#PWR022" H 8100 4200 50  0001 C CNN
F 1 "GND" H 8105 4277 50  0000 C CNN
F 2 "" H 8100 4450 50  0001 C CNN
F 3 "" H 8100 4450 50  0001 C CNN
	1    8100 4450
	1    0    0    -1  
$EndComp
Text GLabel 8100 5000 0    50   Input ~ 0
STOP3
$Comp
L Connector:Conn_01x03_Male J3
U 1 1 5E66EF9D
P 8300 5000
F 0 "J3" H 8272 4932 50  0000 R CNN
F 1 "Conn_01x03_Male" H 8272 5023 50  0000 R CNN
F 2 "Connector_JST:JST_XH_B3B-XH-A_1x03_P2.50mm_Vertical" H 8300 5000 50  0001 C CNN
F 3 "~" H 8300 5000 50  0001 C CNN
	1    8300 5000
	-1   0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR023
U 1 1 5E66EFA3
P 8100 4900
F 0 "#PWR023" H 8100 4750 50  0001 C CNN
F 1 "+3.3V" H 8115 5073 50  0000 C CNN
F 2 "" H 8100 4900 50  0001 C CNN
F 3 "" H 8100 4900 50  0001 C CNN
	1    8100 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR024
U 1 1 5E66EFA9
P 8100 5100
F 0 "#PWR024" H 8100 4850 50  0001 C CNN
F 1 "GND" H 8105 4927 50  0000 C CNN
F 2 "" H 8100 5100 50  0001 C CNN
F 3 "" H 8100 5100 50  0001 C CNN
	1    8100 5100
	1    0    0    -1  
$EndComp
$Sheet
S 2600 5100 2050 1350
U 5E68BD2A
F0 "motor" 50
F1 "motor.sch" 50
$EndSheet
Text GLabel 7800 2700 2    50   Input ~ 0
Retract
Text GLabel 7800 2600 2    50   Input ~ 0
Extend
$Comp
L power:GND #PWR014
U 1 1 5E5EC8E1
P 6100 2200
F 0 "#PWR014" H 6100 1950 50  0001 C CNN
F 1 "GND" V 6105 2027 50  0000 C CNN
F 2 "" H 6100 2200 50  0001 C CNN
F 3 "" H 6100 2200 50  0001 C CNN
	1    6100 2200
	0    1    1    0   
$EndComp
$Comp
L Switch:SW_Push SW2
U 1 1 5E5EBC4B
P 6300 2200
F 0 "SW2" H 6300 2485 50  0000 C CNN
F 1 "SW_Push" H 6300 2394 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_SPST_PTS645" H 6300 2400 50  0001 C CNN
F 3 "~" H 6300 2400 50  0001 C CNN
	1    6300 2200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR070
U 1 1 5E6E8B31
P 7900 5750
F 0 "#PWR070" H 7900 5500 50  0001 C CNN
F 1 "GND" V 7905 5577 50  0000 C CNN
F 2 "" H 7900 5750 50  0001 C CNN
F 3 "" H 7900 5750 50  0001 C CNN
	1    7900 5750
	0    1    1    0   
$EndComp
$Comp
L Switch:SW_Push SW3
U 1 1 5E6E8B37
P 8100 5750
F 0 "SW3" H 8100 6035 50  0000 C CNN
F 1 "SW_Push" H 8100 5944 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_SPST_PTS645" H 8100 5950 50  0001 C CNN
F 3 "~" H 8100 5950 50  0001 C CNN
	1    8100 5750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR072
U 1 1 5E6ECA13
P 9250 5750
F 0 "#PWR072" H 9250 5500 50  0001 C CNN
F 1 "GND" V 9255 5577 50  0000 C CNN
F 2 "" H 9250 5750 50  0001 C CNN
F 3 "" H 9250 5750 50  0001 C CNN
	1    9250 5750
	0    1    1    0   
$EndComp
$Comp
L Switch:SW_Push SW4
U 1 1 5E6ECA19
P 9450 5750
F 0 "SW4" H 9450 6035 50  0000 C CNN
F 1 "SW_Push" H 9450 5944 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_SPST_PTS645" H 9450 5950 50  0001 C CNN
F 3 "~" H 9450 5950 50  0001 C CNN
	1    9450 5750
	1    0    0    -1  
$EndComp
Text GLabel 8400 5750 2    50   Input ~ 0
Extend
Text GLabel 9750 5750 2    50   Input ~ 0
Retract
$Comp
L Device:R R5
U 1 1 5E6F2108
P 8350 5600
F 0 "R5" H 8420 5646 50  0000 L CNN
F 1 "10k" H 8420 5555 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8280 5600 50  0001 C CNN
F 3 "~" H 8350 5600 50  0001 C CNN
	1    8350 5600
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR071
U 1 1 5E6F210E
P 8350 5450
F 0 "#PWR071" H 8350 5300 50  0001 C CNN
F 1 "+3V3" H 8365 5623 50  0000 C CNN
F 2 "" H 8350 5450 50  0001 C CNN
F 3 "" H 8350 5450 50  0001 C CNN
	1    8350 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 5750 8350 5750
Connection ~ 8350 5750
Wire Wire Line
	8350 5750 8400 5750
$Comp
L Device:R R6
U 1 1 5E6FBA5C
P 9700 5600
F 0 "R6" H 9770 5646 50  0000 L CNN
F 1 "10k" H 9770 5555 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9630 5600 50  0001 C CNN
F 3 "~" H 9700 5600 50  0001 C CNN
	1    9700 5600
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR073
U 1 1 5E6FBA62
P 9700 5450
F 0 "#PWR073" H 9700 5300 50  0001 C CNN
F 1 "+3V3" H 9715 5623 50  0000 C CNN
F 2 "" H 9700 5450 50  0001 C CNN
F 3 "" H 9700 5450 50  0001 C CNN
	1    9700 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 5750 9700 5750
Connection ~ 9700 5750
Wire Wire Line
	9700 5750 9750 5750
Connection ~ 6600 2200
Wire Wire Line
	6500 2200 6600 2200
Wire Wire Line
	6600 2200 6700 2200
Wire Wire Line
	6600 1800 6600 2200
Wire Wire Line
	6450 1800 6600 1800
$EndSCHEMATC
