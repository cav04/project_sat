`include "nox_and.sv"
`include "priority_encoder.sv"

module bcp_checker1 (
					input logic clk,
					input logic rst,
					input logic en,
					input logic [`var_num-1:0]free,
					input logic [`var_num-1:0]assignment,
					input logic [`initial_data_size-1:0]initial_data,
					input logic bcp_initial,
					input logic backtrack_en,
					output logic unit_exist,
					output logic [`var_num_log-1:0]encoded_implication,
					output logic assign_value,
					output logic flag   //test
//					output logic bcp_is_work
					);
/*					
	logic [`var_num-1:0] clause_type;
	logic [`var_num-1:0] clause_mask;
	logic [1:0] clause_size;
	logic [1:0] counter;
*/					
					

	logic [`var_num-1:0]na_out;
	logic part_sat;
	logic unit;
	logic [`var_num-1:0] implication_wire;
	logic [`var_num_log-1:0] implication;	
	logic [`var_num-1:0] not_free;
	


	logic [`var_num-1:0]     clause_type_reg;
	logic [`var_num-1:0]     clause_mask_reg;
	logic [`var_num_log-1:0] counter_reg;	
	logic [`var_num_log-1:0] clause_size_reg;

/*	
  always_comb begin
	clause_type  =initial_data[`var_num-1:0];
	clause_mask  =initial_data[`var_num*2-1:`var_num];
	clause_size  =initial_data[`initial_data_size-3:`initial_data_size-4];
	counter      =initial_data[`initial_data_size-1:`initial_data_size-2]; 
  end	
*/	
	
	
	
	
	
  always_comb begin
   not_free=~free;
  end		

	genvar i;
	generate 
		for(i=0;i<`var_num;i = i+1)
		begin : label
			nox_and na(assignment[i],clause_type_reg[i],clause_mask_reg[i],not_free[i],na_out[i]);
		end
	endgenerate


  genvar a;
  generate 
	for(a=0;a<`var_num;a = a+1)
	  begin : implication_unit
		and a1(implication_wire[a],clause_mask_reg[a],free[a]);
	  end
  endgenerate
	
  always_comb begin
	part_sat=|na_out;
	unit=(clause_size_reg==counter_reg)?1:0;
	unit_exist=((unit&!part_sat)==1)?1:0;
  end	
  
  always_comb begin
	flag=(clause_size_reg==counter_reg)?1:0;
  end	  
  
  priority_encoder pe1(
                     .pe_in(implication_wire),
					 .pe_out(implication)
					 );
  
  always @(posedge clk or posedge rst)  begin
    encoded_implication<=implication;
  end  
/*  
 always @(posedge clk)  begin
    case(implication_wire)
	  7'b1000: encoded_implication<=2'b11;
	  7'b0100: encoded_implication<=2'b10;
	  7'b0010: encoded_implication<=2'b01;
	  7'b0001: encoded_implication<=2'b00;
	endcase
  end  
*/  
  logic [`initial_data_size_log-1:0]clause_type_least;
  logic [`initial_data_size_log-1:0]clause_type_last;
  logic [`initial_data_size_log-1:0]clause_mask_least;
  logic [`initial_data_size_log-1:0]clause_mask_last;   
  logic [`initial_data_size_log-1:0]clause_size_reg_least;
  logic [`initial_data_size_log-1:0]clause_size_reg_last;
  logic [`initial_data_size_log-1:0]counter_reg_least;
  logic [`initial_data_size_log-1:0]counter_reg_last;

  always_comb begin
	  clause_type_least      =`initial_data_size_log'd0;
	  clause_type_last       =`initial_data_size_log'd`var_num-1;
	  clause_mask_least      =`initial_data_size_log'd`var_num;
	  clause_mask_last       =`initial_data_size_log'd`var_num+`var_num-1;
	  clause_size_reg_least  =`initial_data_size_log'd`var_num+`var_num;
	  clause_size_reg_last   =`initial_data_size_log'd`var_num+`var_num+`var_num_log-1;
	  counter_reg_least      =`initial_data_size_log'd`var_num+`var_num+`var_num_log;
	  counter_reg_last       =`initial_data_size_log'd`var_num+`var_num+`var_num_log+`var_num_log-1;
  end  

  always @(posedge clk or posedge rst)  begin
    if(rst) begin
      clause_type_reg  <= `var_num'd0;
      clause_mask_reg  <= `var_num'd0;
	  clause_size_reg  <= `var_num_log'd0;
	  counter_reg      <= `var_num_log'd0;
 
      assign_value     <=1'b0;	  
	end
	else if (bcp_initial) begin 
      clause_type_reg  <= initial_data[6:0];
      clause_mask_reg  <= initial_data[13:7];
	  clause_size_reg  <= initial_data[16:14];
	  counter_reg      <= initial_data[19:17];
      assign_value     <= 1'b0;	  
	end
	else if(en)begin
	  counter_reg      <= counter_reg+1;
	
	  assign_value     <= clause_type_reg[encoded_implication];
	end
    else if(backtrack_en)begin
	  if(counter_reg!=`var_num_log'b0)
	    counter_reg      <= counter_reg-1;
      else 
	    counter_reg      <=counter_reg;
	end
	else begin
	  counter_reg      <= counter_reg;
	 
//	  $display("1212313213213256465465465");
	end  
  end
  
  
/*

  initial begin
 //   $monitor("gen_bcp.initial_data=%b",initial_data);		   
    $monitor("gen_bcp.bcp_initial=%b",bcp_initial);	
    $monitor("gen_bcp.clause_type_reg=%b",clause_type_reg);	 
  end

*/

	
endmodule