`include "nox_and.sv"
module bcp_checker1#(
						var_num=8
					)
					( 
					input logic clock,
					input logic reset,
					input logic en,
					input logic [var_num-1:0] free,
					input logic [var_num-1:0] assignment,
					input logic [var_num-1:0] clause_type,
					input logic [var_num-1:0] clause_mask,
					input logic [var_num-1:0] clause_size,
					input logic [var_num-1:0] counter,
					input logic bcp_initial,
					output logic unit_exist,
					output logic encoded_implication,
					output logic bcp_is_work
					);

	logic [var_num-1:0]na_out;
	logic part_sat;
	logic unit;
	logic unit_exist_temp;
	logic [var_num-1:0] implication_wire;
	logic [var_num-1:0] counter_next;
	

	logic [var_num-1:0] counter_reg;
	logic [var_num-1:0] clause_type_reg;
	logic [var_num-1:0] clause_mask_reg;
	logic [var_num-1:0] clause_size_reg;
	logic [var_num-1:0] free_reg;

	genvar i;
	generate 
		for(i=0;i<var_num;i = i+1)
		begin : label
			nox_and na(assignment[i],clause_type_reg[i],clause_mask_reg[i],na_out[i]);
		end
	endgenerate


  genvar a;
  generate 
	for(a=0;a<var_num;a = a+1)
	  begin : implication_unit
		and a1(implication_wire[a],clause_mask_reg[a],free[a]);
	  end
  endgenerate
	
  always_comb begin
	part_sat=&na_out;
	unit=(clause_size_reg==counter_reg)?1:0;
	unit_exist_temp=((unit&part_sat)==1)?1:0;
  end	

//--------------------------------------------------------------------------------------------------//	

	always@(posedge clock or negedge reset)
	begin
		if(!reset)
		begin	
			   unit_exist<=1'b0;
			   counter_reg<=0;
			   clause_type_reg<=8'b0000_0000;
	       	   clause_mask_reg<=8'b0000_0000;
			   clause_size_reg<=8'b0000_0000;
			   free_reg<=8'b0000_0000;
			   bcp_is_work<=1;
			   encoded_implication<=3'b000;
		end
		else if(bcp_initial)
		begin//1
			   clause_type_reg<=clause_type;
	       	   clause_mask_reg<=clause_mask;
			   clause_size_reg<=clause_size;
			   free_reg<=8'b0000_0000;	
			   counter_reg<=1;
			   encoded_implication<=3'b000;
			   bcp_is_work<=1;
		end//1
		else if(en)
			begin
			   if(counter_reg!=8'b1111_1111)
			     counter_reg<=counter_reg+1;
			   unit_exist<=unit_exist_temp;

//-----------------------------encoder-----------------------------------------------------------------//	
			  case(implication_wire)
				8'b1000_0000: encoded_implication<=3'b111;
				8'b0100_0000: encoded_implication<=3'b110;
				8'b0010_0000: encoded_implication<=3'b101;
				8'b0001_0000: encoded_implication<=3'b100;
				8'b0000_1000: encoded_implication<=3'b011;
				8'b0000_0100: encoded_implication<=3'b010;
				8'b0000_0010: encoded_implication<=3'b001;
				8'b0000_0001: encoded_implication<=3'b000;
			  endcase

//------------------------------------------------------------------------------------------//
			   
			end
		else if(bcp_is_work==1'b1)
				bcp_is_work<=1'b0;
		else	
			begin
			   unit_exist<=unit_exist;
			   bcp_is_work<=0;
			end	
		
	end

	
endmodule