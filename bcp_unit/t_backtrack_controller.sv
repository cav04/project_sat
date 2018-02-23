`define var_num 8
`define var_num_log 3
`define clause_num 8
`define state_num 4
`define CYCLE 10

`include "backtrack_controller.sv"
`include "force_assign_table.sv"




module t_backtrack_controller();	
  logic clk;
  logic rst;

  logic fat_en;
  logic fat_write;
  logic [`var_num:0]fat_address;
  logic [`var_num_log-1:0] fat_in;

  
  logic backtrack;
  logic refresh;
  logic [`var_num-1:0] implication_reg;
  logic [`var_num_log-1:0]assign_variable;
  logic [`var_num-1:0] fat_out;
  logic fat_enable;
  logic [`var_num_log-1:0]next_implication_out;  
  
					  
  force_assign_table fat1(
                          .clk(clk),
						  .rst(rst),
                          .fat_en(fat_en),
						  .fat_write(fat_write),
						  .fat_address(fat_address),
						  .fat_in(next_implication_out),
						  .fat_out(fat_out)  );
						  
  backtrack_controller backtrack_controller1(
                         .clk(clk),
						 .rst(rst),
                         .backtrack(backtrack),
                         .refresh(refresh),
                         .implication_reg(implication_reg),
                         .assign_variable(assign_variable),
                         .fat_out(fat_out),
                         .fat_write(fat_write),
						 .fat_en(fat_en),
                         .fat_address(fat_address),
                         .next_implication_out(next_implication_out)
  );						  
						  
	
  always #(`CYCLE/2) clk = ~clk;
  
  initial
  begin
    $fsdbDumpfile("t_backtrack_controller.fsdb");
    $fsdbDumpvars(0, t_backtrack_controller);
  end  
  
  initial begin
    #20
    for (int j=0;j<`var_num;j=j+1 ) begin 
      $display("       fat[%2d]=%d",j,fat1.fat[j]); 
    end
	#10
    $display("==============================================="); 	
	#200
	$display("implication_reg=%b",implication_reg);
    $display("assign_variable=%b",assign_variable);	
	#10
    for (int j=0;j<`var_num;j=j+1 ) begin 
      $display("       fat[%2d]=%d",j,fat1.fat[j]); 
    end
    $display("==============================================="); 	
	#200
	$display("implication_reg=%b",implication_reg);
    $display("assign_variable=%b",assign_variable);	
	#10
    for (int j=0;j<`var_num;j=j+1 ) begin 
      $display("       fat[%2d]=%d",j,fat1.fat[j]); 
    end
  	
  end	
  

  initial
   begin
	  rst=1;
	  refresh=0;
	  backtrack=0;
//	  implication_reg       =`var_num'b0010_0110;
//	  assign_variable       =`var_num_log'b000;
	  implication_reg       =`var_num'b1010_0100;
	  assign_variable       =`var_num_log'b001;	  
      clk   = 1;   
	  #10
	  rst=0;
      #10	  
	  refresh=1;
	  #150
	  refresh=0;
      #150
	  refresh=1;
	  implication_reg       =`var_num'b0101_0000;
	  assign_variable       =`var_num_log'b011;
	  #600
	  refresh=0;	
      #100	  
       $finish;	  
   end
   
   
   endmodule