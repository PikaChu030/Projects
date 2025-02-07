*To see version control*
*Please referred to: https://github.com/PikaChu030/Preydator-Prey-Simulation/tree/main*

## Requirements

* Python 3.x
* [numpy](https://numpy.org/)
* [pytest](https://pytest.org/)
* [line_profiler](https://pypi.org/project/line-profiler/)
* [memory_profiler](https://pypi.org/project/memory-profiler/)
* [matplotlib](https://pypi.org/project/matplotlib/)
* [radon](https://pypi.org/project/radon/)
* [memray](https://pypi.org/project/memray/)
* [numba](https://pypi.org/project/numba/)

To get Python 3 on Cirrus, run:

```console
$ module load anaconda3/2023.09
```

The Anaconda Python distribution includes numpy and many other useful Python packages.

---

# How to run this model

## Run predator-prey simulation

First, change the directory.

```console
$ cd s2749500
```

Run the simulation with selected map.

For example, using [10x20.dat](./landscapes/10x20.dat) with default values for the other parameters:

```console
$ python -m predator_prey.simulate_predator_prey -f ./landscapes/10x20.dat
```

Or, simply run the script [run_all_simulations.py](./predator_prey/run_all_simulations.py) to get all maps in landscapes files simulated.

```console
$ python -m predator_prey.run_all_simulations
```

By running [run_all_simulation.py](./predator_prey/run_all_simulation.py), you can know the numbers of valid and invalid inputs.

```console
...
Total success for:15, fail for:7
...
```

---

## Run predator-prey simulation pytest

Whenever refactoring the source code, you'll need to check if the behavior of code, [simulate_predator_prey.py](./predator_prey/simulate_predator_prey.py), acts as before.

This pytest script, [test_example.py](./test/test_example.py), will provide you an 100% coverage of code test.

```console
$ pytest
======================================= test session starts =========================================
...
Collected 30 items

test/test_example.py .............................                                             [100%]

======================================== 30 passed in 59.50s ========================================
```

Every time you make a code change, make sure to run pytest for the same functionality.

---

## Run predator-prey performance experiment

The profile analysis of the source code were wriiten in the script, [profile_simulation.py](./test/profile_simulation.py).

Details were written in [s2749500-PSoc.pdf](./s2749500-PSoc.pdf).

Before you run it, you have to install some packages:

```console
$ pip install numpy pytest line_profiler memory_profiler matplotlib radon memray numba
```

Then, you can start doing profile analysis to the source code.

To identify the bottlenecks and hotspots in the program, you have to choose a valid map and fix all the other input parameters.

For example, this script used [test.dat](./landscapes/test.dat), with default values for the other parameters, as this map has the longest calculation time:

```console
$ python test/profile_simulation.py

Running cProfile...
...
Running line_profiler...
...
(Function update_densities is compiled with Numba. Skipping line profiling.
)
...
Running memory_profiler...
...
Peak Memory Usage: 203.5234375 MiB
...
Wrote flamegraph.html
Wrote table.html

Running Complexity Analysis...
...
```

You'll see some texts related to each part of profiling analysis:

* Cumulative time/Internal time(cProfile)

* Simulation time for specific function(line_profiler)

* Peak Memory Usage(memory_profiler)

* Cyclomatic Complexity Analysis(Complexity Analysis)

*You may change the source code to compare between the original source code (choose the commit before '5c26a059') and the refactored source code(choose the commit with the latest version).

### Visulaize the performance experiment

If you find these texts analysis is hard to read, you can reach out to visualization tools.

* For cprofile output, find [cprofile_results.prof](./experiment_analysis_data/cprofile_results.prof), it should be located at root directory. (I have moved it into [experiment_analysis_data/](./experiment_analysis_data/) directory)
* Drag this file to your local desktop, and run the command line ON YOUR LOCAL:

```console
$ pip install snakeviz
$ snakeviz ./PATH/TO/YOUR/FILE/cprofile_results.prof
```

The reason that you should run on your local desktop is because Cirrus does not provide GPU related tools to visualize it.

* For memory_profiler output, find [memory_usage_plot.png](./experiment_analysis_data/memory_usage_plot.png), it should be located at root directory. (I have moved it into [experiment_analysis_data/](./experiment_analysis_data/) directory)

```console
$ display ./memory_usage_plot.png
```

If Cirrus cannot open this file, drag this file to your local desktop and open with PNG file.

* When doing memory_profiler, it will also create 3 HTML files, which was created from [memory_report.bin](./experiment_analysis_data/memory_report.bin). Open at your local desktop, you can visualize the memory usage.

* For Complexity Analysis, it will create texts on the console:

```console
Running Complexity Analysis...

Function Cyclomatic Complexity Analysis:
Function check_positive_int: Cyclomatic Complexity = 2
Function parse_arguments: Cyclomatic Complexity = 1
...
```

---

## Notes

* Change the simulate_predator_prey.py for original and refactored implementation to see the difference. The lateset commit is for refactored implementation.

* Directory

```console

s2749500
|
|---- test
|    |    
|    |---- test_example.py (pytest file for code refactoring)
|    |---- profile_simulation.py (profiling file for performance analysis)
|
|---- predator_prey
|    |
|    |---- simpulate_predator_prey.py (source code for simulation)
|    |---- run_all_simulations.py (the script can run all landscapes file at one time and check the numbers of valid inputs)
|
|---- landscapes
|    |
|    |---- (These are invalid inputs)
|    |---- 0x0.dat
|    |---- 20x10.dat
|    |---- 50x20.dat
|    |---- island.dat
|    |---- island2.dat
|    |---- small.dat
|    |---- test2.dat
|    |---- (The others are all valid inputs)
|    |---- *.dat
|
|---- experiment_analysis_data
|    |    
|    |---- code
|    |    |---- simulate_predator_prey_original_code.py (raw source code without any refactor)
|    |    |---- simulate_predator_prey_original_code.pysimulate_predator_prey_refactor_code_before_performance_experiment.py (source code with refactoring for Part I, not for performance analysis Part II)
|    |    
|    |---- before_hotspot_check (the content of files varys everytime we run the simulation. This is just an example)
|    |    |---- table.html (memory_profile result)
|    |    |---- summary.html (memory_profile result)
|    |    |---- flamegraph.html (memory_profile result)
|    |    |---- memray_report.bin (memray intermediate file)
|    |    |---- memory_usage_plot.png (visulaize for memory usage)
|    |    |---- line_profiler_update_densities.png (line_profile result)
|    |    |---- line_profiler_update_densities.lprof (line_profile intermediate file)
|    |    |---- cprofile_results.prof (cprofile_profile result, use 'SnakeViz' to visualize)
|    |    |---- complexity_analysis.png (Cyclomatic Complexity Analysis result)
|    |    
|    |---- after_hotspot_check (the content of files varys everytime we run the simulation. This is just an example)
|    |    |---- ... (The same with before_hotspot_check/)
|        
|
|---- PredatorPreyBackgroundInformation.pdf (The background of simulation algorithm)
|
|---- s2749500-PSoc.pdf (Performance Analysis Project in detail)
|
|---- README.md

```

---

## Other Detailed Usage

To see help:

```console
$ python -m predator_prey.simulate_predator_prey -h
```

To run the simulation:

```console
$ python -m predator_prey.simulate_predator_prey \
    [-r BIRTH_MICE] [-a DEATH_MICE] \
    [-k DIFFUSION_MICE] [-b BIRTH_FOXES] \
    [-m DEATH_FOXES] [-l DIFFUSION_FOXES] \
    [-dt DELTA_T] [-t TIME_STEP] [-d DURATION] \
    -f LANDSCAPE_FILE [-ms MOUSE_SEED] \
    [-fs FOX_SEED]
```

(where `\` denotes a line continuation character)

For example, to run using the default map, [10x20.dat](./landscapes/10x20.dat), with default values for the other parameters:

```console
$ python -m predator_prey.simulate_predator_prey -f ./landscapes/10x20.dat
```

### Command-line parameters

| Flag | Parameter | Description | Default Value |
| ---- | --------- |------------ | ------------- |
| -h | --help | Show help message and exit | - |
| -r | --birth-mice | Birth rate of mice | 0.1 |
| -a | --death-mice | Rate at which foxes eat mice | 0.05 |
| -k | --diffusion-mice | Diffusion rate of mice | 0.2 |
| -b | --birth-foxes | Birth rate of foxes | 0.03 |
| -m | --death-foxes  | Rate at which foxes starve | 0.09 |
| -l | --diffusion-foxes | Diffusion rate of foxes | 0.2 |
| -dt | --delta-t | Time step size (seconds) | 0.5 |
| -t | --time_step | Number of time steps at which to output files | 10 |
| -d | --duration  | Time to run the simulation (seconds) | 500 |
| -f | --landscape-file | Input landscape file | - |
| -ms | --mouse-seed | Random seed for initialising mouse densities. If 0 then the density in each square will be 0, else each square's density will be set to a random value between 0.0 and 5.0 | 1 |
| -fs | --fox-seed | Random seed for initialising fox densities. If 0 then the density in each square will be 0, else each square's density will be set to a random value between 0.0 and 5.0 | 1 |

### Input files

Map files are expected to be plain-text files of form:

* One line giving Nx, the number of columns, and Ny, the number of rows
* Ny lines, each consisting of a sequence of Nx space-separated ones and zeros (land=1, water=0).

For example:

```
7 7
1 1 1 1 1 1 1
1 1 1 1 1 1 1
1 1 1 1 0 1 1
1 1 1 1 0 0 1
1 1 1 0 0 0 0
1 1 1 0 0 0 0
1 0 0 0 0 0 0
```

### PPM output files

"Plain PPM" image files are output every `TIME_STEP` timesteps.  These files are named `map_<NNNN>.ppm` and are a visualisation of the density of mice and foxes and water-only squares.

These files do not include the halo as the use of a halo is an implementation detail.

These files are plain-text so you can view them as you would any plain-text file e.g.:

```console
$ cat map<NNNN>.ppm
```

PPM files can be viewed graphically using ImageMagick commands as follows.

Cirrus users will need first need to run:

```console
$ module load ImageMagick
```

To view a PPM file, run:

```console
$ display map<NNNN>.ppm
```

To animate a series of PPM files:

```console
$ animate map*.ppm
```

For more information on the PPM file format, run `man ppm` or see [ppm](http://netpbm.sourceforge.net/doc/ppm.html).

### CSV averages output file

A plain-text comma-separated values file, `averages.csv`, has the average density of mice and foxes (across the land-only squares) calculated every `TIME_STEP` timesteps. The file has four columns and a header row:

```csv
Timestep,Time,Mice,Foxes
```

where:

* `Timestep`: timestep from 0 .. `DURATION` / `DELTA_T`
* `Time`: time in seconds from 0 .. `DURATION`
* `Mice`: average density of mice.
* `Foxes`: average density of foxes.

This file is plain-text so you can view it as you would any plain-text file e.g.:

```console
$ cat averages.csv
```

---

## Running automated tests

`test/test_example.py` is a module with a unit test for the `getVersion` function in `predator_prey/simulate_predator_prey.py`.

`pytest` can find and run any tests in the current directory or its subdirectories:

```console
$ pytest
======================================= test session starts =======================================
...
test/test_example.py .                                                                      [100%]

======================================== 1 passed in 0.20s ========================================
```

`pytest` can be told to find and run the tests in a specific module:

```console
$ pytest test/test_example.py
======================================= test session starts =======================================
...
test/test_example.py .                                                                      [100%]

======================================== 1 passed in 0.21s ========================================
```

`pytest` can be told to run a specific test within a specific module:

```console
$ pytest test/test_example.py::testGetVersion
======================================= test session starts =======================================
...
test/test_example.py .                                                                      [100%]

======================================== 1 passed in 0.35s ========================================
```

For more information on `pytest`, see the [pytest](https://docs.pytest.org/) documentation.

---

## Running the simulation within Pycharm

If you know how to use the [Pycharm](https://www.jetbrains.com/pycharm/) integrated development environment, then here is *one way* you can configure this to run the program and tests as follows (for example, for Pycharm 2020.02).

Start Pycharm.

Open the source code directory:

* Click Open
* Select the directory with the code, the directory with `predator_prey`, `test`, and `README.md`.

Create a configuration to run the program:

* Select Run menu, Run...
* Click Edit Configurations...
* Click +
* Click Python.
* Click V on right of 'Script path' and select 'Module name'.
* Enter Module name: `predator_prey.simulate_predator_prey`
* Enter Parameters: Enter `-f <path from your home directory to landscapes/10x20.dat>`. The current directory is assumed to be wherever you started Pycharm. If you started this in your home directory then your path to `landscapes/10x20.dat` might be `predator-prey-assessment/landscapes/10x20.dat`.
* Click Run.
* The 'Run' window should show the output from the run.

Rerun the program:

* Select Run menu, Run...
* Click `predator_prey.simulate_predator_prey`.
* The 'Run' window should show the output from the run.

Create a configuration to run the tests using `pytest`:

* Select Run menu, Run...
* Click Edit Configurations...
* Click +
* Click pytest.
* Click Run.
* The 'Run' window should show the output from the test run.

Rerun the tests:

* Select Run menu, Run...
* Click `predator_prey.simulate_predator_prey`.
* Click pytest.
* The 'Run' window should show the output from the test run.

To edit a run configuration:

* Select Run menu, Edit Configurations...
* Click the configuration you want to edit.
* For running `predator_prey.simulate_predator_prey` with different command-line parameters, you can add these to, and edit them within, the Parameters field in the Configuration form. Alternatively, you can create run configurations with different names for different parameter sets.
