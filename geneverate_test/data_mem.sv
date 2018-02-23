module data_mem #(w=8)
				(
					input logic [2:0] address,
					input logic [2:0] data_in,
					input logic w_en,
					input logic clk,
					output logic [w-1:0] data_out
				);
	logic [w-1:0] mem [7:0];
				
	always_ff@(posedge clk)	begin
	  if(w_en)
		mem[address]<=data_in;
	end

	
	always_comb begin
	data_out=mem[address];
	end


	initial begin
	  mem[0]=8'd0;
	  mem[1]=8'd1;
	  mem[2]=8'd2;
	  mem[3]=8'd3;
	  mem[4]=8'd4;
	  mem[5]=8'd5;
	  mem[6]=8'd6;
	  mem[7]=8'd7;
/*	  #10
	  $display("mem=%d",mem[0]);
	  #10
	  $display("mem=%d",mem[1]);
	  #10
	  $display("mem=%d",mem[2]);
	  #10
	  $display("mem=%d",mem[3]);
	  #10
	  $display("mem=%d",mem[4]);
	  #10
	  $display("mem=%d",mem[5]);
	  #10
	  $display("mem=%d",mem[6]);
	  #10
	  $display("mem=%d",mem[7]);
*/	  
	end
   
   
   
   endmodule