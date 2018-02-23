`include "nox_and.v"
module bcp_checker(  clock
					,reset
					,en
					,free
					,assignment
					,clause_type
					,clause_mask
					,clause_size
					,counter
					,unit_exist
					,implication);
	parameter var_num=8;
	input clock;
	input reset;
	input en;
	input [var_num-1:0]free;
	input [var_num-1:0]assignment;
	input [var_num-1:0]clause_type;
	input [var_num-1:0]clause_mask;
	input [var_num-1:0]clause_size;
	input [var_num-1:0]counter;	
	output unit_exist;
	output [var_num-1:0] implication;
	
	wire [var_num-1:0]na_out;
	wire part_sat;
	wire unit;
	wire unit_exist_temp;
	wire [var_num-1:0] implication_wire;
	wire [var_num-1:0] counter_wire;

	
	reg unit_exist;
	reg [var_num-1:0] implication;
	reg [var_num-1:0]counter_reg;	

	genvar i;
	generate 
		for(i=0;i<var_num;i = i+1)
		begin : label
			nox_and na(assignment[i],clause_type[i],clause_mask[i],na_out[i]);
		end
	endgenerate


	genvar a;
	generate 
		for(a=0;a<var_num;a = a+1)
		begin : implication_unit
			and a1(implication_wire[a],clause_mask[a],free[a]);
		end
	endgenerate



	
	assign counter_wire=counter_reg;
	assign	part_sat=&na_out;
	assign unit=(clause_size==counter_wire)?1:0;
	assign unit_exist_temp=((unit&part_sat)==1)?1:0;

	always@(posedge clock or negedge reset)
	begin
		if(~reset)
		begin	
			unit_exist<=1'b0;
			implication<=1'b0;
			counter_reg<=counter;
		end
	end

	always@(posedge en or posedge clock)
	begin
		if(en)
		begin
			counter_reg=counter_reg+1;
			#3	unit_exist=unit_exist_temp;
			#3  implication=implication_wire;
		end	
	end

	
endmodule