module mux_8_1(
				input logic input0,
				input logic input1,
				input logic input2,
				input logic input3,
				input logic input4,
				input logic input5,
				input logic input6,
				input logic input7,				
				input logic sel,
				output logic mux_out				
				);
always_comb begin
     case(sel)
		3'b000:
			mux_out=input0;
		3'b001:
			mux_out=input1;
		3'b010:
			mux_out=input2;
		3'b011:
			mux_out=input3;
		3'b100:
			mux_out=input4;
		3'b101:
			mux_out=input5;
		3'b110:
			mux_out=input6;
		3'b111:
			mux_out=input7;
       endcase
end		
endmodule		
				