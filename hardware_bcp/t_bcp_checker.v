
`include "bcp_checker1.v"
module t_bcp_checker;
	parameter var_num=8;
    reg clock;
	reg reset;
	reg en;
	reg	 [var_num-1:0] free;
	reg	 [var_num-1:0] assignment;
	reg	 [var_num-1:0] clause_type;
	reg	 [var_num-1:0] clause_mask;	
	reg  [var_num-1:0] counter;
	reg  [var_num-1:0] clause_size;	
	wire unit_exist;
	wire [var_num-1:0] implication;
	wire bcp_finish;
    integer i;
        bcp_checker1 bcp_checker1(
		.clock(clock),
		.reset(reset),
		.en(en),
		.free(free),
        .assignment(assignment), 
        .clause_type(clause_type),
		.clause_mask(clause_mask),
		.clause_size(clause_size),
		.counter(counter),
		.unit_exist(unit_exist),
		.implication(implication),
		.bcp_finish(bcp_finish));
     
	 
	 parameter CLK_PERIOD = 10;
		
    initial
	begin
		$dumpfile("bcp_checker.vcd");
		$dumpvars;	
		clock=1;
		en=0;
		assignment<=8'b10101010;//1:1
		clause_type<=8'b10101010;
		clause_mask<=8'b11111111;
		clause_size<=8'b00000011;
		counter<=8'b00000010;
		free<=8'b000000;
		#10
		#2
		reset=1;
		#10
		reset=0;
		#10
		en=0;
		#5
		en=1;
		

		$display("assignment=%6b ,clause_type=%6b ,clause_mask=%6b ,clause_size=%6b,counter=%6b,unit_exist=%6b,time=%d",assignment,clause_type,clause_mask,clause_size,counter,unit_exist,$time);		
		$display("       free=%6b ,clause_mask=%6b ,implication=%6b ",free,clause_mask,implication);		
		$display("-----------------------------------------------------------------------------------------------------------------------");		

		#5
		en=0;

//----------------------------------------------------------------------------------------------------------------//		
		#10
		assignment<=8'b10101010;//2: 
		clause_type<=8'b10101010;
		clause_mask<=8'b11111111;
		clause_size<=8'b00000111;
		counter<=8'b00000110;	
		free<=8'b000000;
		reset=1;
		#10
		reset=0;
		#10
		en=0;
		#5
		en=1;
		

		$display("assignment=%6b ,clause_type=%6b ,clause_mask=%6b ,clause_size=%6b,counter=%6b,unit_exist=%6b,time=%d",assignment,clause_type,clause_mask,clause_size,counter,unit_exist,$time);		
		$display("       free=%6b ,clause_mask=%6b ,implication=%6b ",free,clause_mask,implication);		
		$display("-----------------------------------------------------------------------------------------------------------------------");		

		#5
		en=0;
//----------------------------------------------------------------------------------------------------------------//		
		#10	
		assignment<=8'b10101010;//3
		clause_type<=8'b01010101;
		clause_mask<=8'b11111111;
		clause_size<=8'b00001111;
		counter<=8'b00001110;
		free<=8'b11111111;		
		reset=1;
		#10
		reset=0;
		#10
		en=0;
		#5
		en=1;
		

		$display("assignment=%6b ,clause_type=%6b ,clause_mask=%6b ,clause_size=%6b,counter=%6b,unit_exist=%6b,time=%d",assignment,clause_type,clause_mask,clause_size,counter,unit_exist,$time);		
		$display("       free=%6b ,clause_mask=%6b ,implication=%6b ",free,clause_mask,implication);		
		$display("-----------------------------------------------------------------------------------------------------------------------");		

		#5
		en=0;
		
//----------------------------------------------------------------------------------------------------------------//		
		#10		
		assignment<=8'b10101010;//4
		clause_type<=8'b10101010;
		clause_mask<=8'b00000000;
		clause_size<=8'b10000011;
		counter<=8'b10000011;	
		free<=8'b01010101;		
		reset=1;
		#10
		reset=0;
		#10
		en=0;
		#5
		en=1;
		

		$display("assignment=%6b ,clause_type=%6b ,clause_mask=%6b ,clause_size=%6b,counter=%6b,unit_exist=%6b,time=%d",assignment,clause_type,clause_mask,clause_size,counter,unit_exist,$time);		
		$display("       free=%6b ,clause_mask=%6b ,implication=%6b ",free,clause_mask,implication);		
		$display("-----------------------------------------------------------------------------------------------------------------------");		

		#5
		en=0;

//----------------------------------------------------------------------------------------------------------------//		
		#10
		assignment<=8'b10101010;//5
		clause_type<=8'b10101010;
		clause_mask<=8'b11100000;
		clause_size<=8'b01000011;
		counter<=8'b01000011;	
		free<=8'b10101010;		
		reset=1;
		#10
		reset=0;
		#10
		en=0;
		#5
		en=1;
		#3

		$display("assignment=%6b ,clause_type=%6b ,clause_mask=%6b ,clause_size=%6b,counter=%6b,unit_exist=%6b,time=%d",assignment,clause_type,clause_mask,clause_size,counter,unit_exist,$time);		
		$display("       free=%6b ,clause_mask=%6b ,implication=%6b ",free,clause_mask,implication);		
		$display("-----------------------------------------------------------------------------------------------------------------------");		

		#5
		en=0;

//----------------------------------------------------------------------------------------------------------------//		
		#10
		assignment<=8'b10101010;//6
		clause_type<=8'b01001010;
		clause_mask<=8'b11100000;
		clause_size<=8'b11000011;
		counter<=8'b11000011;	
		free<=8'b0100_0000;	
		reset=1;
		#10
		reset=0;
		#10
		en=0;
		#5
		en=1;
		

		$display("assignment=%6b ,clause_type=%6b ,clause_mask=%6b ,clause_size=%6b,counter=%6b,unit_exist=%6b,time=%d",assignment,clause_type,clause_mask,clause_size,counter,unit_exist,$time);		
		$display("       free=%6b ,clause_mask=%6b ,implication=%6b ",free,clause_mask,implication);		
		$display("-----------------------------------------------------------------------------------------------------------------------");		

		#5
		en=0;

//----------------------------------------------------------------------------------------------------------------//		
	
		
		
        # 1000 $finish;  
	end    
         
     always #(CLK_PERIOD/2) clock = ~clock;
  
endmodule