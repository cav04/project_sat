`define initial_data_size 20
`define initial_data_size_log 5
`define var_num 7
`define var_num_log 3
`define clause_num 7
`define clause_num_log 3
`define CYCLE 10

`include "sat_top.sv"






module t_sat_top();	
  logic clk;
  logic rst;
  logic sat_start;
  logic sat;
  logic sat_finish; 
    
  
					  
  sat_top sat_top1(
                          .clk(clk),
						  .rst(rst),
                          .sat_start(sat_start),						
						  .sat(sat),
						  .sat_finish(sat_finish)
						  );
						  						  
 						  
	
  always #(`CYCLE/2) clk = ~clk;
  
  initial
  begin
    $fsdbDumpfile("t_sat_top.fsdb");
    $fsdbDumpvars(0, t_sat_top);
  end   

  initial begin
	#500
    for (int j=0;j<3;j=j+1 ) begin 
      $display("       vst1[%2d]=%b",j,sat_top1.vst1.vst[j]); 
    end    
      $display("================================================="); 	
	for (int ji=0;ji<7;ji=ji+1 ) begin 
      $display("       cdb[%2d]=%b",ji,sat_top1.cdb.mem_data[ji]); 
    end
      $display("================================================="); 	
	#1000
    for (int j=0;j<3;j=j+1 ) begin 
      $display("       vst1[%2d]=%b",j,sat_top1.vst1.vst[j]); 
    end    
  end  
  

  
  
  initial
   begin
	  rst   = 1;
      clk   = 1;
      sat_start=0;	
 
	  #10
	  rst=0;
      #10	
      sat_start=1;	
      #20	  
	  sat_start=0;
      #2000	  
       $finish;	  
   end
   
   
   endmodule