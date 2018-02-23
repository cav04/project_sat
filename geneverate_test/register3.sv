module register( output logic rd, 
               input clk,
			   input w_en, 
               input  wd);
 reg  r; 
 always_comb begin
   rd =r; 
 end
 always @(posedge clk)
 begin
  if (w_en) begin
  //  $display("testetstestest");	 
    r <= wd; 
	end
 end
endmodule