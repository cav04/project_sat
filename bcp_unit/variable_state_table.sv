`define var_num 8
`define var_num_log 3


module variable_state_table
               (  input logic clk, 
                  input logic rst,  
                  input logic vst_write, 
				  input logic vst_bcp_write,
                  input logic vst_en, 
                  input logic [`var_num-1:0] vst_in,
				  input logic [`var_num_log-1:0]rewrite_free_bit,
                  input logic [2:0] vst_address, 
                  output logic [`var_num-1:0] vst_out
				  );



logic [`var_num-1:0] vst [2:0];

integer i;

  always@(posedge clk or posedge rst) begin
    if(rst)    begin
      vst[0] <= `var_num'd0-1;       
	  vst[1] <= `var_num'd0-1;
	  vst[2] <= `var_num'd0;	
    end
    else if(vst_en) 
	  if(vst_write)
	    vst[vst_address][rewrite_free_bit] <=1'b0;
	  else if(vst_bcp_write)
        vst[vst_address]<=vst_in;	  
      else 
        vst_out <= vst[vst_address];
	else if(!vst_en)
       vst_out  <=`var_num'd0;	
  end



endmodule