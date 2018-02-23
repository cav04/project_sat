module nbit_xnor #(parameter size=16)
(
	input [size-1:0]a,
	input [size-1:0]b,
	output [size-1:0]y

);
	genvar gv_i;
	generate
		for(gv_i=0;gv_i<size;gv_i=gv_i+1)
		begin :label
			xnor u_xor(y[gv_i],a[gv_i],b[gv_i]);			
		end
	endgenerate		
endmodule