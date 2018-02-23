
`define var_num 8
`define var_num_log 3
`define clause_num 8
`define state_num 4

`include "priority_encoder.sv"

  module force_assign_table(
                      input logic clk,
					  input logic rst,
                      input logic fat_en,
					  input logic fat_write,
					  input logic [`var_num:0]fat_address,
					  input logic [`var_num_log-1:0] fat_in,
					  output logic [`var_num_log-1:0]fat_out
					  
					  );
			
  logic [`var_num_log-1:0] fat [`var_num:0];
  
 
  
  
  always_comb begin
    fat_out=fat[fat_address];
  end
  
  always_ff@(posedge clk or posedge rst)	begin
	if(rst)begin
      for (integer i=0; i<`var_num; i=i+1)
        fat[i]<=`var_num_log'd0;	
	end
	else begin
	  if(fat_en) begin
	    if(fat_write)
		  fat[fat_address]<=fat_in;
		else	
		  fat[fat_address]<=fat[fat_address];
	  end
	  else 
	    fat[fat_address]<=fat[fat_address];
    end
  end	  
  
  
					  
  endmodule					  