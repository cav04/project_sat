//`define initial_data_size 18
module data_mem 
				(
					input logic [`clause_num_log-1:0] data_mem_address,
					input logic [`initial_data_size-1:0] data_mem_in,
					input logic data_mem_en,
					input logic data_mem_write,
					input logic clk,
					input logic rst,
					output logic [`initial_data_size-1:0] data_mem_out
				);
	logic [`initial_data_size-1:0] mem [`clause_num-1:0];
				
	always_ff@(posedge clk or posedge rst)	begin
	  if(rst) begin		  
	    mem[0]<=`initial_data_size'b000_001_0000_011_0000_011; //( A v B)
	    mem[1]<=`initial_data_size'b000_001_0000_110_0000_000; //( -B v -C) 
	    mem[2]<=`initial_data_size'b000_001_0011_000_0011_000; //( D v E) 
	    mem[3]<=`initial_data_size'b000_011_1101_000_1101_000; //( D v F v G)
	    mem[4]<=`initial_data_size'b000_011_0000_001_1100_001; //( A v-F v-G)
	    mem[5]<=`initial_data_size'b000_011_1100_100_1100_100; //( C v F v-G)
	    mem[6]<=`initial_data_size'b000_001_1100_000_0100_000; //(-F v G)
		
		data_mem_out<=`initial_data_size'dz;
	  end
	  else if(data_mem_en)
	    if(data_mem_write)
		  mem[data_mem_address]<=data_mem_in;
		else
	      data_mem_out<=mem[data_mem_address];	
      else
          data_mem_out<=`initial_data_size'dz;	  
	end

	
   
   endmodule