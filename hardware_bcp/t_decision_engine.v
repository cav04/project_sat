`timescale 1ns/10ps
`include"decision_engine.v"
module t_decision_engine;
parameter address_width=3;
parameter var_num=8;

reg clock, reset, decision_en;

wire [var_num-1:0] var_out;
wire decision_finish;
wire assignment;
//integer i,a;

decision_engine decision_engine1 (	.clock(clock), 
									.reset(reset), 
									.decision_en(decision_en), 
									.var_out(var_out),  
									.decision_finish(decison_finish), 									
									.assignment(assignment));

initial 
begin

	$dumpfile("decision_engine.fsdb");
	$dumpvars;	

  clock = 1;
  reset = 0;
  decision_en=1'b0;		


  #20
  reset = 1;
  #10
  #1
	decision_en=1'b1;	
  #10;


  #30;
//  $display("addr=%d, din=%6b,dout=%6b,en=%d,r_w=%d,time=%d",addr,din,dout,en,r_w,$time);
  


 

	#1000 $finish ;
end

always #10 clock = ~clock;  

endmodule