//Subject:     CO project 2 - Simple Single CPU
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------
module Simple_Single_CPU(
        clk_i,
		rst_i
		);
		
//I/O port
input         clk_i;
input         rst_i;

//Internal Signles
wire [32-1:0]  pc_i ;//
wire [32-1:0] pc_o ;  //
wire [32-1:0] add1_i; //
wire [32-1:0] add1_o ; //
assign add1_i [32-1:0] = 4 ; //
wire [32-1:0] instr ;//
wire [4:0] WriteReg_1;//
wire RegDst;//
wire RegWrite;//
wire [3-1:0] ALU_op;//
wire ALUSrc;//
wire Branch;//
wire [4-1:0] ALU_Ctrl;//
wire [32-1:0] SignEx;//
wire [32-1:0] ALU_2;//
wire [32-1:0] ALU_o; //
wire zero;//
wire [32-1:0] Shift_o;//
wire [32-1:0] add2_o;//

wire [32-1:0] ReadData1;//
wire [32-1:0] ReadData2;//

wire [1:0]BranchType;//
wire Jump;
wire MemRead;//
wire MemWrite;//
wire [1:0]MemtoReg;//

wire [32-1:0] Read_o;
wire [32-1:0] WriteData;
wire  BranchData;
wire [32-1:0] PCtemp;

//Greate componentes
ProgramCounter PC(
        .clk_i(clk_i),      //
	    .rst_i (rst_i),     //
	    .pc_in_i(pc_i) ,   //
	    .pc_out_o(pc_o)    //
	    );
	
Adder Adder1(
        .src1_i(add1_i),     //
	    .src2_i(pc_o),   //  
	    .sum_o(add1_o)   // 
	    );
	
Instr_Memory IM(
        .pc_addr_i(pc_o),  //
	    .instr_o(instr)  //  
	    );

MUX_2to1 #(.size(5)) Mux_Write_Reg(
        .data0_i(instr[20:16]),//
        .data1_i(instr[15:11]),//
        .select_i(RegDst),//
        .data_o(WriteReg_1)//
        );	
		
Reg_File RF(
        .clk_i(clk_i),      //
	    .rst_i(rst_i) ,     //
        .RSaddr_i(instr[25:21]) ,  //
        .RTaddr_i(instr[20:16]) ,  //
        .RDaddr_i(WriteReg_1) ,  //
        .RDdata_i(WriteData)  , //
        .RegWrite_i (RegWrite),//
        .RSdata_o(ReadData1) ,  //
        .RTdata_o(ReadData2)   //
        );
	
Decoder Decoder(
        .instr_op_i(instr[32-1:26]), //
	    .RegWrite_o(RegWrite), //
	    .ALU_op_o(ALU_op),   //
	    .ALUSrc_o(ALUSrc),   //
	    .RegDst_o(RegDst),   //
		.Branch_o(Branch), //
	.BranchType(BranchType),
	.Jump(Jump),
	.MemRead(MemRead),
	.MemWrite(MemWrite),
	.MemtoReg(MemtoReg)  
//.WriteReg_i(WriteReg_1),
//.WriteData_i(WriteData),
//.PC_i(add1_o),
//.WriteReg_o(WriteReg_1),
//.WriteData_o(WriteData)
	    );

ALU_Ctrl AC(
        .funct_i(instr[6-1:0]),  // 
        .ALUOp_i(ALU_op),   //
        .ALUCtrl_o(ALU_Ctrl) //
        );
	
Sign_Extend SE(
        .data_i(instr[16-1:0]), //
        .data_o(SignEx)//
        );

MUX_2to1 #(.size(32)) Mux_ALUSrc(
        .data0_i(ReadData2),//
        .data1_i(SignEx),//
        .select_i(ALUSrc),//
        .data_o(ALU_2)//
        );	
		
ALU ALU(
        .src1_i(ReadData1),//
	    .src2_i(ALU_2),//
	    .ctrl_i(ALU_Ctrl),//
	    .result_o(ALU_o),//
		.zero_o(zero),//
	    .shamt(instr[10:6]),
	    .imm(instr[16-1:0])
	//.pc_o(pc_i)
	    );
		
Adder Adder2(
        .src1_i(add1_o), //    
	    .src2_i(Shift_o), //    
	    .sum_o(add2_o)      //
	    );
		
Shift_Left_Two_32 Shifter(
        .data_i(SignEx),//
        .data_o(Shift_o)//
        ); 		
		
MUX_2to1 #(.size(32)) Mux_PC_Source(
        .data0_i(add1_o), //
        .data1_i(add2_o),//
        .select_i(Branch&BranchData),//++++++++++++++++++++++++
        .data_o(PCtemp)  //
        );	
MUX_2to1 #(.size(32)) Mux_PC_Jump(
        .data0_i(PCtemp), //
        .data1_i({add1_o[32-1:28],instr[25:0],2'b00}),//
        .select_i(Jump),//++++++++++++++++++++++++
        .data_o(pc_i)  //
        );	

Data_Memory DM
(
	.clk_i(clk_i),
	.addr_i(ALU_o),
	.data_i(ReadData2),
	.MemRead_i(MemRead),
	.MemWrite_i(MemWrite),
	.data_o(Read_o)
);

MUX_3to1 MtoR
(
               .data0_i(ALU_o),
               .data1_i(Read_o),
	       .data2_i(SignEx),
               .select_i(MemtoReg),
               .data_o(WriteData)
               );

MUX_4to1 BranchT
(
               .data0_i(zero),
               .data1_i(~(ALU_o[31]+zero)),
	       .data2_i(~ALU_o[31]),
	       .data3_i(~zero),
               .select_i(BranchType),
               .data_o(BranchData)
               );


endmodule
		  


