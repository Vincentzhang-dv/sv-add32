module add32_cla(
                clk,
                rst,
                enable,
                a,
                b,
                cin,
                sum_r,
                cout_r);

input clk,rst,enable;
input [31:0] a,b;
input cin ;
output reg[31:0] sum_r;
output reg cout_r;

always@(posedge clk or negedge rst)
    begin
        if(!rst) begin
            sum_r = 32'h000000000;
            cout_r = 32'h00000000;
        end
        else if (enable) 
            begin 
            {cout_r,sum_r} <=  a+b+cin;
            end 
        else 
            begin 
            sum_r <= sum_r;
            cout_r <= cout_r;
            end 
    end
    endmodule
