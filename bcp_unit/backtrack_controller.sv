/*
`define var_num 8
`define var_num_log 3
`define clause_num 8
`define state_num 4
*/
`include "priority_encoder.sv"

  module backtrack_controller(
                      input logic clk,
					  input logic rst,
                      input logic backtrack,
                      input logic refresh,
					  input logic [`var_num-1:0] implication_reg,
					  input logic [`var_num_log-1:0]assign_variable,
					  input logic [`var_num-1:0] fat_out,
					  output logic fat_write,
					  output logic fat_en,
					  output logic [`var_num_log:0]fat_address,
					  output logic [`var_num_log-1:0]next_implication_out,
					  output logic backtrack1,
					  output logic backtrack2
					  );
			
    
			
  logic [`state_num-1:0] curr_state;
  logic [`state_num-1:0] next_state;

  logic [`var_num-1:0]backtrack_implication_reg;
  logic refresh_flag;
  logic [`var_num_log-1:0]next_implication;
  logic [`var_num_log-1:0]curr_implication;  
  
  
  
  parameter idle                   =`state_num'd0;
  parameter read_implication_reg   =`state_num'd1;
  parameter write_fat              =`state_num'd2;
  parameter write_fat_first        =`state_num'd3;  
  parameter write_fat_last         =`state_num'd4;   
  parameter backtrack_state        =`state_num'd5;
  parameter rewrite_fat_first      =`state_num'd6;  
  parameter rewrite_fat            =`state_num'd7;    
					  
  priority_encoder pe1(
			.pe_in(backtrack_implication_reg),
			.pe_out(next_implication)
			);
			
  always_comb begin
    backtrack1=1'b0;
	backtrack2=1'b0;
  end  
			
  				  
					  
  always_comb begin
    refresh_flag=|backtrack_implication_reg;
  end  
  
  always_ff@(posedge clk or posedge rst) begin
    curr_implication<=next_implication;
  end  


  always_ff@(posedge clk or posedge rst) begin
    if(rst) 
	  backtrack_implication_reg<=`var_num'd0;
	else begin
	  if(curr_state==read_implication_reg)
	    backtrack_implication_reg<=implication_reg;
	  else if((curr_state==write_fat)||(curr_state==write_fat_first))
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
    case(curr_state)
	  idle:begin   
	    if(refresh)
		  next_state=read_implication_reg;
		else if(backtrack)
		  next_state=rewrite_fat_first;
		else
          next_state=idle;		
	  end
	  read_implication_reg:begin
	    next_state=write_fat_first;
	  end
	  write_fat_first:begin
		  next_state=write_fat;
	  end
	  write_fat:begin
	    if(refresh_flag)
		  next_state=write_fat;	
		else
          next_state=idle;	
	  end
	  write_fat_last:begin
          next_state=idle;	
	  end	  
	  rewrite_fat_first:begin
	    next_state=rewrite_fat;
	  end
	  backtrack_state: begin
	    next_state=rewrite_fat_first;
	  end	  
	  rewrite_fat:begin
	    if(fat_out!=`var_num)
		  next_state=rewrite_fat;
		else  
		  next_state=idle;		
	  end
	endcase  
	 
  end 


  always_comb begin
    case(curr_state)
	  idle:begin
	    fat_en=1'b0;
		fat_write=1'b0;
		next_implication_out=`var_num_log'dz;
		fat_address=`var_num'dz;
	  end
	  read_implication_reg:begin
	    fat_en=1'b0;
		fat_write=1'b0;	 
        next_implication_out=`var_num'dz;		
		fat_address=`var_num'dz;
	  end
	  write_fat_first:begin
	    fat_en=1'b1;
		fat_write=1'b1;
		next_implication_out=next_implication;
		fat_address=assign_variable;
	  end	 	  
	  write_fat:begin
	    fat_en=1'b1;
		fat_write=1'b1;
		fat_address=curr_implication;
		if(refresh_flag)
		  next_implication_out=next_implication;
        else
          next_implication_out=`var_num'd`var_num;
	  end	
	  write_fat_last:begin
	    fat_en=1'b1;
		fat_write=1'b1;
		next_implication_out=`var_num'd`var_num;
		fat_address=curr_implication;
	  end	  
	  rewrite_fat_first:begin
	    fat_en=1'b1;
		fat_write=1'b1;
		next_implication_out=`var_num'd`var_num;
		fat_address=`var_num'dz;	  
	  end	  
	  backtrack_state:begin
	    fat_en=1'b1;
		fat_write=1'b0;
		next_implication_out=next_implication;
		fat_address=`var_num'dz;
	  end
	  rewrite_fat:begin
	    fat_en=1'b1;
		fat_write=1'b1;
		next_implication_out=`var_num'd`var_num;
		fat_address=`var_num'dz;	  
	  end
    endcase	  
  end  
  
  
  
					  
  endmodule					  