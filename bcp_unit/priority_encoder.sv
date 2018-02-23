/*
`define var_num 8
`define var_num_log 3
*/
module priority_encoder(
	output logic [`var_num_log-1:0] pe_out,
	input [`var_num-1:0]pe_in
	);


/*
  integer i;
  always_comb begin
    pe_out = 0; 
    for (i=`var_num; i>=0; i=i-1)
        if (pe_in[i]) pe_out = i;
  end
 */
 
  integer i;
  logic found;
  always @(pe_in) begin
    pe_out = `var_num_log'd0;
    found = 1'b0;
    for (i=0; i<`var_num; i=i+1) begin
      if (pe_in[i]==1'b1 && found==1'b0) begin
        pe_out = i;
        found = 1'b1;
      end
    end
//    pe_out[var_num] = (found==1'b0);
  end

endmodule