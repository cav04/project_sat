`include"var_table.v"
`include"priority_encoder.v"
module decision_controller(clock,reset,en,test1,test2,test3);
	parameter address_width=3;
	parameter var_num=8;
	input clock;
	input reset;
	input test1;
	input test2;
	input test3;	
	wire r_w;
	wire var_en;
	wire clausedb_en;
	
	always@(*)
	begin
		
	end



	
endmodule