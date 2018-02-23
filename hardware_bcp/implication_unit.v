module implication_unit(free,clause_mask,implication);
	parameter size=8;
	input [size-1:0]free;
	input [size-1:0]clause_mask;
	output [size-1:0]implication;
	
	genvar i;
	generate 
		for(i=0;i<size;i = i+1)
		begin : label
			and a1(implication[i],clause_mask[i],free[i]);
		end
	endgenerate
	

	
endmodule