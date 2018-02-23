module bcp_reg(
	input  logic clock,
	input  logic [2:0] in,
	output logic [2:0] out  );
	
	logic [2:0] bcp_register;
	
	always_comb begin
		bcp_register=in;
	end
	
	always_ff@(posedge clock) begin 
		out<=bcp_register;	
	end
endmodule