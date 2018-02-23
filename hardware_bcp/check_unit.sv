`include "bcp_checker.sv"
`include "bcp_reg.sv"
//`include "priority_encoder_comb.sv"



module check_unit	#(
						var_num=8,
						clause_num=8
					)
					( 	
						input  logic clock,
						input  logic reset,
						input  logic check_unit_request, 
						input  logic initial_signal,
						input  logic [23:0]initial_mem,
						input  logic [clause_num-1:0] clause_en,
						input  logic [var_num-1:0   ] free,
						input  logic [var_num-1:0   ] assignment,
/*						input  logic [`var_num-1:0   ] clause_type,
						input  logic [`var_num-1:0   ] clause_mask,
						input  logic [`var_num-1:0   ] clause_size,
*/						input  logic [2:0            ] counter,
						

						output  logic conflict_signal,
						output  logic imp_var
//						output  logic [2:0] implication
					);
	logic [clause_num-1:0] unit_exist;	
	logic [2:0]  var_select_clause;
	
	logic [clause_num-1:0] clause_type_in;
	logic [clause_num-1:0] clause_size_in;
	logic [clause_num-1:0] clause_mask_in;	


	always_comb begin
		clause_type_in  =initial_mem[23:16];
		clause_mask_in  =initial_mem[15:8];
		clause_size_in  =initial_mem[7:0];
	end

	
	genvar i;
	generate 
		for(i=0;i<`clause_num-1; i=i+1)
		begin : bcp_checker8
			bcp_checker bcp_checker1(
						clock,
						reset,
						clause_en[i],
						free,
						assignment,
						clause_type_in,
						clause_mask_in,
						clause_size_in,
						counter,
						unit_exist[i],
//						implication,
//						implication_reg8[i].reg_in,
						initial_signal);
		end
	endgenerate		


	
	integer k;
	
	always_ff@(posedge clock or negedge reset)
	begin
		if(initial_signal)	begin

		end
		else if(check_unit_request)		begin
			imp_var<=bcp_checker8[1].bcp_checker1.encoded_implication;
		end
		else begin
			;
		end	
	end
	
	always_comb 	begin
		conflict_signal=(|unit_exist)?1:0;
	end


	
endmodule