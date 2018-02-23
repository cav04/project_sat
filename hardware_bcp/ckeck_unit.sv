`include "bcp_checker1.sv"
`include "priroiry_encoder_comb.sv"
`include "bcp_reg.sv"


module check_unit	#(
						parameter var_num=8,
						parameter clause_num=8
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
						input  logic [var_num-1:0   ] clause_type,
						input  logic [var_num-1:0   ] clause_mask,
						input  logic [var_num-1:0   ] clause_size,
						input  logic [2:0            ] counter,
						

						output  logic conflict_signal,
						output  logic imp_var,
//						output  logic implication,
					);
	logic [clause_num-1:0] unit_exist;	
	
	logic [7:0] initial_clause_type;
	logic [7:0] initial_clause_mask;
	logic [7:0] clause_size;
					
	genvar i;
	generate 
		for(i=0;i<clause_num-1;i = i+1)		begin : check_unit
			logic [2:0] implication;
		
			bcp_ckeck1 (
						.clock(clock),
						.reset(reset),
						.en(clause_en[i]),
						.free(free),
						.assignment(assignment),
						.clause_type(clause_type),
						.clause_mask(clause_mask),
						.clause_size(clause_size),
						.counter(counter),
						.bcp_initial(initial_signal),
						.unit_exist(unit_exist[i]),
						.encoded_implication(implication)
						);
						
			BCP_register (
							.clock(clock),
							.reset(reset),
							.reg_in(implication),
							.reg_out()
							);			
		end
	endgenerate		
	
	priroiry_encoder_comb pec(.in(unit_exist),.out(var_select_clause));

	
	genvar j;
	generate 
		for(j=0;j<clause_num-1;j = j+1)
		begin : implication_reg8
			logic [2:0] reg_in;
			logic [2:0] reg_out;
			logic [2:0] implication_reg(reg_in,reg_out);
		end
	endgenerate	
	
    always_comb begin
		initial_clause_type=initial_mem[24:16];
		initial_clause_mask=initial_mem[15:8];
		initial_clause_size=initial_mem[7:0];
	end	
	
	
	
	
	
	always_ff(posedge clock or negedge reset)
	begin
		if(initial_signal)
		begin
			for(int k=0;k<clause_num-1;k=k+1)
			begin
				bcp_checker[k].bcp_ckeck1.clause_type  <=initial_clause_type;
				bcp_checker[k].bcp_ckeck1.clause_mask  <=initial_clause_mask;
				bcp_checker[k].bcp_ckeck1.clause_size  <=initial_clause_size;
				bcp_checker[k].bcp_ckeck1.counter      <=3'd1;
			end
		end
		else if(check_unit_request)
		begin
				imp_var<=implication_reg8[var_select_clause].out;
		end
	end
	
	always_comb 
	begin
		conflict_signal=(|unit_exist)?1:0;
		
	end


	
endmodule