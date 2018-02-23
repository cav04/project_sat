`include "unit_checker.v"
module t_unit_checker;
	parameter size=8;
	parameter clause_num=8;
	parameter var_num=8;	
    reg clock;
	reg	 [size-1:0] counter;
	reg	 part_sat;
	reg	 [size-1:0] clause_size;	
	reg en_part_sat;
	wire unit_clause;
    integer i;
        unit_checker uut (
		.clock(clock),
		.en_part_sat(en_part_sat),
        .part_sat(part_sat), 
        .counter(counter),
		.clause_size(clause_size),
		.unit_clause(unit_clause));
     
	 
	 parameter CLK_PERIOD = 4;
		
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
		en_part_sat=1;
		#10 //status1
		counter<=8'b00000011;
		clause_size<=8'b00000011;
		part_sat<=1'b1;
		#10
		$display("part_sat=%6b ,counter=%6d ,clause_size=%6d ,unit_clause=%6b ",part_sat,counter,clause_size,unit_clause);		
		en_part_sat=0;
//--------------------------------------------------------------------------------------------------------------------------//		
		#10
		en_part_sat=1;
		#10 //status2
		counter<=8'b00000010;
		clause_size<=8'b00000011;
		part_sat<=1'b1;
		#10
		$display("part_sat=%6b ,counter=%6d ,clause_size=%6d ,unit_clause=%6b ",part_sat,counter,clause_size,unit_clause);		

//--------------------------------------------------------------------------------------------------------------------------//
		#10 //status3
		counter<=8'b00000011;
		clause_size<=8'b00000011;
		part_sat<=1'b0;
		#10
		$display("part_sat=%6b ,counter=%6d ,clause_size=%6d ,unit_clause=%6b ",part_sat,counter,clause_size,unit_clause);		

//--------------------------------------------------------------------------------------------------------------------------//
		#10 //status4
		counter<=8'b00000010;
		clause_size<=8'b00000011;
		part_sat<=1'b0;
		#10
		$display("part_sat=%6b ,counter=%6d ,clause_size=%6d ,unit_clause=%6b ",part_sat,counter,clause_size,unit_clause);		

//--------------------------------------------------------------------------------------------------------------------------//
		#10 //status5
		counter<=8'b10000000;
		clause_size<=8'b10000000;
		part_sat<=1'b1;
		#10
		$display("part_sat=%6b ,counter=%6d ,clause_size=%6d ,unit_clause=%6b ",part_sat,counter,clause_size,unit_clause);		

//--------------------------------------------------------------------------------------------------------------------------//
		#10 //status6
		counter<=8'b10000000;
		clause_size<=8'b10000000;
		part_sat<=1'b0;
		#10
		$display("part_sat=%6b ,counter=%6d ,clause_size=%6d ,unit_clause=%6b ",part_sat,counter,clause_size,unit_clause);		

//--------------------------------------------------------------------------------------------------------------------------//		
		
		
		
		
        # 1000 $finish;  
	end    
         
     always #(CLK_PERIOD/2) clock = ~clock;
  
endmodule