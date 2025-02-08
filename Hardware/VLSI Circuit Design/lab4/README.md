# lab4
- 1A: Theoretically calculate charge sharing noise under different input order conditions.

- 1B: Perform HSPICE simulations to analyze charge sharing noise.

- 1C: Explore methods to mitigate charge sharing noise, specifically using secondary precharge or keeper circuits.  

- 2A: Calculate the optimal path delay and determine transistor sizes for different circuit styles (static CMOS, pseudo-NMOS, domino) and logic gate combinations (NAND6 and INV, NAND3 and NOR2, NAND3 and NOR2, INV and NOR6). 

- 2B: Simulate the circuits designed in 2A and employ different strategies to optimize the delay time. 

- 2C: Complete the layout for the pseudo-NMOS NAND3 and NOR2 circuit. Extract the parasitic capacitance (R+C+CC) and perform post-layout HSPICE simulations.

---

The specification only requires the output voltage to be greater than 1.8V - 0.1V = 1.7V. From the DC transfer characteristics graph, it is observed that even if the output voltage is higher than VDD, it is still judged as "1" by the next stage circuit. However, it is more dangerous if it is lower than VDD. If it is lower than the switching threshold voltage of the next stage circuit, there will be problems.

Secondary precharge can be used. At this time, the voltage higher than VDD meets the specification. The reason for the occurrence is considering the parasitic capacitance Vgd. One end of the capacitor is the output VDD, and the other end is the original input value 0. When the input value changes from 0 to VDD, in order to maintain the constant voltage across the capacitor, the other end of the output will rush from VDD to 2VDD, and then it will be divided by the capacitor below, causing the voltage to drop and stop between VDD and 2VDD.

A keeper can be used. However, in practice, it is necessary to control that the output voltage affected by charge sharing noise cannot be lower than the switching threshold voltage of the inverter in the keeper's negative feedback. If it is lower than the switching threshold voltage, the inverter in the negative feedback will be judged as "0", the output will be 1, and the PMOS will not turn on, so it will not be able to correct the output voltage upwards to VDD.

---

## pseudo-NMOS:

- Transistor size determination: To make the ratioed circuit consistent with the static CMOS comparison benchmark, set the PMOS to produce I/3 current and the NMOS to produce 4I/3 current. The net current during falling is 4I/3 - I/3 = I. Since I * R = VDD = const., to make the NMOS produce 4I/3 current, the NMOS size must be increased to reduce the resistance. Therefore, the size k = 4/3. The PMOS size needs to be divided by 4 times, but since the mobility of the PMOS is lower (μn:μp = 2:1), it is multiplied by 2 times. Therefore, the size k = 2/3.

- Logic effort calculation: The input capacitance seen is only 4/3 of the NMOS. Since the net current during the previous falling is 4I/3 - I/3 = I, 4/3 only needs to be divided by the input capacitance of the unit inverter for normalization. The falling (down) logic effort is gd = (4/3) * (1/3) = 4/9. Since the rising current is I/3, which is 3 times less than the falling current I, the rising speed will be 3 times slower, and the logic effort will be 3 times larger. The rising (up) logic effort is gu = gd * 3 = 4/3.

## footed dynamic gate:

- Transistor size determination: Since CLK precharges all circuits simultaneously, there is no need to worry about speed issues. Therefore, to reduce parasitic capacitance, the sizing of the PMOS transistor will be given the minimum; and the sizing of the pull-down transistor follows the static CMOS method to keep the path below at an R.

- Logic effort calculation: Only the falling logic effort gd needs to be calculated, because the precharge stage will first charge the output to VDD, and the evaluate stage output voltage only has two possibilities: falling or not falling.

## HI skew static gate:

- Transistor size determination: Choose to favor rising to become HI-skew or favor falling to become LO-skew. According to the skew factor, generally set to 2 times, reduce the size of the transistors in the unfavored path by 2 times. In this way, the capacitance seen from the input and output will become smaller, and the speed of the favored path will become faster. However, for the unfavored path, since the size of the transistor is reduced and the equivalent resistance increases, the speed of the unfavored path becomes slower.

- Logic effort calculation: Maintain the same rising resistance on the equivalent circuit for the rising (up) logic effort gu. Adjust the transistors of the inverter to the unskewed state, and calculate the ratio gu = g(HI-skew) / g(unskewed inverter); maintain the same falling resistance on the equivalent circuit for the falling (down) logic effort gd. Adjust the transistors of the inverter to the unskewed state, and calculate the ratio gu = g(HI-skew) / g(unskewed inverter).