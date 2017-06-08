//Subject:     CO project 2 - ALU Controller
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module ALU_Ctrl(
          funct_i,
          ALUOp_i,
          ALUCtrl_o
          );
          
//I/O ports 
input      [6-1:0] funct_i;
input      [3-1:0] ALUOp_i;

output     [4-1:0] ALUCtrl_o;    
     
//Internal Signals
reg        [4-1:0] ALUCtrl_o;

//Parameter

       
//Select exact operation
always @(*) begin
case (ALUOp_i)
	2:case(funct_i)
		32: ALUCtrl_o = 4'b0010;//add
		34: ALUCtrl_o = 4'b0110;//sub
		36: ALUCtrl_o = 4'b0000;//and
		37: ALUCtrl_o = 4'b0001;//or
		42: ALUCtrl_o = 4'b0111;//slt
		0:  ALUCtrl_o = 4'b0011;//sll?
		6:  ALUCtrl_o = 4'b0100;//srlv?
          endcase
	4:ALUCtrl_o = 4'b0010;//addi
	1:ALUCtrl_o = 4'b0110;//beq	
	5:ALUCtrl_o = 4'b0111;//slti
	3:ALUCtrl_o = 4'b1001;//lui?
	0:ALUCtrl_o = 4'b1010;//ori?
	7:ALUCtrl_o = 4'b1011;//bne?
endcase
//case(funct_i)
//	32: ALUCtrl_o = 4'b0010;//add
//	34: ALUCtrl_o = 4'b0110;//sub
//	36: ALUCtrl_o = 4'b0000;//and
//	37: ALUCtrl_o = 4'b0001;//or
//	42: ALUCtrl_o = 4'b0111;//slt
//	0: case(ALUOp_i)
//		4:ALUCtrl_o = 4'b0010;//addi
//		5:ALUCtrl_o = 4'b0111;//slti
//		1:ALUCtrl_o = 4'b0110;//beq
//	   endcase
//endcase
end

endmodule     





                    
                    