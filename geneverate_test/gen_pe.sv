module gen_pe
	#( parameter w = 8)
	(
	output logic [2:0] pe_out,
	input [7:0]pe_in
	);

//  logic [7:0] pe_in;



  integer i;
  always_comb begin
    pe_out = 0; 
    for (i=7; i>=0; i=i-1)
        if (pe_in[i]) pe_out = i;
  end
  
/*  
initial	begin
	#10
	pe_in=8'b0010_0000;
	#10
	$display("pe_out=%d",pe_out);
	
	#1000 $finish;

end
*/

endmodule