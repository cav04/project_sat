`include "priority_encoder1.v"
module t_pe;
	parameter EncodingSize = 3;
    reg clock;	
    reg [0:2**EncodingSize-1] in;
	wire [EncodingSize-1:0] out;
	
	
	
	reg pe_en;

   
        priority_encoder p1(	
        .in(in), 
		.pe_en(pe_en),
        .out(out),
		.pe_finish(pe_finish));
     
	 
	 parameter CLK_PERIOD = 10;
	 
	 
	 
		
    initial
	begin
	$dumpfile("priority_encoder.vcd");
	$dumpvars;	
		clock=1;
		pe_en=0;
//--------------------------------------------------------------------------------------------------------//	
		#10
		in=8'b1000_0000;
		#8
		pe_en=0;
		$display("input=%b,output=%d,pe_en=%b,pe_finish=%b",in,out,pe_en,pe_finish);		
//--------------------------------------------------------------------------------------------------------//	
		#10
		pe_en=1;		
		in=8'b1001_0000;
		#5
		pe_en=0;
		$display("input=%b,output=%d,pe_en=%b,pe_finish=%b",in,out,pe_en,pe_finish);		
//--------------------------------------------------------------------------------------------------------//	
		#10
		pe_en=1;		
		in=8'b0100_0000;
		#5
		pe_en=0;
		$display("input=%b,output=%d,pe_en=%b,pe_finish=%b",in,out,pe_en,pe_finish);		
//--------------------------------------------------------------------------------------------------------//	
		#10
		pe_en=1;		
		in=8'b0110_0000;
		#5
		pe_en=0;
		$display("input=%b,output=%d,pe_en=%b,pe_finish=%b",in,out,pe_en,pe_finish);		
//--------------------------------------------------------------------------------------------------------//	
		#10
		pe_en=1;		
		in=8'b1000_1100;
		#5
		pe_en=0;
		$display("input=%b,output=%d,pe_en=%b,pe_finish=%b",in,out,pe_en,pe_finish);		
//--------------------------------------------------------------------------------------------------------//	
		#10
		pe_en=1;		
		in=8'b0001_0000;
		#5
		pe_en=0;
		$display("input=%b,output=%d,pe_en=%b,pe_finish=%b",in,out,pe_en,pe_finish);		
//--------------------------------------------------------------------------------------------------------//	
		#10
		pe_en=1;		
		in=8'b1000_0000;
		#5
		pe_en=0;
		$display("input=%b,output=%d,pe_en=%b,pe_finish=%b",in,out,pe_en,pe_finish);		
//--------------------------------------------------------------------------------------------------------//	
		#10
		pe_en=1;		
		in=8'b1000_0000;
		#5
		pe_en=0;
		$display("input=%b,output=%d,pe_en=%b,pe_finish=%b",in,out,pe_en,pe_finish);	
//--------------------------------------------------------------------------------------------------------//	
		#10
		pe_en=1;		
		in=8'b1000_0000;
		#5
		pe_en=0;
		$display("input=%b,output=%d,pe_en=%b,pe_finish=%b",in,out,pe_en,pe_finish);	


		# 1000 $finish;  	
	end	

     always #(CLK_PERIOD/2) clock = ~clock;
		
endmodule		