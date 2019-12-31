class alu_scoreboard;
    	mailbox mon2scb,ref2scb;
	mailbox mon2scb2,ref2scb2;
	
  
  bit [31:0] sum_r_ref,sum_r_mon,sum_r_tmp,expect_queue3[$];
  bit cout_r_ref,cout_r_mon,cout_r_tmp,expect_queue4[$];
	function new(mailbox mon2scb,mon2scb2,mailbox ref2scb,ref2scb2);
		this.ref2scb=ref2scb;
		this.mon2scb=mon2scb;
		this.ref2scb2=ref2scb2;
		this.mon2scb2=mon2scb2;
	endfunction

task main();
        fork 
        while(1) begin
            ref2scb.get(sum_r_ref);
            ref2scb2.get(cout_r_ref);
	    expect_queue3.push_back(sum_r_ref);		 
            expect_queue4.push_back(cout_r_ref);
        end

         while(1) begin 
            mon2scb.get(sum_r_mon);
            mon2scb2.get(cout_r_mon);
            if(expect_queue3.size()>0&&expect_queue4.size()>0) 
        	        begin
        	            sum_r_tmp = expect_queue3.pop_front();
        	            cout_r_tmp = expect_queue4.pop_front();
        	          if(sum_r_tmp==sum_r_mon&&cout_r_tmp==cout_r_mon) 
        	                 begin
        	                 $display("alu_scoreboard:Compare SUCCESSFULLY ////////////");
        	                 end
        	          else 
        	                 begin
        	                  $display("alu_scoreboard:Compare FAILED *******************");
        	                  $display("alu_scoreboard:the expect pkt is %0h",sum_r_tmp);
        	                  $display("alu_scoreboard:the actual pkt is %0h",sum_r_mon);
        	                  $display("alu_scoreboard:the expect pkt is %0h",cout_r_tmp);
        	                  $display("alu_scoreboard:the actual pkt is %0h",cout_r_mon);
        	                 end
        	       end
            else begin
        	         $display("alu_scoreboard:ERROR::Received result data  from DUT is :sum_r_mon=%0h,cout_r_mon=%0h,while Expect Queue is empty",sum_r_mon,cout_r_mon);
        	 end
       
        	end     
            join
endtask 
endclass
