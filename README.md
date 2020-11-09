# Flintstone

An implementation of the [Hack](https://www.nand2tetris.org/) computer in Verilog targetting the [Arty Atrix-7](https://store.digilentinc.com/arty-a7-artix-7-fpga-development-board-for-makers-and-hobbyists/) FPGA platform.

## Known issues
* ROM initialization memory always begins with `0x0000`. This means that binary generated to be executed must have instruction pointers offset by `1`.
