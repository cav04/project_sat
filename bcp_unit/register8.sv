module register
				#(w=8)
			( output logic [w-1:0] rd, 
               input  logic clk,
			   input  logic w_en, 
               input logic [w-1:0] wd);
 reg  [w-1:0] r; 
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