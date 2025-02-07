#!/bin/bash
riscv32-unknown-elf-gcc -march=rv32i -mabi=ilp32 -c $1.c -o $1.o
riscv32-unknown-elf-ld -T link.ld init.o $1.o -o main.elf
riscv32-unknown-elf-objcopy -O verilog main.elf main.hex
exit 0
