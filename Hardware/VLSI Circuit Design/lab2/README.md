# lab2
- Familiarize with HSPICE syntax.

- Establish a linear delay model for logic gates.

- Evaluate path delay time for different circuit architectures and optimize the delay time of a path.

The path delay optimization process is outlined below:

1. Calculate path effort F = GBH:

- Path logic effort (G):  G = Πgi, represents the logical effort of the path, calculated as the product of the logical effort of each gate along the path. For example, with a μp : μn = 1:2 ratio, the logical effort (g) is (n+2)/3 for an n-input NAND gate and (2n+1)/3 for an n-input NOR gate.

- Path branching effort (B): B = Πbi where b = (Conpath + Coffpath) / Conpath, represents the branching effort of the path, calculated as the product of the branching effort at each node. The branching effort at a node is the ratio of the total capacitance (on-path + off-path) to the capacitance on the path.

- Path electrical effort (H): H = Πhi = Cout / Cin, represents the electrical effort of the path, calculated as the ratio of the output capacitance of the last stage to the input capacitance of the first stage.

- Principle: Based on the linear delay model, the total delay of a path is the sum of the parasitic delay and the effort delay: Total delay = Σ(pi + gihi) = Σ(pi) + Σ(gihi). The goal is to minimize the total delay. Since the parasitic delay (pi) is independent of the gate size (k), the objective becomes minimizing Σ(gihi). Using the arithmetic-geometric mean inequality (AM-GM inequality), An ≥ Gn, and the equality holds if and only if x1 = x2 = ... = xn, we can derive that the effort of each stage should be equal: f = F^(1/n). This means that the minimum delay time occurs when each stage exerts the same effort.

2. Determine the number of stages (N) to use: The optimal number of stages is determined by the equation F^(1/N) = 4, which is derived from the observation that the minimum delay time occurs when each stage drives an equivalent load of 4 times its input capacitance. This gives N = log4(F).

- Principle: Assuming a path effort F with n1 existing logic stages, inserting N - n1 inverters leads to a total delay of NF^(1/N) + Σ(pi) + (N - n1)pinv. Taking the partial derivative with respect to N, setting it to zero to find the extremum, and substituting pinv = 1 yields F^(1/N) = 3.59. This value is approximated to 4, implying that each stage should drive an equivalent load of 4 for minimum delay. 

3. Calculate the minimum delay time of the path: D = NF^(1/N) + P, where P = Σpi.

4. Calculate the effort of each stage: f̂ = F^(1/N), as explained in step 1.

5. Calculate the input capacitance of each stage: f̂ = gh = g * (Cout / Cin). Working backward from the output, we can calculate the input capacitance of each stage.

6. Determine the transistor sizes for each gate based on the calculated Cin: For example, if a 2-input NAND gate has a calculated Cin = 15, and the NMOS to PMOS size ratio is 4:1, the NMOS size would be 12 and the PMOS size would be 3, making the total input capacitance 12 + 3 = 15.

- Transistor folding layout technique: Transistor folding involves paralleling two transistors with half the width to achieve the same electrical characteristics of a single transistor with the full width. This technique reduces the diffusion area and thus the parasitic capacitance. The current through the folded transistor remains the same: i ∝ W/L = (W/2)/L + (W/2)/L.

- Analysis of logic gate delay time: The procedure for determining transistor sizes, calculating layout parasitic capacitance, and determining delay time under different input patterns is as follows:

1. Determine transistor sizes (W/L) to equalize the RC time constants of the pull-up and pull-down networks: This ensures balanced rise and fall times.

2. Calculate the capacitance (C) using the RC delay model: A quick estimation method involves summing the sizes (k) of the MOS transistors connected to a node: C = Σki. The capacitance at GND and VDD nodes is not considered because the voltage at these nodes is fixed.

3. (Consider layout optimization): When two MOS transistors share a contact, the gate capacitance is the average of the two: Cg = (Cg1 + Cg2) / 2. Without a shared contact, the depletion capacitance is halved: Cg / 2.

4. Identify the worst-case input pattern for RC charging and discharging.

5. Calculate the rising propagation delay time (tpdr) and falling propagation delay time (tpdf).

6. Calculate the propagation delay time (tpd) using the Elmore delay model: This involves summing the product of the resistance from the node to the source and the capacitance at each node: tpd = Σ(Ri-to-source * Ci). This represents a first-order RC approximation of the more complex I-V charging/discharging behavior. Note that the resistance R used here implicitly includes the ln2 factor usually associated with time constant calculations (tpd = R'C ln2).