//Subject:     CO project 1 - ALU
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:     ?? 0440150 
//----------------------------------------------
//Date:        2016/4/4
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module ALU(
	rst_n,
   src1_i,
	src2_i,
	ctrl_i,
	result_o,
	zero_o
	);
     
//I/O ports
input rst_n;
input  [32-1:0]  src1_i;
input  [32-1:0]  src2_i;
input  [4-1:0]   ctrl_i;

output [32-1:0]  result_o;
output           zero_o;

//Internal signals
reg    [32-1:0]  result_o;
wire             zero_o;

//Parameter


//Main function
assign zero_o = (result_o==0);
always@ (src1_i or src2_i or ctrl_i) begin
    case(ctrl_i)
        4'b0000: result_o <= src1_i & src2_i;
        4'b0001: result_o <= src1_i | src2_i;
        4'b0010: result_o <= src1_i + src2_i;
        4'b0110: result_o <= src1_i - src2_i;
        4'b1100: result_o <= ~(src1_i | src2_i); //nor
        4'b1101: result_o <= ~(src1_i & src2_i); //nand
        4'b0111: result_o <= src1_i < src2_i ? 1 : 0 ; //slt
        4'b1000: result_o <= src1_i > src2_i ? 1 : 0 ; //sgt
        4'b1001: result_o <= src1_i <= src2_i ? 1 : 0 ; //sle
        4'b1010: result_o <= src1_i >= src2_i ? 1 : 0 ; //sge
        4'b1011: result_o <= src1_i == src2_i ? 1 : 0 ;  //seq
        4'b1110: result_o <= src1_i != src2_i ? 1 : 0 ; //sne
        4'b0011: result_o <= src1_i * src2_i; //mul
        4'b0100: result_o <= src1_i == 0 ? 1 : 0 ; //set equal zero
        default: result_o <= 0;
    endcase
end

endmodule

