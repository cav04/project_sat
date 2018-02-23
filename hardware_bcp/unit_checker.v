`include "partial_sat.v"
module unit_checker(clock,en_part_sat,part_sat,counter,clause_size,unit_clause);
	parameter size=8;
	parameter clause_num=8;
	parameter var_num=8;
	
	input clock;
	input en_part_sat;
	input [size-1:0]counter;
	input [size-1:0]clause_size;
	input part_sat;
	output unit_clause;
	wire unit_exist;
	wire unit;
	reg unit_clause;
	
	assign unit=(clause_size==counter)?1:0;
	assign unit_exist=((unit&part_sat)==1)?1:0;

	always@(posedge clock)
	begin
		if(en_part_sat)
			#5 unit_clause=unit_exist;
	end
	
endmodule