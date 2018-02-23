`include "data_mem.sv"
`include "gen_bcp.sv"
`include "initial_controller.sv"
`include "clause_db.sv"
`include "bcp_controller.sv"  

`define initial_data_size 12
`define var_num 4




module initial_top
				(

				);
	logic [2:0] sel;
	logic clk;
	logic rst;
	logic [`initial_data_size-1:0] initial_data;
	logic [`var_num-1:0] unit_exist;
	logic [`var_num-1:0] free;
	logic [`var_num-1:0] assignment;
	logic [`var_num-1:0] en;
	
	logic initial_signal;
	
    logic write;
	logic mem_en; 
    logic [`var_num-1:0] d_in;
    logic [1:0] cdb_address; 
    logic initial_finish_flag;
	logic initial_request;
	logic bcp_request;
	logic bcp_finish_flag;
	logic unit_exist_bitwise_or;
	logic rewrite;
	logic rw_en;
	logic w_en;	
	logic sel_next;
	logic [`var_num-1:0] unit_clause;
	logic [1:0] next_var;
	logic next_assignment;
	
	logic conflict;
	logic conflict_analysis_en;
	logic bcp_work_en;
	logic [1:0]pe_out;
	
	logic backtrack;
	logic bcp_done;
	logic [1:0]pe_out_back;
	logic backreg;
	logic check_unit_rewrite;
	
 
	
 always
  begin
   #10 clk = ~clk;
  end
  
  always_comb begin
    unit_exist_bitwise_or=|unit_exist; 
  end

  
    bcp_controller bc1 (  .clk(clk),
	                      .rst(rst),
						  .initial_request(initial_request),
						  .initial_finish_flag(initial_finish_flag),
						  .bcp_request(bcp_request),
						  .unit_clause(unit_clause),
						  .next_var(next_var),
						  .conflict_analysis_en(conflict_analysis_en),
						  .bcp_work_en(bcp_work_en),
						  .pe_out(pe_out),
						  .pe_out_back(pe_out_back),
						  .backreg(backreg),
						  .check_unit_rewrite(check_unit_rewrite),
						  //--------------------output------------------//						  
						  .conflict(conflict),
						  .initial_signal(initial_signal),
						  .mem_en(mem_en),
						  .write(write),
						  .bcp_finish_flag(bcp_finish_flag),
						  .unit_exist_bitwise_or(unit_exist_bitwise_or),
						  .w_en(w_en),						  
						  .rw_en(rw_en),
						  .sel_next(sel_next),
						  .cdb_address(cdb_address),
						  .initial_flag(initial_flag),
						  .bcp_done(bcp_done),
						  .backtrack(backtrack)

						  );
						  
	clause_db cdb(        .clk(clk),
	                      .rst(rst),
						  .write(write),
						  .mem_en(mem_en),
						  .d_in(d_in),
						  .address(cdb_address),
						  .d_out(en));


	data_mem mm1(         .address(sel),
	                      .clk(clk),
						  .w_en(1'b0), 
						  .rst(rst),
						  .data_out(initial_data));
						  
    gen_bcp	gb1(          .sel(sel),
	                      .clk(clk),
						  .rst(rst),
						  .free(free),
						  .assignment(assignment),
						  .mem_out(en),
						  .initial_data(initial_data),
						  .w_en(w_en),						  
						  .rw_en(rw_en),
						  .sel_next(sel_next),
						  .initial_flag(initial_flag),
						  .conflict_analysis_en(conflict_analysis_en),	
                          .bcp_work_en(bcp_work_en),
                          .backtrack(backtrack),						  
						  //------------------output---------------------------------//
						  .pe_out(pe_out),
						  .unit_exist(unit_exist),
						  .unit_clause(unit_clause),
						  .next_var(next_var),
//						  .next_assignment(next_assignment),
						  .bcp_finish_flag(bcp_finish_flag),
						  .conflict(conflict),
						  .pe_out_back(pe_out_back),
						  .backreg(backreg),
						  .check_unit_rewrite(check_unit_rewrite)

						  
						  );
						  
    initial_controller ic(.rst(rst),
	                      .initial_signal(initial_signal),
						  .clk(clk),
						  .address(sel),
						  .initial_finish_flag(initial_finish_flag));
	
	


  initial
  begin
    $fsdbDumpfile("initial_top.fsdb");
    $fsdbDumpvars(0, initial_top);
  end  

initial
   begin
	  rst=1;
      initial_request=0;
      bcp_request=0;	  
	  assignment =4'b1010;
	  free       =4'b1110;
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