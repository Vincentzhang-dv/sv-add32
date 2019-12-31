class alu_reference;
    mailbox drv2ref;
    mailbox ref2scb;
    mailbox ref2scb2;
        bit  cout_r;
       	bit [31:0] sum_r;
	bit [32:0] sum_total;
function new (mailbox drv2ref,mailbox ref2scb,ref2scb2);
    this.drv2ref=drv2ref;
    this.ref2scb=ref2scb;
    this.ref2scb2=ref2scb2;
endfunction

task main;
        alu_transaction atr;
        while(1)begin
			drv2ref.peek(atr);
                        sum_total=atr.a+atr.b+atr.cin;
                        sum_r=sum_total[31:0];
                        cout_r=sum_total[32];
                        $display("alu_reference:cin=0x%0d;a=0x%0h;b=0x%0h;sum_r=0x%0h;cout_r=0x%0h ",atr.cin,atr.a,atr.b,sum_r,cout_r);
                        drv2ref.get(atr);
			ref2scb.put(sum_r);
			ref2scb2.put(cout_r);
                end


 endtask 
 endclass 
