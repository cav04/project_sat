`include"bcp_checker1.sv"
`define PERIOD 10
  module t_bcp();

	
	logic clk;
	logic rst;
	logic en;
	logic[3:0] free;
	logic[3:0] assignment;
    logic [11:0] initial_data;
    logic bcp_initial;
    logic unit_exist;
    logic [1:0]	encoded_implication;
	logic flag;
	
	bcp_checker1 b1(.clk(clk),.rst(rst),.en(en),.free(free),.assignment(assignment),.initial_data(initial_data),.bcp_initial(bcp_initial),.unit_exist(unit_exist),.encoded_implication(encoded_implication),.flag(flag));
	
	
	initial begin
	bcp_initial  =0;		
	clk=1;
	rst=1;
	en=0;
	free         =4'b0100;
	assignment   =4'b1000;
	#20
	rst=0;
	#20
	bcp_initial  =1;	
	initial_data =12'b01_10_1110_0110;	
	#20
	bcp_initial  =0;	
	#20
	en=1;
	#20
	en=0;	
	#300
    $finish;
	
	end
	
	
  initial
  begin
    $fsdbDumpfile("t_bcp.fsdb");
    $fsdbDumpvars(0, t_bcp);
  end  
	
  always #(`PERIOD/2) clk = ~clk;
   

  endmodule