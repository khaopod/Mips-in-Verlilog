
# Mips CPU Project
____
## Compiling
To run verilog on our project use `iverilog` as a compiler with this follow code.
```
iverilog -o topmodule topmodule.v /imem/imem.v /cUnit/cUnit.v
```

## Test Bench
In each folder we will contain module and its test bench.
You can test your module by test bench module
> For our project, the module which have `_t.v` follow the module name is test bench.

## Checking Result
You can also check its result by dump the file and open it by `gtkwave` application.
