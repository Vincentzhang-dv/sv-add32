class alu_generator;
    alu_transaction blueprint;
    mailbox gen2drv;

    function new(mailbox gen2drv);
        this.gen2drv = gen2drv;
        blueprint = new();
    endfunction

    task main();
        alu_transaction atr;
        while(1) begin
	    blueprint.max.constraint_mode(0);
	   // blueprint.a.rand_mode(0);
	   //blueprint.a = 255;
           // assert(blueprint.randomize() with{b == 258;});
            assert(blueprint.randomize());
	    atr = blueprint.copy();
	    //$cast(atr,blueprint.copy());
            gen2drv.put(atr);
        end 
    endtask 
endclass
