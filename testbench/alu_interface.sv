    interface alu_interface;
        
        reg clk , rst ;
        reg  enable   ; 
        reg  cout_r;
        reg [31:0]sum_r;
	reg cin     ; 
	reg [31:0] a ; 
	reg [31:0] b ; 
        clocking drv_cb @(posedge clk);
		        input rst,cout_r,sum_r;
		        output enable,cin,a,b;
	      endclocking
endinterface
