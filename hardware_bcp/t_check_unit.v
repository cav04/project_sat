`include "check_unit.v"
module t_check_unit;
	parameter size=8;
	parameter clause_num=8;
	parameter var_num=8;	
    reg clock;
	reg reset;
	reg [2*clause_num-1:0] clause;
	reg	 [size-1:0] clause_size;	
	reg [var_num-1:0] assignment;
	reg [var_num-1:0] free;
	reg [var_num-1:0] counter_wire;
	reg [var_num-1:0] clause_size_wire;
	reg [2*var_num-1:0] clause_register_wire;

	wire [var_num-1:0] implication;
	wire implication_exist;
    integer i;
        check_unit check_unit (
		.clock(clock),
		.reset(reset),
		.clause_enable(clause_enable),
        .assignment(assignment),
		.free(free),
		.clause_register_wire(clause_register_wire),
		.counter_wire(counter_wire),
		.clause_size_wire(clause_size_wire),
		.implication(implication),
		.implication_exist(implication_exist));
     




	 
	parameter CLK_PERIOD = 10;
		
    initial
	begin
		#20
		clock=1;
		reset=1;
//		$monitor("clock=%d", clock);
		#30
		reset=0;
		#10
		assignment<=8'b0000_0000;
		counter_wire<=8'b0000_0011;
		clause_size_wire<=8'b0000_0011;
		free<=8'b0010_0000;
		clause_register_wire<=16'b1100_0000_1100_0000;

		#10
		$display("counter_wire=%b,clause_size_wire=%b,assignment=%b,clause_register=%b",check_unit.counter,check_unit.clause_size,check_unit.assignment,check_unit.clause_register);


		#10
		$display("mask=%b,type=%b",check_unit.clause_register[15:8],check_unit.clause_type);		
		
	//	#10
	//	$display("mask=%b,type=%b",check_unit.clause_mask,check_unit.clause_type);
		
		
		#10
		$display("clause_size=%d", check_unit.clause_size);
		#30
		$display("bcp or not=%d,where=%d,", implication_exist,implication);
		
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