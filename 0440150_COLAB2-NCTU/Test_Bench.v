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
integer     handle;
integer     end_count;
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
    end_count=25;
    #(`CYCLE_TIME)      RST = 1;
    #(`CYCLE_TIME*`END_COUNT)	$finish;
end

always@(posedge CLK) begin
    count = count + 1;
	if( count == `END_COUNT )
	begin 
		$display("r0= %d, r1= %d, r2= %d, r3= %d, r4= %d, r5= %d, r6= %d, r7= %d",cpu.RF.Reg_File[0], cpu.RF.Reg_File[1], cpu.RF.Reg_File[2], cpu.RF.Reg_File[3], cpu.RF.Reg_File[4], 
				  cpu.RF.Reg_File[5], cpu.RF.Reg_File[6], cpu.RF.Reg_File[7]);
		$display("r8= %d, r=9 %d, r10=%d, r11=%d, r12=%d, r=13%d, r14=%d, r15=%d",cpu.RF.Reg_File[8], cpu.RF.Reg_File[9], cpu.RF.Reg_File[10], cpu.RF.Reg_File[11], cpu.RF.Reg_File[12], 
				  cpu.RF.Reg_File[13], cpu.RF.Reg_File[14], cpu.RF.Reg_File[15]);
		$display("r16=%d, r17=%d, r18=%d, r19=%d, r20=%d, r21=%d, r22=%d, r23=%d",cpu.RF.Reg_File[16], cpu.RF.Reg_File[17], cpu.RF.Reg_File[18], cpu.RF.Reg_File[19], cpu.RF.Reg_File[20], 
				  cpu.RF.Reg_File[21], cpu.RF.Reg_File[22], cpu.RF.Reg_File[23]);
		$display("r24=%d, r25=%d, r26=%d, r27=%d, r28=%d, r29=%d, r30=%d, r31=%d",cpu.RF.Reg_File[24], cpu.RF.Reg_File[25], cpu.RF.Reg_File[26], cpu.RF.Reg_File[27], cpu.RF.Reg_File[28], 
				  cpu.RF.Reg_File[29], cpu.RF.Reg_File[30], cpu.RF.Reg_File[31]);
	end
	else ;
end
  
endmodule
