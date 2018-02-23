
  module decoder_8_to_1 
    ( input logic [`clause_num_log-1 : 0] de_in
 //   , input logic data
    , output logic[`clause_num-1 : 0] de_out
    );

//	logic [N-1 : 0] de_in;
//	logic [(1<<N)-1 : 0] de_out;
	
    always_comb begin
      de_out = 0;
      de_out[de_in] = 1'b1;
    end


/*  
   initial
    begin
	$monitor("de_out=%b",de_out);
	#10
	  de_in=3'b111;
	#10
	  de_in=3'b110;	  
	#10	
	  de_in=3'b101;
	#10
	  de_in=3'b100;
	#10
	  de_in=3'b011;
	#10
	  de_in=3'b010;	  
	#10	
	  de_in=3'b001;
	#10
	  de_in=3'b000;	  

 
   #100 $finish;
    end
*/

   
  endmodule   