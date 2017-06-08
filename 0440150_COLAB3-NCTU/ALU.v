//Subject:     CO project 2 - ALU
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module ALU(
    src1_i,
	src2_i,
	ctrl_i,
	result_o,
	zero_o,
	shamt,
	imm,
//pc_o
	);
     
//I/O ports
input  [32-1:0]  src1_i;
input  [32-1:0]	 src2_i;
input  [4-1:0]   ctrl_i;
input  [4:0]    shamt; 
input  [16-1:0] imm;

output [32-1:0]	 result_o;
output           zero_o;
//output [32-1:0]	 pc_o;

//Internal signals
reg    [32-1:0]  result_o;
reg    [32-1:0]  pc_o;
wire             zero_o;

//Parameter

//Main function

always @(*) begin
case(ctrl_i)
	4'b0000: result_o = src1_i & src2_i;//and--
        4'b0001: result_o = src1_i | src2_i;//or--
        4'b0010: result_o = src1_i + src2_i; //add --
        4'b0110: result_o = src1_i - src2_i; //sub,beq,bgt,bne
        4'b1100: result_o = ~(src1_i | src2_i); //nor
        4'b1101: result_o = ~(src1_i & src2_i); //nand
        4'b0111: result_o = src1_i < src2_i ? 1 : 0 ; //slt --
	4'b0011: result_o = src2_i << shamt;//sll
	4'b0100: result_o = src2_i >> src1_i[4:0];//slrv
	4'b1001: result_o[32-1:0] = {imm,16'b0000000000000000};//lui
	4'b1010: result_o = src1_i | {16'b0,imm};//ori
	/////////////////////////////4'b1011: result_o = (src1_i == src2_i) ? 1 : 0 ;//bne
	4'b1000: result_o = src1_i * src2_i; //mul
	4'b1111: result_o = src1_i;   //bnez bgez

	//4'b1110:
	//4'b0101: begin pc_o = src1_i ; end 

        /*4'b1000: result_o = src1_i > src2_i ? 1 : 0 ; //sgt
        4'b1001: result_o = src1_i <= src2_i ? 1 : 0 ; //sle
        4'b1010: result_o = src1_i >= src2_i ? 1 : 0 ; //sge
        4'b1011: result_o = src1_i == src2_i ? 1 : 0 ;  //seq
        4'b1110: result_o = src1_i != src2_i ? 1 : 0 ; //sne
        4'b0011: result_o = src1_i * src2_i; //mul
        4'b0100: result_o = src1_i == 0 ? 1 : 0 ; //set equal zero*/
        default: result_o = 0;
endcase
end
assign zero_o = (result_o == 0);
endmodule





                    
                    