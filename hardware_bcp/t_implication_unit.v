`include "implication_unit.v"
module t_implication_unit;
	parameter size=8;
    reg clk;
	reg	 [size-1:0] free;
	reg	 [size-1:0] clause_mask;
	wire [size-1:0] implication;
    integer i;
        implication_unit uut (
        .free(free), 
        .clause_mask(clause_mask),
		.implication(implication));
     
	 
	 parameter CLK_PERIOD = 10;
		
    initial
	begin
		#20
/*		a=0;b=1;c=0;
		#1
		$display("a=%d,b=%d,c=%d,d=%d,",a,b,c,d);
//-----------------------------------------------------------------//		
		a=0;b=1;c=0;
		#1
		$display("a=%d,b=%d,c=%d,d=%d,",a,b,c,d);		
//-----------------------------------------------------------------//		
		a=0;b=1;c=0;
		#1
		$display("a=%d,b=%d,c=%d,d=%d,",a,b,c,d);		

//-----------------------------------------------------------------//		
		a=0;b=1;c=0;
		#1
		$display("a=%d,b=%d,c=%d,d=%d,",a,b,c,d);		
//-----------------------------------------------------------------//		
		a=0;b=1;c=0;
		#1
		$display("a=%d,b=%d,c=%d,d=%d,",a,b,c,d);		
*/
		for(i=0;i<64;i++)
		begin
		#1
			free=i/4;
			b=i/2;
		#5
		$display("i=%d, free=%6b ,clause_mask=%6b ,implication=%6b",i,free,clause_mask,implication);		
	
		end	
		
		
		
		
		
		
        # 1000 $finish;  
	end    
         
     always #(CLK_PERIOD/2) clk = ~clk;
  
endmodule