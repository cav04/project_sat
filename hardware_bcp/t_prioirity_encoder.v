`include "priority_encoder.v"
module t_na;
    reg In;
	wire Out;
   
        priority_encoder (
        .In(In), 
        .Out(Out));
     
	 
	 parameter CLK_PERIOD = 10;
		
    initial
	begin
//--------------------------------------------------------------------------------------------------------//	
		#10
		In=8'b1000_0000;
		#10
		$display("input=%d,output=%d,",In,Out);		
//--------------------------------------------------------------------------------------------------------//	
		#10
		In=8'b1001_0000;
		#10
		$display("input=%d,output=%d,",In,Out);	
//--------------------------------------------------------------------------------------------------------//	
		#10
		In=8'b0100_0000;
		#10
		$display("input=%d,output=%d,",In,Out);	
//--------------------------------------------------------------------------------------------------------//	
		#10
		In=8'b0110_0000;
		#10
		$display("input=%d,output=%d,",In,Out);	
//--------------------------------------------------------------------------------------------------------//	
		#10
		In=8'b1000_1100;
		#10
		$display("input=%d,output=%d,",In,Out);	
//--------------------------------------------------------------------------------------------------------//	
		#10
		In=8'b0001_0000;
		#10
		$display("input=%d,output=%d,",In,Out);	
//--------------------------------------------------------------------------------------------------------//	
		#10
		In=8'b1000_0000;
		#10
		$display("input=%d,output=%d,",In,Out);	
//--------------------------------------------------------------------------------------------------------//	
		#10
		In=8'b1000_0000;
		#10
		$display("input=%d,output=%d,",In,Out);	
//--------------------------------------------------------------------------------------------------------//	
		#10
		In=8'b1000_0000;
		#10
		$display("input=%d,output=%d,",In,Out);			
		end	