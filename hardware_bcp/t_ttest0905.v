`include "ttest0905.v"
module t_ttest0905;
	
	reg a;
	reg b;
	reg c;
	reg d;
	reg clock;
	wire e;
    integer i;
        ttest0905 ttest0905 (
        .a(a),
		.b(b),
		.c(c),
		.d(d),
		.e(e));
     

	 
	parameter CLK_PERIOD = 10;
		
    initial
	begin
		#20
		a<=0;
		b<=0;
		c<=0;
		d<=1;
		#10	
		$display("a=%d,b=%d,c=%d,\d=%d,e=%d",a,b,c,d,e);
		
//-----------------------------------------------------------------//		
		#20
		a=1;b=1;c=1;d=1;
		#10	
		$display("a=%d,b=%d,c=%d,\d=%d,e=%d",a,b,c,d,e);
		
//-----------------------------------------------------------------//		

		
		
		
		/*

		for(i=0;i<64;i++)
		begin
		#1
			part_sat=i/4;
			counter=i/2;
			clause_size=i/2;
		#10
		$display("i=%d, part_sat=%6b ,counter=%6d ,clause_size=%6d ,unit_clause=%6b ",i,part_sat,counter,clause_size,unit_clause);		
	
		end	
		
*/		
		
		
		
		
        # 1000 $finish;  
	end    
         
		always #(CLK_PERIOD/2) clock = ~clock;
  
  
endmodule