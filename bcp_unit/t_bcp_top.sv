`define initial_data_size 12
`define var_num 4
`define var_num_log 2
`define CYCLE 10

`include "bcp_top.sv"





module t_bcp_top();
				

  logic clk;
  logic rst;
  logic initial_request;
  logic [`var_num-1:0] assignment;
  logic [`var_num-1:0] free;				
  logic bcp_request;				
				

  bcp_top bcp_t1(
    .clk(clk),
	.rst(rst),
	.initial_request(initial_request),
	.free(free),
	.assignment(assignment),
	.bcp_request(bcp_request)
  );	
 
 
 
 
 
 
 
	
  always #(`CYCLE/2) clk = ~clk;



  initial
  begin
    $fsdbDumpfile("t_bcp_top.fsdb");
    $fsdbDumpvars(0, t_bcp_top);
  end  

initial
   begin
	  rst=1;
      initial_request=0;
      bcp_request=0;	  
	  assignment =`var_num'b1010;
	  free       =`var_num'b1110;
      clk   = 1;   
	  #10
	  rst=0;
      #10	  
	  initial_request=1;
	  #20
	  initial_request=0;
      #150	
      bcp_request=1;	
	  #10	  
      bcp_request=0;  
      #1000
       $finish;	  
   end
   
   
   endmodule