`include "implication_unit.v"
`include "unit_checker.v"


module check_unit(clock
				,reset
				,clause_enable
				,assignment
				,free
				,clause_register_wire
				,clause_size_wire
				,counter_wire
				,implication
				,implication_exist);
parameter size=8;
//parameter clause_num=8;
parameter var_num=8;

input clock, reset;
input clause_enable;  //whether to execute or not
input [var_num-1:0] assignment; 
input [var_num-1:0] free;
input [size-1:0] counter_wire;
input [size-1:0] clause_size_wire;
input [2*var_num-1:0] clause_register_wire;

output [var_num-1:0] implication;
output implication_exist;  //implication exist or not

reg [var_num-1:0] implication;
reg implication_exist;
reg [size-1:0] clause_size;
reg [size-1:0] counter;
reg [2*var_num-1:0] clause_register;


wire part_sat;
wire [size-1:0] counter_wire;
wire [size-1:0] clause_size_wire;
wire [var_num-1:0] clause_mask;
wire [var_num-1:0] clause_type;
wire implication_exist_wire;
wire [var_num-1:0] implication_wire;

//	assign counter_wire=counter;
//	assign clause_size_wire=clause_size;

	assign clause_mask=clause_register[2*var_num-1:var_num];
	assign clause_type=clause_register[var_num-1:0];
	
	
//	assign implication_exist_wire=implication_exist;	
	
	partial_sat p1(.assignment(assignment),.clause_type(clause_register[var_num-1:0]),.clause_mask(clause_register[2*var_num-1:var_num]),.part_sat(part_sat));
	unit_checker uc(.part_sat(part_sat),.counter(counter_wire),.clause_size(clause_size_wire),.unit_clause(implication_exist_wire));
	implication_unit iu(implication_wire,free,clause_mask);
	
//	unit_checker(part_sat,counter,clause_size,unit_clause);


    always @(posedge clock or posedge reset) 
    begin	
		if(reset)
			begin
			counter<=counter_wire;
			clause_size<=clause_size_wire;
			clause_register<=clause_register_wire;
			end
		else if(en)
			begin
			counter<=counter+1;
			implication_exist<=implication_exist_wire;
			implication<=implication_wire;
			end
	end		
			

	
	
endmodule