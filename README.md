# curly-duck
test for verilog_obfuscator

The project is built in VS2013.

The console command is like this：

verilog_obfuscator.exe test.v

test.v is the input file, which should be written in verilog language.

The program only change the names of regs, wires and parameters.The interface of the module is not changed, like inputs, outputs as well as module name.Some wires and regs are inputs or outputs, also they are not changed.

NOTE: This project is still under debugging....
