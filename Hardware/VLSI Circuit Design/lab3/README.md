# lab3
This lab aims to integrate knowledge of power consumption and circuit speed, applying it to analyze and optimize various circuit designs.  

## Lab Tasks:

- 1A & 1B: Calculate the activity factor for different nodes in logic gates or for a single input signal. 

- 1C: Calculate the dynamic power dissipation of the circuit and compare it with the power values obtained from HSPICE simulations. Investigate the impact of changing rising and falling times on power consumption.  

- 2A & 2B: Utilize the ring oscillator concept from the "speed" chapter. Perform pre-layout and post-layout simulations using HSPICE to verify whether the actual simulated values meet the specifications. 

- 2C: Design a voltage-controlled ring oscillator (VCO).  While this specific circuit might not have been covered in class, the task requires applying existing knowledge. 

- 3A: Determine the optimal number of stages and transistor sizes for a circuit to achieve minimum delay under specified constraints. 

- 3B: Determine the optimal number of stages and transistor sizes for a circuit to achieve minimum power consumption.  

3C: This task combines delay and power considerations.

1. First, determine the input pattern that results in the minimum delay. This requires analyzing the circuit's logic and identifying the critical path.

2. Based on the minimum delay input pattern, sweep the transistor sizes and measure the rising/falling delays and power consumption.

3. Calculate the power-delay product (PDP) for each size.
Create a plot of size vs. PDP.

4. From the plot, determine the transistor sizes that correspond to the minimum PDP.

5. Compare these sizes with the theoretically calculated values from task 3B. 