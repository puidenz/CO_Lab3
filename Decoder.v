//Subject:     CO project 2 - Decoder
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      0516223
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
	Memto_Reg_o,
	MemRead_o,
	MemWrite_o,
	Jump_o
	);
     
//I/O ports
input  [6-1:0] instr_op_i;

output         RegWrite_o;
output [3-1:0] ALU_op_o;
output         ALUSrc_o;
output         RegDst_o;
output         Branch_o;
output         Memto_Reg_o;
output         MemRead_o;
output         MemWrite_o;
output         Jump_o;


//Internal Signals
reg    [3-1:0] ALU_op_o;
reg            ALUSrc_o;
reg            RegWrite_o;
reg            RegDst_o;
reg            Branch_o;
reg            Memto_Reg_o;
reg            MemRead_o;
reg            MemWrite_o;
reg            Jump_o;
//Parameter


//Main function
always @( * ) begin
	case (instr_op_i)
	0: //R-type+jr
		begin
		ALU_op_o <= 3'b010;
		ALUSrc_o <= 1'b0;
		RegWrite_o <= 1'b1;
		RegDst_o <= 1'b1;
		Branch_o <= 1'b0;
		Memto_Reg_o <= 1'b0;
		MemRead_o <= 1'b0;
		MemWrite_o <= 1'b0;
		Jump_o <= 1'b0;
		end
	2: //jump	
	   begin
	   ALU_op_o <= 3'b000;
       ALUSrc_o <= 1'b0;
       RegWrite_o <= 1'b0;
       RegDst_o <= 1'b0;
       Branch_o <= 1'b0;
       Memto_Reg_o <= 1'b0;
       MemRead_o <= 1'b0;
       MemWrite_o <= 1'b0;
       Jump_o <= 1'b1;
	   end
	3: //jal	
	   begin
	   ALU_op_o <= 3'b000;
       ALUSrc_o <= 1'b0;
       RegWrite_o <= 1'b0;
       RegDst_o <= 1'b0;
       Branch_o <= 1'b0;
       Memto_Reg_o <= 1'b0;
       MemRead_o <= 1'b0;
       MemWrite_o <= 1'b0;
       Jump_o <= 1'b1;
	   end
	4: //Branch equal beq
		begin
		ALU_op_o <= 3'b110;
		ALUSrc_o <= 1'b0;
		RegWrite_o <= 1'b0;
		RegDst_o <= 1'b0; //X
		Branch_o <= 1'b1;
		Memto_Reg_o <= 1'b0;
        MemRead_o <= 1'b0;
        MemWrite_o <= 1'b0;
        Jump_o <= 1'b0;
		end
	5: // Bne
		begin
		ALU_op_o <= 3'b111;
		ALUSrc_o <= 1'b0;
		RegWrite_o <= 1'b0;
		RegDst_o <= 1'b0; //X
		Branch_o <= 1'b1;
		Memto_Reg_o <= 1'b0;
        MemRead_o <= 1'b0;
        MemWrite_o <= 1'b0;
        Jump_o <= 1'b0;
		end
	8: //Addi
		begin
		ALU_op_o <= 3'b000;
		ALUSrc_o <= 1'b1;
		RegWrite_o <= 1'b1;
		RegDst_o <= 1'b0;
		Branch_o <= 1'b0;
		Memto_Reg_o <= 1'b0;
	   MemRead_o <= 1'b0;
	   MemWrite_o <= 1'b0;
	   Jump_o <= 1'b0;
		end
	11: //Slt on than immediate unsigned
		begin
		ALU_op_o <= 3'b001;
		ALUSrc_o <= 1'b1;
		RegWrite_o <= 1'b1;
		RegDst_o <= 1'b0;
		Branch_o <= 1'b0;
		Memto_Reg_o <= 1'b0;
        MemRead_o <= 1'b0;
        MemWrite_o <= 1'b0;
        Jump_o <= 1'b0;
		end
	13: // Or immediate
		begin
		ALU_op_o <= 3'b100;
		ALUSrc_o <= 1'b1;
		RegWrite_o <= 1'b1;
		RegDst_o <= 1'b0;
		Branch_o <= 1'b0;
		Memto_Reg_o <= 1'b0;
        MemRead_o <= 1'b0;
        MemWrite_o <= 1'b0;
        Jump_o <= 1'b0;
		end
	15: //Load upper immediate lui 	
		begin
		ALU_op_o <= 3'b011;
		ALUSrc_o <= 1'b1;
		RegWrite_o <= 1'b1;
		RegDst_o <= 1'b0;
		Branch_o <= 1'b0;
		Memto_Reg_o <= 1'b0;
        MemRead_o <= 1'b0;
        MemWrite_o <= 1'b0;
        Jump_o <= 1'b0;
		end
    35: //load word
        begin
        ALU_op_o <= 3'b010;
        ALUSrc_o <= 1'b1;
        RegWrite_o <= 1'b1;
        RegDst_o <= 1'b0;
        Branch_o <= 1'b0;
        Memto_Reg_o <= 1'b1;
        MemRead_o <= 1'b1;
        MemWrite_o <= 1'b0;
        Jump_o <= 1'b0;
        end
    43: //save word
        begin
        ALU_op_o <= 3'b010;
        ALUSrc_o <= 1'b1;
        RegWrite_o <= 1'b0;
        RegDst_o <= 1'b0;
        Branch_o <= 1'b0;
        Memto_Reg_o <= 1'b0;
        MemRead_o <= 1'b0;
        MemWrite_o <= 1'b1;
        Jump_o <= 1'b0;
        end
	 default:
		begin
		ALU_op_o <= 3'b000;
		ALUSrc_o <= 1'b0;
		RegWrite_o <= 1'b0;
		RegDst_o <= 1'b0;
		Branch_o <= 1'b0;
		Memto_Reg_o <= 1'b0;
        MemRead_o <= 1'b0;
        MemWrite_o <= 1'b0;
        Jump_o <= 1'b0;
		end
	endcase
end

endmodule





                    
                    