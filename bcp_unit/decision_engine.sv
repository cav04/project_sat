/*
`define var_num 8
`define var_num_log 3
`define clause_num 8
*/
`define state_num 5
`include "priority_encoder.sv"

  module decision_engine(
                      input logic clk,
					  input logic rst,
					  input logic decide_request,
					  input logic assign_var,
					  input logic backtrack1,
					  input logic backtrack2,
					  input logic [`var_num-1:0]vst_out,
					  output logic [`var_num_log-1:0]rewrite_free_bit,
					  output logic [1:0]vst_address,
					  output logic vst_en,
					  output logic vst_write,
					  output logic [`var_num_log-1:0] curr_var_reg,
					  output logic decide_done
					  );
			
    
			
  logic [`state_num-1:0] curr_state;
  logic [`state_num-1:0] next_state;
  
  
  logic [`var_num-1:0]free_reg;
  logic [`var_num-1:0]assignment_reg;
  logic [`var_num-1:0]force_assign_reg;
  logic [`var_num-1:0]free_and_force_assign_reg;
//  logic [`var_num-1:0]free_and_force_assign_reg_n;  
  logic [`var_num-1:0] pe_in;
  logic [`var_num_log-1:0] pe_out;
  logic [`var_num_log-1:0] next_var;

  
  parameter idle                  =`state_num'd0;
  parameter read_free1            =`state_num'd1;  //address
  parameter read_free2            =`state_num'd2;  //data
  parameter read_assignment1      =`state_num'd3;  //address
  parameter read_assignment2      =`state_num'd4;  //data
  parameter read_force_assign1    =`state_num'd5;  //address
  parameter read_force_assign2    =`state_num'd6;  //data
  parameter and_free_force        =`state_num'd7;   
  parameter pe_state              =`state_num'd8;   
  parameter rewrite_free          =`state_num'd9;    
  parameter rewrite_assignment    =`state_num'd10;   
 
  parameter decide_done_state   =`state_num'd15;
  
  always_comb begin
    if(rst) begin
	  next_var   =`var_num_log'dz;
	end
	else begin
	  if(curr_state==pe_state)
	    next_var =pe_out;
	  else if(curr_state==decide_done_state)
        next_var   =`var_num_log'dz;
      else
        next_var =next_var;
    end
  end  
  
  always_ff@(posedge clk or posedge rst) begin
    if(rst) 
	  curr_var_reg   <=`var_num_log'dz;
	else if(curr_state==pe_state)
      curr_var_reg   <=pe_out;
	else if(decide_request)  
      curr_var_reg   <=`var_num_log'dz;
	else  
      curr_var_reg   <=curr_var_reg;	
  end
  
  
  
  always_comb begin
    if(rst) begin
	  free_and_force_assign_reg   =`var_num'd0;
//	  free_and_force_assign_reg_n =`var_num'd0;
	end
	else begin
      if(decide_done) begin
	    free_and_force_assign_reg   =`var_num'd0;
//	    free_and_force_assign_reg_n =`var_num'd0;	  
	  end
	  else if(curr_state==and_free_force) begin
	    free_and_force_assign_reg   =free_reg&~force_assign_reg;
//	    free_and_force_assign_reg_n =~free_and_force_assign_reg;		  
	  end
    end
  end
  
  always_comb begin
    if(rst)begin
	  pe_in=`var_num'd0;
	end
	else begin
	  if(curr_state==pe_state)
	    pe_in=free_and_force_assign_reg;
      else
	    pe_in=`var_num'd0;	  
	end
  end  
  
  
  always_comb begin
    case(curr_state)
	  idle:begin
	    free_reg         =`var_num'd0;
        assignment_reg   =`var_num'd0;
	    force_assign_reg =`var_num'd0;
	  end
      read_free2: begin
	    free_reg         =vst_out;
	  end
      read_assignment2: begin
	    assignment_reg   =vst_out;
	  end
      read_force_assign2: begin
	    force_assign_reg =vst_out;
	  end
	  default:begin
	    ;
	  end
	endcase  
  end
  
  
  
  priority_encoder pe1(
			.pe_in(pe_in),
			.pe_out(pe_out)
			);

  
  always_ff@(posedge clk or posedge rst) begin
    if(rst) 
	  curr_state<=idle;
	else
      curr_state<=next_state;	  
  end
  
  
  always_comb begin
    case(curr_state)
	  idle:begin   
	    if(decide_request)
		  next_state=read_free1;
		else  
		  next_state=idle;
	  end
	  read_free1:begin   
		  next_state=read_free2;
	  end	
	  read_free2:begin   
		  next_state=read_assignment1;
	  end	  
	  read_assignment1:begin   
		  next_state=read_assignment2;
	  end	
	  read_assignment2:begin   
		  next_state=read_force_assign1;
	  end
	  read_force_assign1:begin   
		  next_state=read_force_assign2;
	  end		  
	  read_force_assign2:begin
//        if(assign_var)	  
		  next_state=and_free_force;
//		else  
//		next_state=decide_done_state;
	  end		
	  and_free_force:begin
		next_state=pe_state;
	  end	  
	  pe_state:begin
	    next_state=rewrite_free;
	  end
	  rewrite_free:begin
	    next_state=rewrite_assignment;
	  end
	  rewrite_assignment:begin
	    next_state=decide_done_state;
	  end	  
	  decide_done_state:begin
	    next_state=idle;	  
	  end
	endcase  
	 
  end 


  always_comb begin
    case(curr_state)
	  idle:begin
        vst_address        =2'bzz;
		vst_en             =1'b0;
		vst_write          =1'b0;
		decide_done        =1'b0;
		rewrite_free_bit   =`var_num_log'dz;
	  end
	  read_free1:begin
        vst_address        =2'b00;
		vst_en             =1'b1;
		vst_write          =1'b0;
		decide_done        =1'b0;
		rewrite_free_bit   =`var_num_log'dz;
	  end	
	  read_free2:begin
        vst_address        =2'bzz;
		vst_en             =1'b0;
		vst_write          =1'b0;
		decide_done        =1'b0;
		rewrite_free_bit   =`var_num_log'dz;
	  end
	  read_assignment1:begin
        vst_address        =2'b01;
		vst_en             =1'b1;
		vst_write          =1'b0;
		decide_done        =1'b0;
		rewrite_free_bit   =`var_num_log'dz;
	  end	
	  read_assignment2:begin
        vst_address        =2'bzz;
		vst_en             =1'b0;
		vst_write          =1'b0;
		decide_done        =1'b0;
		rewrite_free_bit   =`var_num_log'dz;
	  end	
	  read_force_assign1:begin
        vst_address        =2'b10;
		vst_en             =1'b1;
		vst_write          =1'b0;
		decide_done        =1'b0;
		rewrite_free_bit   =`var_num_log'dz;
	  end		
	  read_force_assign2:begin
        vst_address        =2'bzz;
		vst_en             =1'b0;
		vst_write          =1'b0;
		decide_done        =1'b0;
		rewrite_free_bit   =`var_num_log'dz;
	  end
	  and_free_force:begin
        vst_address        =2'bzz;
		vst_en             =1'b0;
		vst_write          =1'b0;
		decide_done        =1'b0;
		rewrite_free_bit   =`var_num_log'dz;
	  end	
	  pe_state:begin
        vst_address        =2'bzz;
		vst_en             =1'b0;
		vst_write          =1'b0;
		decide_done        =1'b0;
		rewrite_free_bit   =`var_num_log'dz;
	  end	
	  rewrite_free:begin
        vst_address        =2'b00;
		vst_en             =1'b1;
		vst_write          =1'b1;
		decide_done        =1'b0;
		rewrite_free_bit   =next_var;
	  end	
	  rewrite_assignment:begin
        vst_address        =2'b01;
		vst_en             =1'b1;
		vst_write          =1'b1;
		decide_done        =1'b0;
		rewrite_free_bit   =next_var;
	  end	  
	  decide_done_state:begin
        vst_address        =2'bzz;
		vst_en             =1'b0;
		vst_write          =1'b0;
		decide_done        =1'b1;
		rewrite_free_bit   =`var_num_log'dz;
	  end
	  default:begin
        vst_address        =2'bzz;
		vst_en             =1'b0;
		vst_write          =1'b0;
		decide_done        =1'b0;
		rewrite_free_bit   =`var_num_log'dz;	  
	  end
    endcase	  
  end  
  
  

					  
  endmodule					  