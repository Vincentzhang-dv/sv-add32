//`include "../testbench/alu_environment.sv"
program automatic test(input int repeatnum,alu_interface aif);
	alu_environment env;

	initial begin
		env=new(repeatnum,aif);
		env.builde;
		env.drv.reset_dut;
		env.main;
	end
endprogram
