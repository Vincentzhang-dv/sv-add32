//`include "../testbench/alu_transaction.sv"
//`include "../testbench/alu_driver.sv"
//`include "../testbench/alu_generator.sv"
//`include "../testbench/alu_monitor.sv"
//`include "../testbench/alu_scoreboard.sv"
//`include "../testbench/alu_reference.sv"
class alu_environment;
	virtual alu_interface aif;
	mailbox gen2drv,drv2ref,mon2scb,mon2scb2,ref2scb,ref2scb2;
	alu_driver      drv;
	alu_generator   gen;
	alu_monitor     mon;
	alu_scoreboard  scb;
	alu_reference   rfa;
	int repeatnum;

	function new(int repeatnum,virtual alu_interface aif);
		this.repeatnum=repeatnum;
		$display("repeatnum value is ",repeatnum);
		this.aif=aif;
	endfunction

	function builde();
		gen2drv=new(1);	
		drv2ref=new(1);
		mon2scb=new(1);
		ref2scb=new(1);
		mon2scb2=new(1);
		ref2scb2=new(1);
		drv=new(gen2drv,drv2ref,aif,repeatnum);
		gen=new(gen2drv);
		mon=new(mon2scb,mon2scb2,aif);
		scb=new(mon2scb,mon2scb2,ref2scb,ref2scb2);
		rfa=new(drv2ref,ref2scb,ref2scb2);
	endfunction

	task  main;
		fork 
			drv.main;
			gen.main;
			mon.main;
			scb.main;
			rfa.main;
		join_any
	endtask
endclass		
	
