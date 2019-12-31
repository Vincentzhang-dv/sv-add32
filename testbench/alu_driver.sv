class alu_driver;
	mailbox gen2drv;
	mailbox drv2ref;
	virtual alu_interface aif;
	int repeatnum;


function new(mailbox gen2drv,drv2ref,virtual alu_interface aif,int repeatnum);
	this.gen2drv=gen2drv;
	this.drv2ref=drv2ref;
	this.aif=aif;
	this.repeatnum=repeatnum;
endfunction

task main;
	alu_transaction atr;
				
	repeat(repeatnum)begin
		gen2drv.peek(atr);
		drv2ref.put(atr);
		//covalu.sample();
		drive1pkt(atr);
		atr.covalu.sample;
		gen2drv.get(atr);
	end
endtask


task reset_dut();
	aif.rst=1'b0;
	aif.cin=1'b0;
	aif.a=32'h00000000;
	aif.b=32'h00000000;
      #1234 aif.rst=1'b1;
            
	
endtask


task drive1pkt(alu_transaction atr);
       
	@aif.drv_cb;
	@aif.drv_cb
	begin
		aif.enable<=1'b1;
		aif.cin<=atr.cin;
		aif.a<=atr.a;
		aif.b<=atr.b;
	end
	@aif.drv_cb aif.enable<=1'b0;
	@aif.drv_cb;
     
            
endtask


endclass


