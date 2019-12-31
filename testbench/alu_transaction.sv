class alu_transaction;
    rand bit cin ;
    rand bit[31:0] a , b;

covergroup covalu ;
   cover1: coverpoint a ;   
endgroup

    function new();
	covalu=new();
    endfunction

    function alu_transaction copy();
        copy = new();
        copy.cin = this.cin;
        copy.a = this.a;
        copy.b = this.b;
    endfunction

    function alu_display();
	$display("super alu_display be used ");
    endfunction

constraint  max {
	    cin inside {0};
	    //b inside {255,256};
	    soft b inside {255,256};
	    //b inside {[0xfffe:0xffff]};
	    //a == '1;
	    a inside {255,266};
}

//covergroup covalu ;
//   cover1: coverpoint a ;   
//endgroup

endclass
