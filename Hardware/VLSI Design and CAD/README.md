# VLSI/CAD

## Environment
1. OS
- `CenterOS v6`

2. Software

|Name|Functionality|
|:-:|:-:|
|NC Verilog|HDL simulation of digital circuits to verify functionality and generate waveforms|
|nWave in Verdi|Waveform viewer used to analyze simulation results stored in '*.fsdb'|
|Superlint|Check HDL code|
|Design Vision|Logic synthesis tool|
|HSPICE|Circuit simulator used for analog circuit simulation|
|Laker|Layout editor|
|Calibre|Physical verification tool for DRC, LVS, PEX|
|Mobaxterm|Terminal emulator for accessing remote workstations|

## How to run
- Provide `makefile`

|     Description                                   |     Command                           |
|---------------------------------------------------|---------------------------------------|
|     Run RTL Convolution simulation                |     `make rtl0`                       |
|     Run RTL Pooling simulation                    |     `make rtl1`                       |
|     Run RTL simulation                            |     `make rtl_full`                   |
|     Run post-synthesis simulation                 |     `make syn_full`                   |
|     Dump waveform (no array)                      |     `make {rtlX, syn_full} FSDB=1`    |
|     Dump waveform (with array)                    |     `make {rtlX, syn_full}   FSDB=2`  |
|     Open nWave without file pollution             |     `make nWave`                      |
|     Open Superlint without file   pollution       |     `make superlint`                  |
|     Open DesignVision without file   pollution    |     `make dv`                         |
|     Synthesize your RTL code                      |     `make synthesize`                 |
|     Check correctness of your file   structure    |     `make check`                      |
|     Compress your homework to tar   format        |     `make tar`                        |
|     Count the total lines of your   code          |     `wc –l ./src/*   ./include/*`     |

- compile
```
ncverilog top_module.v
```

- pre-simulate
```
ncverilog top_module_tb.v +define+FSDB access+r
```

- synthesis
    1. open Design Vision
    ```
    dv &
    ```
    2. change hierarchy
    ```
    current_design top
    ```
    3. read design constraints file
    ```
    source DC.sdc
    ```
    4. `Compile Design`-> `OK`
    5. generate report
    ```
    report_timing
    report_area
    report_power
    ```
    6. generate SDF file
    ```
    write_sdf
    version 2.1 context verilog load_delay net too_module_syn.sdf
    ```

- post-simulate
```
ncverilog top_module_tb.v +define+FSDB+syn access+r
```
- Superlint
    1. open
    ```
    jg -superlint
    ```
    2. `File` -> `TclScripts` -> `Source`
    3. Count the number of total lines
    ```
    wc –l filename
    ```

- check file hierarchy
```
sh check.sh
```
<br>