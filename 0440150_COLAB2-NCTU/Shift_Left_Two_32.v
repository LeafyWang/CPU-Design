//Subject:      CO project 2 - Shift_Left_Two_32
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module Shift_Left_Two_32(
    data_i,
    data_o
    );

//I/O ports                    
input [32-1:0] data_i;
output [32-1:0] data_o;

//wire [32-1:0] data_i ; 
wire [32-1:0] data_o ;

//shift left 2
assign data_o[32-1:0] = {data_i[32-1],data_i[28:0],2'b00};

endmodule