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
  if (w_en) 
    r <= wd; 
 end
endmodule