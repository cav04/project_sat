`timescale 1ns/10ps
`include"bcp_engine.v"
module t_bcp_engine;

parameter address_width=8;
parameter clause_num=1;
parameter var_num=8;

reg clock;
reg reset;
reg bcp_engine_en;
reg [var_num-1:0] free;
reg [var_num-1:0] assignment;
reg [var_num-1:0] clause_mask;
reg [var_num-1:0] clause_size;
reg [var_num-1:0] clause_type;
reg [var_num-1:0] counter;
reg [var_num-1:0] access_address;
wire [clause_num-1:0] bcp_finish;



reg [var_num-1:0] clause;

integer i,j;

/*
	input wire clock;
	input wire reset;
	input wire bcp_engine_en;
	input wire [var_num-1:0] address_wire;
	input wire [var_num-1:0] free;
	input wire [var_num-1:0] assignment;
	input wire [var_num-1:0] clause_mask;
	input wire [var_num-1:0] clause_type;
	input wire [var_num-1:0] clause_size;
	input wire [var_num-1:0] counter;
	output reg [clause_num-1:0] bcp_finish;

*/
bcp_engine bcp_engine1 (	.clock(clock), 
							.reset(reset), 
							.bcp_engine_en(bcp_engine_en), 
							.access_address(access_address),
							.free(free), 									
							.assignment(assignment),
							.clause_mask(clause_mask),
							.clause_size(clause_size),
							.clause_type(clause_type),
							.counter(counter),
							.bcp_finish(bcp_finish));

//-------------------------------------------------//



//------------------------------------------------//							
							
							
initial 
begin

	$dumpfile("bcp_engine.vcd");
	$dumpvars;	
	
	clock = 1;
	reset = 1;
	bcp_engine_en=1'b0;
		assignment<=8'b01001010;//5
		clause_type<=8'b10101010;
		clause_mask<=8'b11100000;
		clause_size<=8'b01000011;
		counter<=8'b01000010;	
		free<=8'b10101010;	
	access_address=8'b0000_0011;
/*	
	for(i=0;i<address_width;i=i+1)
	begin
		#1  bcp_engine1.clause_data_base[i] = clause[i];
	end
*/		
	

  #20
  reset = 0;
  #15
//  for(j=0;j<8;j=j+1)
//	$display("clause_database=%b",clause_db1.clause_database[j]);
  #10
  $display("bcp_engine1.curr_state=%b",bcp_engine1.curr_state);
  $display("bcp_engine1.read_finish=%b",bcp_engine1.read_finish);  
  $display("bcp_engine1.bcp_finish=%b",bcp_engine1.bcp_finish);
  $display("bcp_engine1.access_address=%b",bcp_engine1.access_address);  
  $display("bcp_engine1.access_address=%b",bcp_engine1.access_address);    
  $display("bcp_engine1.bcp_finish_wire[i]=%b",bcp_engine1.bcp_finish_wire[i]);   
  $display("bcp_engine1.implication_reg_wire=%b",bcp_engine1.implication_reg_wire); 
//  $display("bcp_engine1.label2[0].clause_type_reg=%b",bcp_engine1.label2[0].clause_type_reg);   

  $display("----------------------------------------------------------------------------------");  

	bcp_engine_en=1'b1;	
  #13;
  $display("bcp_engine1.curr_state=%b",bcp_engine1.curr_state);
  $display("bcp_engine1.read_finish=%b",bcp_engine1.read_finish);  
  $display("bcp_engine1.bcp_finish=%b",bcp_engine1.bcp_finish);
  $display("bcp_engine1.access_address=%b",bcp_engine1.access_address);  
  $display("bcp_engine1.access_address=%b",bcp_engine1.access_address);    
  $display("bcp_engine1.bcp_finish_wire[i]=%b",bcp_engine1.bcp_finish_wire[i]);   
  $display("bcp_engine1.implication_reg_wire=%b",bcp_engine1.implication_reg_wire);     

  $display("----------------------------------------------------------------------------------");
  #13;
  $display("bcp_engine1.curr_state=%b",bcp_engine1.curr_state);
  $display("bcp_engine1.read_finish=%b",bcp_engine1.read_finish);  
  $display("bcp_engine1.bcp_finish=%b",bcp_engine1.bcp_finish);
  $display("bcp_engine1.access_address=%b",bcp_engine1.access_address);  
  $display("bcp_engine1.access_address=%b",bcp_engine1.access_address);   
  $display("bcp_engine1.bcp_finish_wire[i]=%b",bcp_engine1.bcp_finish_wire[i]);   
  $display("bcp_engine1.implication_reg_wire=%b",bcp_engine1.implication_reg_wire);     
  $display("----------------------------------------------------------------------------------");

  #13;
  $display("bcp_engine1.curr_state=%b",bcp_engine1.curr_state);
  $display("bcp_engine1.read_finish=%b",bcp_engine1.read_finish);  
  $display("bcp_engine1.bcp_finish=%b",bcp_engine1.bcp_finish);
  $display("bcp_engine1.access_address=%b",bcp_engine1.access_address);  
  $display("bcp_engine1.access_address=%b",bcp_engine1.access_address);     
  $display("bcp_engine1.bcp_finish_wire[i]=%b",bcp_engine1.bcp_finish_wire[i]);   
  $display("bcp_engine1.implication_reg_wire=%b",bcp_engine1.implication_reg_wire);     
  #30;



 
 

	#1000 $finish ;
end

always #10 clock = ~clock;  

endmodule