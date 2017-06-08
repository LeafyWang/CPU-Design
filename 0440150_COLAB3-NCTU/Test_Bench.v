//Subject:     CO project 2 - Test Bench
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

`define CYCLE_TIME 10			
`define END_COUNT 250
module TestBench;

//Internal Signals
reg         CLK;
reg         RST;
integer     count;

//Greate tested modle  
Simple_Single_CPU cpu(
        .clk_i(CLK),
		.rst_i(RST)
		);
 
//Main function

always #(`CYCLE_TIME/2) CLK = ~CLK;	

initial  begin
	CLK = 0;
    RST = 0;
	count = 0;
	
    #(`CYCLE_TIME)      RST = 1;
    #(`CYCLE_TIME*`END_COUNT)	$finish;
end

always@(posedge CLK) begin
    count = count + 1;
	if( count == `END_COUNT )
	begin 
		$display("				Register			");
		$display("r0= %d, r1= %d, r2= %d, r3= %d, r4= %d, r5= %d, r6= %d, r7= %d",cpu.RF.Reg_File[0], cpu.RF.Reg_File[1], cpu.RF.Reg_File[2], cpu.RF.Reg_File[3], cpu.RF.Reg_File[4], 
				  cpu.RF.Reg_File[5], cpu.RF.Reg_File[6], cpu.RF.Reg_File[7]);
		$display("r8= %d, r=9 %d, r10=%d, r11=%d, r12=%d, r=13%d, r14=%d, r15=%d",cpu.RF.Reg_File[8], cpu.RF.Reg_File[9], cpu.RF.Reg_File[10], cpu.RF.Reg_File[11], cpu.RF.Reg_File[12], 
				  cpu.RF.Reg_File[13], cpu.RF.Reg_File[14], cpu.RF.Reg_File[15]);
		$display("r16=%d, r17=%d, r18=%d, r19=%d, r20=%d, r21=%d, r22=%d, r23=%d",cpu.RF.Reg_File[16], cpu.RF.Reg_File[17], cpu.RF.Reg_File[18], cpu.RF.Reg_File[19], cpu.RF.Reg_File[20], 
				  cpu.RF.Reg_File[21], cpu.RF.Reg_File[22], cpu.RF.Reg_File[23]);
		$display("r24=%d, r25=%d, r26=%d, r27=%d, r28=%d, r29=%d, r30=%d, r31=%d",cpu.RF.Reg_File[24], cpu.RF.Reg_File[25], cpu.RF.Reg_File[26], cpu.RF.Reg_File[27], cpu.RF.Reg_File[28], 
				  cpu.RF.Reg_File[29], cpu.RF.Reg_File[30], cpu.RF.Reg_File[31]);
		$display("				Memory			");		  
		$display("m0= %d, m1= %d, m2= %d, m3= %d, m4= %d, m5= %d, m6= %d, m7= %d",cpu.DM.memory[0], cpu.DM.memory[1], cpu.DM.memory[2], cpu.DM.memory[3], cpu.DM.memory[4], 
				  cpu.DM.memory[5], cpu.DM.memory[6], cpu.DM.memory[7]);
		$display("m8= %d, m=9 %d, m10=%d, m11=%d, m12=%d, m=13%d, m14=%d, m15=%d",cpu.DM.memory[8], cpu.DM.memory[9], cpu.DM.memory[10], cpu.DM.memory[11], cpu.DM.memory[12], 
				  cpu.DM.memory[13], cpu.DM.memory[14], cpu.DM.memory[15]);
		$display("m16=%d, m17=%d, m18=%d, m19=%d, m20=%d, m21=%d, m22=%d, m23=%d",cpu.DM.memory[16], cpu.DM.memory[17], cpu.DM.memory[18], cpu.DM.memory[19], cpu.DM.memory[20], 
				  cpu.DM.memory[21], cpu.DM.memory[22], cpu.DM.memory[23]);
		$display("m24=%d, m25=%d, m26=%d, m27=%d, m28=%d, m29=%d, m30=%d, m31=%d",cpu.DM.memory[24], cpu.DM.memory[25], cpu.DM.memory[26], cpu.DM.memory[27], cpu.DM.memory[28], 
				  cpu.DM.memory[29], cpu.DM.memory[30], cpu.DM.memory[31]);		  
				  
	end
	else ;
end
  
endmodule
