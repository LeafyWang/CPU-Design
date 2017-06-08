//Subject:     CO project 2 - Decoder
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module Decoder(
    instr_op_i,
	RegWrite_o,
	ALU_op_o,
	ALUSrc_o,
	RegDst_o,
	Branch_o,
	BranchType,
	Jump,
	MemRead,
	MemWrite,
	MemtoReg
//WriteReg_i,
///WriteData_i,
//PC_i,
//WriteReg_o,
//WriteData_o

	);
     
//I/O ports
input  [6-1:0] instr_op_i;

//input[31:0] WriteReg_i;
//input [31:0] WriteData_i;
//input [31:0]PC_i;
//output [31:0]WriteReg_o;
//output [31:0] WriteData_o;

output         RegWrite_o;
output [3-1:0] ALU_op_o;
output         ALUSrc_o;
output         RegDst_o;
output         Branch_o;

output [1:0]BranchType;
output		Jump;
output		MemRead;
output 		MemWrite;
output [1:0]MemtoReg;
 
//Internal Signals
reg    [3-1:0] ALU_op_o;
reg            ALUSrc_o;
reg            RegWrite_o;
reg            RegDst_o;
reg            Branch_o;

reg [1:0]BranchType;
reg		Jump;
reg		MemRead;
reg 		MemWrite;
reg [1:0]MemtoReg;

//reg[31:0] WriteReg_i;
//reg [31:0] WriteData_i;
//reg [31:0]WriteReg_o;
//reg [31:0] WriteData_o;

//Parameter


//Main function
always @(*) begin
case(instr_op_i)
	0: begin ALU_op_o = 3'b010 ; ALUSrc_o = 0;RegWrite_o = 1; RegDst_o = 1;Branch_o = 0; 
		BranchType = 0; Jump = 0; MemRead = 0; MemWrite = 0; MemtoReg = 0;end//add,sub,and,or,slt,sll,srlv,mul     ????JR
	4: begin ALU_op_o = 3'b001 ; ALUSrc_o = 0;RegWrite_o = 0; RegDst_o = 0;Branch_o = 1;  
		BranchType = 0; Jump = 0; MemRead = 0; MemWrite = 0; MemtoReg = 0;end//beq++++++++++++++++++++++++++++++++++++++++++++++
        8: begin ALU_op_o = 3'b100 ; ALUSrc_o = 1;RegWrite_o = 1; RegDst_o = 0;Branch_o = 0;  
		BranchType = 0; Jump = 0; MemRead = 0; MemWrite = 0; MemtoReg = 0;end//addi
	10:begin ALU_op_o = 3'b101 ; ALUSrc_o = 1;RegWrite_o = 1; RegDst_o = 0;Branch_o = 0;  
		BranchType = 0; Jump = 0; MemRead = 0; MemWrite = 0; MemtoReg = 0;end//slti
	15:begin ALU_op_o = 3'b011 ; ALUSrc_o = 1;RegWrite_o = 1; RegDst_o = 0;Branch_o = 0;  
		BranchType = 0; Jump = 0; MemRead = 0; MemWrite = 0; MemtoReg = 0;end//lui
	13:begin ALU_op_o = 3'b000 ; ALUSrc_o = 1;RegWrite_o = 1; RegDst_o = 0;Branch_o = 0;  
		BranchType = 0; Jump = 0; MemRead = 0; MemWrite = 0; MemtoReg = 0;end//ori
	5: begin ALU_op_o = 3'b001 ; ALUSrc_o = 0;RegWrite_o = 0; RegDst_o = 0;Branch_o = 1;  
		BranchType = 3; Jump = 0; MemRead = 0; MemWrite = 0; MemtoReg = 0;end//bne++++++++++++++++++++++++++++++++++++++++++++++++++
	35: begin ALU_op_o = 3'b100 ; ALUSrc_o = 1;RegWrite_o = 1; RegDst_o = 0;Branch_o = 0;  
		BranchType = 0; Jump = 0; MemRead = 1; MemWrite = 0; MemtoReg = 1;end//lw
	43: begin ALU_op_o = 3'b100 ; ALUSrc_o = 1;RegWrite_o = 0; RegDst_o = 0;Branch_o = 0;  
		BranchType = 0; Jump = 0; MemRead = 0; MemWrite = 1; MemtoReg = 1;end//sw
	2:  begin ALU_op_o = 3'b000 ; ALUSrc_o = 0;RegWrite_o = 0; RegDst_o = 0;Branch_o = 0;  
		BranchType = 0; Jump = 1; MemRead = 0; MemWrite = 0; MemtoReg = 0;end//jump
	7:  begin ALU_op_o = 3'b001 ; ALUSrc_o = 0;RegWrite_o = 0; RegDst_o = 0;Branch_o = 1;  
		BranchType = 1; Jump = 0; MemRead = 0; MemWrite = 0; MemtoReg = 0;end//          bgt\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
	6:  begin ALU_op_o = 3'b110 ; ALUSrc_o = 0;RegWrite_o = 0; RegDst_o = 0;Branch_o = 1;  
		BranchType = 3; Jump = 0; MemRead = 0; MemWrite = 0; MemtoReg = 0;end//          bnez\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
        1:  begin ALU_op_o = 3'b110 ; ALUSrc_o = 0;RegWrite_o = 0; RegDst_o = 0;Branch_o = 1;  
		BranchType = 2; Jump = 0; MemRead = 0; MemWrite = 0; MemtoReg = 0;end//          bgez\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
	3:  begin ALU_op_o = 3'b111 ; ALUSrc_o = 0;RegWrite_o = 1; RegDst_o = 0;Branch_o = 0;  
		BranchType = 0; Jump = 1; MemRead = 0; MemWrite = 0; MemtoReg = 0;end //jal
		//WriteReg_o = 31;WriteData_o = PC_i + 4  ;end//jal

	default:
		begin ALU_op_o = 3'b000 ;ALUSrc_o = 0; RegWrite_o = 0; RegDst_o = 0; Branch_o = 0;end
endcase
end
endmodule





                    
                    