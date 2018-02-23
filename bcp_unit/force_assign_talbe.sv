`define var_num 8
`define var_num_log 3
`define clause_num 8
`define state_num 4

`include "piority_encoder.sv"

  module backtrack_unit(
                      input logic fat_en,
					  input logic fat_write,
					  input logic [`var_num_log-1:0] fat_in,
					  output logic [`var_num_log-1:0]fat_out
					  
					  );
			
  logic [`var_num:0] fat [`var_num_log-1:0];
  
  
  always_ff@(posedge clk or posedge rst)	begin
	
	
  end
  
  
					  
  endmodule					  