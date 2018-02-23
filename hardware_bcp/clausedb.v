module clause_db(clock, reset, data_read, data_write, mem_request, d_in, address, d_out,mem_work);

parameter data_size  = 8;         //Data Size
parameter mem_size = 8;      //Memory Size
parameter address_size = 8;         //Address Size

input clock, reset, data_read, data_write, mem_request;
input [data_size-1:0]  d_in;
input [address_size-1:0] address;

output reg [data_size-1:0]  d_out;
output reg mem_work;

reg [data_size-1:0] clause_database [mem_size-1:0];


integer i;

always@(posedge clock or negedge reset)
begin
  #1
  if(!reset) 
    begin//1
		for(i = 0; i < mem_size ; i=i+1) 		
			clause_database[i] <= 1'b0;
		d_out <= 0;	
	end//1
  else if(!mem_request&&mem_work)
    begin
      if(data_write)
        begin //1 
	    clause_database[address] <= d_in;
	    mem_work<=1'b0;
     	end  //1
      else if(data_read)
     	begin//1
        d_out <= clause_database[address];
	    mem_work<=1'b0;
     	end  //1
      else	
	    mem_work<=1'b0;
    end	  
  else if(!mem_work)
    begin
     d_out <=#1 8'bzzzz_zzzz;
	 mem_work<= 1'b1;	 
    end 

end


/*
integer j;
initial
begin
#500
  for(j=0;j<8;j=j+1)
	$display("clause_database=%b",clause_database[j]);
end	
*/	


endmodule