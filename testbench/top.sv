`timescale 1ns/1ns
//`include "../testbench/alu_interface.sv"
//`include "../testbench/test.sv"
//`include "../rtl/alu.v"

module top();
	
	int repeatnum=$urandom_range(10,20);

	alu_interface aif();
	 
add32_cla inst1 (.clk(aif.clk),.rst(aif.rst),.enable(aif.enable),.a(aif.a),.b(aif.b),.cin(aif.cin),.sum_r(aif.sum_r),.cout_r(aif.cout_r));

//typedef enum{red,green,blue,yellow} colors;
//colors	my_colors;
//
//initial begin 
//    $display("my_colors default is %s ",my_colors);
//end 


       initial begin
		aif.clk = 0;
		 
		#500 aif.clk = 0;
		#500 aif.clk = 1;
		forever 
			#50 aif.clk = ~aif.clk;
	        end
	test utest(repeatnum,aif);

endmodule 

//    initial begin 
//        $fsdbDumpfile("wave.fsdb");
//        $fsdbDumpvars(0,top);
//    end
//	initial begin
//		$dumpfile("test.vcd");//记录波形
//		$dumpvars(0,top);
//		$dumpon;
//	end
   // initial begin
   // @(posedge aif.rst) 
   // $shm_open("./wave_int");
   // $shm_probe(top,"AC");
    
    //$shm_close; 

    //$shm_close;
