//Subject:     CO project 2 - ALU Controller
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      0516223
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
    case(ALUOp_i)
        3'b000: ALUCtrl_o <= 4'b0010;
        3'b001: ALUCtrl_o <= 4'b0110;
        3'b010:
            begin
                case(funct_i)
                    6'b100001: ALUCtrl_o <= 4'b0010;
                    6'b100011: ALUCtrl_o <= 4'b0011;
                    6'b100100: ALUCtrl_o <= 4'b0000;
                    6'b100101: ALUCtrl_o <= 4'b0001;
                    6'b101010: ALUCtrl_o <= 4'b0110;
                    6'b000011: ALUCtrl_o <= 4'b1111; //X
                    6'b000111: ALUCtrl_o <= 4'b0100;
                endcase
            end
			3'b011: ALUCtrl_o <= 4'b0111;
			3'b100: ALUCtrl_o <= 4'b0001;
			3'b110: ALUCtrl_o <= 4'b1010;
			3'b111: ALUCtrl_o <= 4'b1011;
			default: ALUCtrl_o <= 4'b0000;
    endcase    
end
endmodule     





                    
                    