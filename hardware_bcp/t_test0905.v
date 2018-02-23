`include "test0905.v"
module t_test0905;
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
        test0905 test0905 (
        .assignment(assignment),
		.free(free),
		.clause_register_wire(clause_register_wire),
		.counter_wire(counter_wire),
		.clause_size_wire(clause_size_wire),
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
		
		
		
		assignment<=8'b1000_0000;    //case1
		counter_wire<=8'b0000_0011;
		clause_size_wire<=8'b0000_0011;
		free<=8'b0010_0000;
		clause_register_wire<=16'b0000_0000_1000_0000;

		#10
		$display("counter_wire=%b,clause_size_wire=%b,assignment=%b,clause_register=%b",counter_wire,clause_size_wire,assignment,clause_register_wire);

		#30
		$display("bcp or not=%d", implication_exist);
		
//-----------------------------------------------------------------//		
		
		assignment<=8'b0000_0000;
		counter_wire<=8'b0000_0010;
		clause_size_wire<=8'b0000_0011;
		free<=8'b0000_0000;
		clause_register_wire<=16'b1110_0000_0000_0000;

		#10
		$display("counter_wire=%b,clause_size_wire=%b,assignment=%b,clause_register=%b",counter_wire,clause_size_wire,assignment,clause_register_wire);

		#30
		$display("bcp or not=%d", implication_exist);
		
//-----------------------------------------------------------------//		

		assignment<=8'b0101_0101;
		counter_wire<=8'b0000_0011;
		clause_size_wire<=8'b0000_0011;
		free<=8'b0010_0000;
		clause_register_wire<=16'b1111_1111_1010_0101;

		#10
		$display("counter_wire=%b,clause_size_wire=%b,assignment=%b,clause_register=%b",counter_wire,clause_size_wire,assignment,clause_register_wire);

		#30
		$display("bcp or not=%d", implication_exist);
		
//-----------------------------------------------------------------//		

		assignment<=8'b1010_1010;
		counter_wire<=8'b0000_0011;
		clause_size_wire<=8'b0000_0011;
		free<=8'b0010_0000;
		clause_register_wire<=16'b1111_1111_1010_0101;

		#10
		$display("counter_wire=%b,clause_size_wire=%b,assignment=%b,clause_register=%b",counter_wire,clause_size_wire,assignment,clause_register_wire);

		#30
		$display("bcp or not=%d", implication_exist);
		
//-----------------------------------------------------------------//		

		assignment<=8'b0000_0000;
		counter_wire<=8'b0000_0011;
		clause_size_wire<=8'b0000_0011;
		free<=8'b0010_0000;
		clause_register_wire<=16'b1110_0000_1100_0000;

		#10
		$display("counter_wire=%b,clause_size_wire=%b,assignment=%b,clause_register=%b",counter_wire,clause_size_wire,assignment,clause_register_wire);

		#30
		$display("bcp or not=%d", implication_exist);
		
//-----------------------------------------------------------------//		

		assignment<=8'b0000_0000;
		counter_wire<=8'b0000_0011;
		clause_size_wire<=8'b0000_0011;
		free<=8'b0010_0000;
		clause_register_wire<=16'b1110_0000_1100_0000;

		#10
		$display("counter_wire=%b,clause_size_wire=%b,assignment=%b,clause_register=%b",counter_wire,clause_size_wire,assignment,clause_register_wire);

		#30
		$display("bcp or not=%d", implication_exist);
		
//-----------------------------------------------------------------//		

		assignment<=8'b0000_0000;
		counter_wire<=8'b0000_0011;
		clause_size_wire<=8'b0000_0011;
		free<=8'b0010_0000;
		clause_register_wire<=16'b1110_0000_1100_0000;

		#10
		$display("counter_wire=%b,clause_size_wire=%b,assignment=%b,clause_register=%b",counter_wire,clause_size_wire,assignment,clause_register_wire);

		#30
		$display("bcp or not=%d", implication_exist);
		
//-----------------------------------------------------------------//		

		assignment<=8'b0000_0000;
		counter_wire<=8'b0000_0011;
		clause_size_wire<=8'b0000_0011;
		free<=8'b0010_0000;
		clause_register_wire<=16'b1110_0000_1100_0000;

		#10
		$display("counter_wire=%b,clause_size_wire=%b,assignment=%b,clause_register=%b",counter_wire,clause_size_wire,assignment,clause_register_wire);

		#30
		$display("bcp or not=%d", implication_exist);
		
//-----------------------------------------------------------------//		

		assignment<=8'b0000_0000;
		counter_wire<=8'b0000_0011;
		clause_size_wire<=8'b0000_0011;
		free<=8'b0010_0000;
		clause_register_wire<=16'b1110_0000_1100_0000;

		#10
		$display("counter_wire=%b,clause_size_wire=%b,assignment=%b,clause_register=%b",counter_wire,clause_size_wire,assignment,clause_register_wire);

		#30
		$display("bcp or not=%d", implication_exist);
		
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