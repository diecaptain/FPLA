# FPLA
A mini field programmable logic array in vhdl

The Mini-FPLA (Field Programmable Logic Array) consists of a matrix of R X C programmable logic units (PLUs). The objective of this project is to design a FPLA maximizing the number of PLUs and thereby maximizing the number of operations the FPLA can achieve. Each PLU contains an SRAM-based look-up table (LUT) and a flip-flop (FF). The vhdl code is used to test and analyze the functioning of the PLUs and the Mini-FPLA.

Bit-slice for the FPLA (PLU):

Each PLU is a LUT-based unit. The LUT contains 4 bits addressed by the two inputs. The 4 bits can be such a way that they represent the outputs of a specific operation between the two inputs ‘I1’ and ‘I2’. The LUTs are implemented by four Positive edge triggered D-flip flops. The outputs of flip-flops are fed into two multiplexers and a selected in such a way to satisfy the function depending on the flip-flops. The flip-flops are clocked by AND-ing the Mode control line and Clock (both input from the pins). Data is fed into the flip-flops serially (for 4 clock cycles) when the Mode line is ‘High’. A ‘Low’ on this Mode line implies normal operation, generally a process for obtaining the output. The output of the LUT is stored in the FF enabled by one of the two inputs. The outputs of the PLU are identical. Either the output of FF or the output of the LUT can be selected to be the output of the PLU. The FFs are triggered by the positive edge of the clock. The configuration bit governs the multiplexer selecting the output. The logical level design of the bit slice is below.

Pin-out Diagram:
This is the proposed pin-out diagram for the FPLA. This diagram is in assumption that we would be able to design an FPLA array with 24 PLUs with 10 inputs and 10 outputs.


Pin-out diagram


The pad frame assumed has 40 pins. We have proposed to use 38 out of the 40 pins for the operation of FPLA.  Among these 38 pins, 10 pins are for the inputs and 10 are for the outputs (including both combinational and serial operation). The pins from Y1 to Y5 are the outputs for combinational operation proposed in the flow, outputs determined by function between ‘AX’ and ‘BX’ inputs. O1 to O5 are the remaining outputs. Depending on the change in the flow, the outputs used may vary.j 2 pins are used for Supply Voltage and Ground terminals for the chips – Vdd and GND respectively. For Mode there is a “Mod” pin and also a “CLK” pin providing the clock signal for the entire chip to whichever device necessary.



Leaf-Level delays observed in the slice:

Delay of NOT acting as enable of DFF: 0.16 ns
Delay of NOT driving output: 0.78 ns
Delay chosen for Inverter for VHDL simulation: 0.78 ns

Delay of DFF which produces sequential logic: .60 ns
Delay of Lookup table D flip-flop: 0.7 ns
DFF delay chosen:  0.7ns ns

Delay for AND at Clock: 0.94 ns
Max delay for AND gates observed: 0.94 ns

Worst case delay for output selection MUX: 0.39 ns
Maximum MUX delay: 0.39 ns


Design Consideration made:
To connect one bit-slice to the other, the original bit-slice design has been flipped upside down and rotated. The resultant design is connected to the original. This couple design has been iterated to form row of connected slices. Decision has been made to design a 6x4 chip with 24 PLUs inside the pad frame.


Further, a standalone slice has been incorporated for the testing purposes. The included standalone slice surmounts to a total of 25 PLUs.


Pad-frame:
In the pad frame provided 24 PLU’s are accommodated for a FPLA. To test the chip a standalone bitslice, inverter and D flip flop are also introduced. The pad frame of chip with the pins marked  is shown below:


User’s guide for the chip:

The chip primarily has a mini-FPLA (Field Programmable Logic Array) which consists of a matrix of 4x6 programmable logic units (PLUs).  Each PLU is designed for implementing a logic function. The PLU has to be programmed to implement any logic function either sequential or combinational logic. We have also included a stand-alone inverter, stand-alone inverter and a stand-alone D-flip flop.
Features of FPLA:
Operating voltage:  5V
Number of pins: 38
Maximum Cock Frequency: 100MHz
Max Delay of the FPLA:

Observing the pin-out diagram from earlier in the report, the following are the pins and their description:
1. Total number of pins                                                  40
2. Number of input pins of FPLA                                          10
3. Number of output pins of FPLA 				                                 10
4. Number of input pins for PLU 				                                 02
5. Number of output pins of PLU 				                                 02
6. Number of input pins for inverter 				                             01
7. Number of output pins for inverter 			                             01
8. Number of input pins for D flip-flop (dff_in)                         01
9. Number of output pins for D flip-flop (dff_out)                       01
8. VDD 						                                                       01
9. Ground 						                                                   01
10. Reset 							                                                 01
13. Clock 							                                                 01
14. Mod (R/W)					                                                   01
15. Serial in for FPLA(data_in)             			                       01
16. Serial in for PLU(plu_data)				                                   01
17. Serial out of PLU (plu_data_out)	             		                   01
18. Serial out pins of FPLA (data_out)			                             01
19. plu_mod                                                              01
20. Unused pins                                                          02

Implementing as combinational circuit:

To implement combinational logic the first two bits are used to store the values of select lines for the two multiplexers and the later four bits are used to store output values of the logic gate. For example if XOR has to be implemented in PLU then the configuration bits has to be “000110” , similarly to implement AND the configuration bits have to be “000001”. Depending on the logic the configuration bits have to be programmed in six clock cycles. During programming of the LUT, the Mod signal has to be HIGH which indicates PLU is getting programmed and after programming is done the signal has to be made LOW.

Implementing as sequential circuit:

The sequential logic which can be implemented in PLU is functioning of a D flip-flop. To implement D flip-flop whose input is Input 1(MSB) of PLU then the last four bits have to be configured as a buffer for input 1 i.e “0011” has to be loaded into them; first bit has to select input 2 which has to be always HIGH as it acts as enable for the stand alone D-flip flop present in LUT and the second bit has to have HIGH which selects the sequential part of PLU i.e the LUT has to have “110011” as configuration bits. Similarly, to implement a D flip-flop whose input is input 2 the LUT has to be loaded with “110101”.

Testing Strategy:

The design is made for testability. It is designed in a way to facilitate the tester to test each and every interconnect in the design and debug it in a later stage. A stand-alone Inverter and a D flipflop is provided to check if the fabrication is done properly. Since our design is a slice based design, a stand-alone bit slice is also provided to check the functioning of the bit slices. The functioning of the main FPLA design is done using scan chains. Each LUT and the D flipflops used for storing the select line values in every PLU slice is connected through a scan chain serially. This helps in connecting the flipfops like a serial shift register and check the values serially taken out. In addition to testing, the scan chain provides a way to program the individual PLU’s to perform combinational and sequential logic. The Mod bit determines the mode of the chip. When it is high, the chip is in programmable mode and when it is low, the chip is operating normally. From our tests, the clock needs to be less than or equal to 100 MHz for it to function properly. The throughput of the chip depends on the function being implemented.

Testing of FPLA:

The FPLA is tested using the scan chain. The data is sent serially through the data_in pin and is tapped out through the data_out pin.

Combinational Logic:

FPLA can be programmed to load any combinational logic within the LUT’s and can be used to run that function. For testing a 5-bit XOR function, the following vectors need to be applied.
Data_in: 001010 000110 001010
