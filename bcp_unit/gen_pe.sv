module gen_pe
	(
	output logic [1:0] pe_out,
	input [3:0]pe_in
	);



  integer i;
  always_comb begin
    pe_out = 0; 
    for (i=3; i>=0; i=i-1)
        if (pe_in[i]) pe_out = i;
  end
 

endmodule