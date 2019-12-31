class alu_monitor ;

    mailbox mon2scb;
    mailbox mon2scb2;
    virtual alu_interface aif;
    bit  cout_r;
    bit [31:0] sum_r;
    
    function new(mailbox mon2scb,mon2scb2,virtual alu_interface aif);
		this.mon2scb=mon2scb;
    		this.mon2scb2=mon2scb2;
		this.aif=aif;
  
    endfunction

    task main;
        while(1)
            begin
                @(negedge aif.enable) 
                    cout_r = aif.cout_r;
                    mon2scb2.put(cout_r);
                    sum_r=aif.sum_r;
		    mon2scb.put(sum_r);
                end
    endtask 
endclass
