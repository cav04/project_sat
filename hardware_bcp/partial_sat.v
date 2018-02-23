`include "nox_and.v"
module partial_sat(assignment,clause_type,clause_mask,part_sat);
	parameter var_num=8;
//	input clock;
	input [var_num-1:0]assignment;
	input [var_num-1:0]clause_type;
	input [var_num-1:0]clause_mask;
	output part_sat;
	wire [var_num-1:0]na_out;
	wire part_sat;
	
	genvar i;
	generate 
		for(i=0;i<var_num;i = i+1)
		begin : label
			nox_and na(assignment[i],clause_type[i],clause_mask[i],na_out[i]);
		end
	endgenerate
	

	assign	part_sat=&na_out;
		
	
endmodule