/*
`define clause_num 7
`define var_num 7
`define var_num_log 3
*/

module clause_db 
               (  input logic clk, 
                  input logic rst,  
                  input logic clause_db_write, 
                  input logic clause_db_en, 
                  input logic [`clause_num-1:0] clause_db_in,
                  input logic [`var_num_log-1:0] clause_db_address, 
                  output logic [`clause_num-1:0] clause_db_out);



  logic [`clause_num-1:0] mem_data [`var_num-1:0];

  integer i;

  always@(posedge clk or posedge rst) begin
    if(rst)    begin
//      for(i = 0; i < var_num ; i=i+1) 
//	    mem_data[i] <= 0;
      mem_data[0] <= `clause_num'b0010_001;
	  mem_data[1] <= `clause_num'b0000_011;
	  mem_data[2] <= `clause_num'b0100_010;
	  mem_data[3] <= `clause_num'b0001_100;
      mem_data[4] <= `clause_num'b0000_100;
	  mem_data[5] <= `clause_num'b1111_000;
	  mem_data[6] <= `clause_num'b1111_000;
//	  mem_data[7] <= `clause_num'b1100;	  
    end
    else if(clause_db_en) 
	  if(clause_db_write)
	    mem_data[clause_db_address] <= clause_db_in;
      else 
        clause_db_out <= mem_data[clause_db_address];
	else if(!clause_db_en)
       clause_db_out  <=`clause_num'b0;	
  end

//(A v B)^ (-B v C) ^ (D v E ) ^ ( D v F v G) ^(A  v  -F  v -G) ^ ( C v F v -G ) ^ (-F v G)


endmodule