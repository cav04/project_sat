`include "partial_sat.v"
module t_part_sat;
	parameter var_num=8;
    reg clk;
	reg	 [var_num-1:0] assignment;
	reg	 [var_num-1:0] clause_type;
	reg	 [var_num-1:0] clause_mask;	
	wire part_sat;
    integer i;
        partial_sat uut (
        .assignment(assignment), 
        .clause_type(clause_type),
		.clause_mask(clause_mask),
		.part_sat(part_sat));
     
	 
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
/*		for(i=0;i<64;i++)
		begin
		#1
			assignment=i/4;
			clause_type=i/2;
			clause_mask=i/1;
		#5
		$display("i=%d, assignment=%6b ,clause_type=%6b ,clause_mask=%6b ,part_sat=%6b ",i,assignment,clause_type,clause_mask,part_sat);		

*/
//----------------------------------------------------------------------------------------------------------------//		

		assignment=8'b10101010;//1
		clause_type=8'b10101010;
		clause_mask=8'b00000000;
		#5
		$display("i=%d, assignment=%6b ,clause_type=%6b ,clause_mask=%6b ,part_sat=%6b ",i,assignment,clause_type,clause_mask,part_sat);		

//----------------------------------------------------------------------------------------------------------------//		

		assignment=8'b10101010;//2
		clause_type=8'b10101010;
		clause_mask=8'b11111111;
		#5
		$display("i=%d, assignment=%6b ,clause_type=%6b ,clause_mask=%6b ,part_sat=%6b ",i,assignment,clause_type,clause_mask,part_sat);		
	
//----------------------------------------------------------------------------------------------------------------//		
	
		assignment=8'b10101010;//3
		clause_type=8'b01010101;
		clause_mask=8'b11111111;
		#5
		$display("i=%d, assignment=%6b ,clause_type=%6b ,clause_mask=%6b ,part_sat=%6b ",i,assignment,clause_type,clause_mask,part_sat);		
		
//----------------------------------------------------------------------------------------------------------------//		
		
		assignment=8'b10101010;//4
		clause_type=8'b10101010;
		clause_mask=8'b00000000;
		#5
		$display("i=%d, assignment=%6b ,clause_type=%6b ,clause_mask=%6b ,part_sat=%6b ",i,assignment,clause_type,clause_mask,part_sat);		

//----------------------------------------------------------------------------------------------------------------//		
		assignment=8'b10101010;//5
		clause_type=8'b10101010;
		clause_mask=8'b11100000;
		#5
		$display("i=%d, assignment=%6b ,clause_type=%6b ,clause_mask=%6b ,part_sat=%6b ",i,assignment,clause_type,clause_mask,part_sat);		

//----------------------------------------------------------------------------------------------------------------//		
		assignment=8'b10101010;//6
		clause_type=8'b01001010;
		clause_mask=8'b11100000;
		#5
		$display("i=%d, assignment=%6b ,clause_type=%6b ,clause_mask=%6b ,part_sat=%6b ",i,assignment,clause_type,clause_mask,part_sat);		

//----------------------------------------------------------------------------------------------------------------//		
	
		
		
        # 1000 $finish;  
	end    
         
     always #(CLK_PERIOD/2) clk = ~clk;
  
endmodule