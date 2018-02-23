module var_mem(clock, reset, data_read, data_write, mem_request, d_in, address, d_out,mem_work);

parameter data_size  = 8;         //Data Size
parameter mem_size = 8;      //Memory Size
parameter address_size = 2;         //Address Size


input clock, reset, data_read, data_write, mem_request;
input [data_size-1:0]  d_in;
input [address_size-1:0] address;

output reg [data_size-1:0]  d_out;
output reg mem_work;

reg [data_size-1:0] mem_data [mem_size-1:0];

integer i;

always@(posedge clock ,negedge reset)
begin
  #1
  if(!reset) 
    begin
    for(i = 0; i < mem_size ; i=i+1) mem_data[i] <= 0; 
//    d_out <= 8'd0;
	mem_work<=1;
    end
  else if(!mem_request&&mem_work)
    begin
      if(data_write&&mem_work)
        begin  
	    mem_data[address] <= d_in;
	    mem_work<=1'b0;
     	end  
      else if(data_read&&mem_work)
     	begin
        d_out <= mem_data[address];
	    mem_work<=1'b0;
     	end  
      else	
	    mem_work<=1'b0;
    end	  
  else if(!mem_work)
    begin
     d_out <=#1 8'bzzzz_zzzz;
	 mem_work<= 1'b1;	 
    end 

end



endmodule