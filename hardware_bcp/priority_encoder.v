module priority_encoder (
	input wire clock,
	input wire [7:0] in,
	input wire pe_en,
	output reg [2:0] out,
	output reg pe_finish
  );
	reg [2:0] out_temp;

  genvar i; //a generate block needs a genvar
  generate
    for (i=0;i<7;i=i+1) 
	  begin :gen_block
      always @* begin
        if (in[i]==1'b1) 
          out_temp = i;
//        else
//          out_temp = 3'bZZZ;
      end
	 end 
  endgenerate


  always @(posedge clock or pe_en)
  begin
	if(pe_en)
	begin
		out=out_temp;
		pe_finish=1;
	end			
  end
 /* 
  always @* 
  begin
	if(pe_finish)
	begin
	#6	pe_finish=0;
	end			
  end
*/
   
endmodule