`define var_num 8
`define var_num_log 3
`define clause_num 8
`define state_num 4

`include "piority_encoder.sv"

  module backtrack_unit(
                      input logic clk,
					  input logic rst,
                      input logic backtrack,
                      input logic refresh,
					  input logic [`var_num-1:0] implication_reg,
					  input logic [`var_num_log-1:0]assign_variable,
					  input logic [`var_num-1:0] fat_out,
					  output logic fat_write,
					  output logic fat_enable,
					  output logic [`var_num_log-1:0]next_implication_out
					  );
			
    
			
  logic [`state_num-1:0] curr_state;
  logic [`state_num-1:0] next_state;

  logic [`var_num-1:0]backtrack_implication_reg
  logic refresh_flag;
  logic [`var_num_log-1:0]next_implication;
  
  
  
  parameter idle                   =`state_num'd0;
  parameter read_implication_reg   =`state_num'd1;
  parameter write_fat              =`state_num'd2;
  parameter rewrite_fat            =`state_num'd3;
					  
  priority_encoder pe1(
			.pe_in(backtrack_implication_reg),
			.pe_out(next_implication)
			);
  				  
					  
  always_comb begin
    refresh_flag=|implication_reg;
  end  
  
  


  always_ff@(posedge clk or posedge rst) begin
    if(rst) 
	  backtrack_implication_reg<=`var_num'd0;
	else begin
	  if(curr_state==read_implication_reg)
	    backtrack_implication_reg<=implication_reg;
	  else if(curr_state==write_fat)
        backtrack_implication_reg[next_implication]<=1'b0;
      else
        backtrack_implication_reg<=backtrack_implication_reg;	  
	end  
  end


  
  always_ff@(posedge clk or posedge rst) begin
    if(rst) 
	  curr_state<=idle;
	else
      curr_state<=next_state;	  
  end
  
  
  always_comb begin
    case(curr_state):
	  idle:begin   
	    if(refresh_flag)
		  next_state=read_implication_reg;
		else
          next_state=idle;		
	  end
	  read_implication_reg:begin
	    next_state=rewrite_fat;
	  end
	  rewrite_fat:begin
	    if(refresh_flag)
		  next_state=idle;
		else
          next_state=rewrite_fat;		
	  end
	 
  end 


  always_comb begin
    case(curr_state):
	  idle:begin
	    fat_enable=1'b0;
		fat_write=1'b0;
		next_implication_out=`var_num_log'dz;
	  end
	  read_implication_reg:begin
	    fat_enable=1'b0;
		fat_write=1'b0;	 
        next_implication_out=`var_num_log'dz;		
	  end
	  write_fat:begin
	    fat_enable=1'b1;
		fat_write=1'b1;
		next_implication_out=next_implication;
	  end	  
	  rewrite_fat:begin
	    fat_enable=1'b1;
		fat_write=1'b1;
		next_implication_out=next_implication;
	  end
  end  
  
  
  
					  
  endmodule					  