`include "nox_and.v"
module t_na;
    reg clk;
	reg	 assignment,clause_type,clause_mask;
//	reg i;
	wire na_out;
    integer i;
	integer j;
        nox_and uut (
        .assignment(assignment), 
        .clause_type(clause_type),
		.clause_mask(clause_mask),
		.na_out(na_out));
     
	 
	 parameter CLK_PERIOD = 10;
		
    initial
	begin
	$dumpfile("nox_and.vcd");
	$dumpvars;		
	
		#20
		assignment=0;clause_type=0;clause_mask=0;
		#2
		$display("assignment=%d,clause_type=%d,clause_mask=%d,na_out=%d,",assignment,clause_type,clause_mask,na_out);
//-----------------------------------------------------------------//		
		assignment=0;clause_type=0;clause_mask=1;
		#2
		$display("assignment=%d,clause_type=%d,clause_mask=%d,na_out=%d,",assignment,clause_type,clause_mask,na_out);
//-----------------------------------------------------------------//		
		assignment=0;clause_type=1;clause_mask=0;
		#2
		$display("assignment=%d,clause_type=%d,clause_mask=%d,na_out=%d,",assignment,clause_type,clause_mask,na_out);	

//-----------------------------------------------------------------//		
		assignment=0;clause_type=1;clause_mask=1;
		#2
		$display("assignment=%d,clause_type=%d,clause_mask=%d,na_out=%d,",assignment,clause_type,clause_mask,na_out);		
//-----------------------------------------------------------------//		
		assignment=1;clause_type=0;clause_mask=0;
		#2
		$display("assignment=%d,clause_type=%d,clause_mask=%d,na_out=%d,",assignment,clause_type,clause_mask,na_out);	
//-----------------------------------------------------------------//		
		assignment=1;clause_type=0;clause_mask=1;
		#2
		$display("assignment=%d,clause_type=%d,clause_mask=%d,na_out=%d,",assignment,clause_type,clause_mask,na_out);	//-----------------------------------------------------------------//		
		assignment=1;clause_type=1;clause_mask=0;
		#2
		$display("assignment=%d,clause_type=%d,clause_mask=%d,na_out=%d,",assignment,clause_type,clause_mask,na_out);	//-----------------------------------------------------------------//		
		assignment=1;clause_type=1;clause_mask=1;
		#2
		$display("assignment=%d,clause_type=%d,clause_mask=%d,na_out=%d,",assignment,clause_type,clause_mask,na_out);	//-----------------------------------------------------------------//		
	
	
		
		
		
		
		
		
        # 1000 $finish;  
	end    
         
     always #(CLK_PERIOD/2) clk = ~clk;
  
endmodule