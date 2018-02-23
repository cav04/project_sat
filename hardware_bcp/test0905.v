`include "unit_checker.v"
module test0905(assignment
				,free
				,clause_register_wire
				,clause_size_wire
				,counter_wire
				,implication_exist);
parameter size=8;
parameter var_num=8;

input [var_num-1:0] assignment; 
input [var_num-1:0] free;
input [size-1:0] counter_wire;
input [size-1:0] clause_size_wire;
input [2*var_num-1:0] clause_register_wire;


output  implication_exist;  //implication exist or not


wire part_sat;
wire [size-1:0] counter_wire;
wire [size-1:0] clause_size_wire;
wire [var_num-1:0] clause_mask;
wire [var_num-1:0] clause_type;
wire implication_exist_wire;
wire implication_exist;
reg [var_num-1:0] counter;
reg [var_num-1:0] clause_size;

	
	
	partial_sat p1(.assignment(assignment),.clause_type(clause_register_wire[var_num-1:0]),.clause_mask(clause_register_wire[2*var_num-1:var_num]),.part_sat(part_sat));
	unit_checker uc(.part_sat(part_sat),.counter(counter_wire),.clause_size(clause_size_wire),.unit_clause(implication_exist));
	

	
	
endmodule