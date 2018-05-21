`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:07:00 05/22/2018 
// Design Name: 
// Module Name:    JumpAddre_toMemAddre 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module JumpAddre_toMemAddre(
		pcP4_i,
		JumpAddre_i,
		pc_MemAddre_o
    );

input 	[32-1:0]	pcP4_i;
input 	[26-1:0]	JumpAddre_i;
output 	[32-1:0]	pc_MemAddre_o;

assign pc_MemAddre_o[31:28] = pcP4_i[31:28];
assign pc_MemAddre_o[27:2] = JumpAddre_i[26-1:0];
assign pc_MemAddre_o[1:0] = 2'b00;

endmodule
