# lab1
Complete the following HSPICE simulations and layout drawings.

- Transmission Gates: When the input (drain) and control (gate) terminals of the NMOS transistor are both at VDD, the output (source) terminal will start to increase from 0. It continues to increase until it is above VDD - Vtn. Since the NMOS conduction condition is VGS > Vtn, the NMOS will turn off and remain in the state before conduction, VDD - Vtn. Therefore, we say that NMOS can pass a strong "0" but will pass a weak (degraded) "1". PMOS is the opposite. This pass transistor problem can be solved by connecting NMOS and PMOS in parallel, combining the advantages of both. During conduction, when transmitting 0, it will go through the NMOS channel, and when transmitting 1, it will go through the PMOS channel, which is the transmission gate.

- D Latch: The truth table is: when CLK=0, the previous value is latched (locked), maintaining the previous state; when CLK=1, the output follows the input D value. Two inverters connected in series are used as a buffer. The buffer can correct the values that deviate from the highest (logic 1) and lowest voltage (logic 0) values, improving the noise immunity of the circuit.

- D Flip-Flop: It can be implemented by cascading two D latches described above. This is called a master-slave D flip-flop. When CLK=0, the master is ON and the slave is OFF. The signal is stuck in front of the slave. When CLK=1, the master is OFF and the slave is ON. The signal passes through the slave and is output. Since the master is turned off, the signal will be maintained (held). That is to say, the value is read at the moment when CLK changes from 0 to 1. This is called positive-edge trigger.

- Multiplexer: Its function is to select one signal from multiple input signal sources as the output. This selection mechanism relies on a selection signal. When S=0, the output signal follows the input source D0; when S=1, the output signal follows the input source D1.

- AOI22: A multiplexer implemented with transmission gates requires only 4 transistors. However, it has a non-restoring problem. That is to say, when the input signal is disturbed by noise, since the output follows the input source, it will also be disturbed. Especially after multiple stages of non-restoring logic, the signal will be distorted to the point where it cannot be recovered. Therefore, we changed to use the AOI22 circuit for implementation. However, since the PMOS is connected to the pull-up network and the NMOS is connected to the pull-down network, the signal output by this MUX is inverted.

- Pair of Tristate Inverters: Similar to the previous question, a pair of tristate inverters can also be used to implement an inverting multiplexer.

- AOI31: When drawing the layout, we will avoid interrupting a diffusion, which will increase the circuit area. Therefore, we need to find an order of polysilicon gates that can prevent the diffusion from being interrupted. This is the Euler path problem. Convert the PMOS into an edge, and the connection of the source/drain terminal into a node. Start from the output terminal to find the Euler path. You can also convert the NMOS into an edge. The patterns drawn by the two are dual. The Euler path is D-C-B-A.

- Y = (AB+C)⋅D: Similar to the previous question, the Euler path is A-B-D-C.

- 3 to 8 Decoder: It is implemented using two 2 to 4 decoders. As shown in the schematic diagram, W0 and W1 are connected to the inputs of the two decoders respectively, and W2 is used to select which decoder to use. When W2=0, the upper decoder is used. When W2=1, the lower decoder is used. EN determines whether to activate this system.