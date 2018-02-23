module var_table(
          input  logic clock,
          input  logic reset,
          input  logic write, 
          input  logic read, 		  
          input  logic enable,
          input  logic [8:0]data_in,
          input  logic [2:0]data_address,
		  output logic [8:0]data_out,
		  output logic mem_work
      );

  logic [7:0] mem_data [2:0];

  always_ff@(posedge clock or negedge reset)    begin       
    if(!reset)   begin
//      for(integer i=0;i<3;i=i+1)
		mem_data[0] <= 8'h00;
        mem_data[1] <= 8'hff;
		mem_data[2] <= 8'h0;		
      data_out <= 8'd0;  
    end
    else if(enable)
      begin
        if(write&&!work) begin
          data_out  <= mem_data [data_address];
		  mem_work  <=1'b1;
		end  
        else if (read&&!work) begin
          mem_data[data_address] <= data_in; 
		  mem_work<=1;
		end  
        else begin
          data_out <= 8'd0;
          mem_work<=0;
		end  
	  end
    else if(mem_work) begin
      data_out <= 8'd0;
	  mem_work <=0;
	end  
  end
endmodule 

