//`include "data_mem.sv"
`include "gen_bcp.sv"
`include "initial_controller.sv"
//`include "clause_db.sv"
`include "bcp_controller.sv"  





module bcp_top
				(
				input logic clk,
				input logic rst,
				input logic initial_request,
	            input logic bcp_request,
				output logic bcp_finish_flag,
				output logic initial_finish,
                input logic [`initial_data_size-1:0]bcp_engine_data_mem_out,
//                output logic [`initial_data_size-1:0]bcp_engine_data_mem_in,
                output logic [`clause_num_log-1:0]bcp_engine_data_mem_address,
                output logic bcp_engine_data_mem_en,
//--------------------------clause_db--------------------------------------------//				
                input logic [`clause_num-1:0]bcp_engine_clause_db_out,				
                output logic bcp_engine_clause_db_write,
                output logic bcp_engine_clause_db_en,
                output logic [`var_num-1:0]bcp_engine_clause_db_address,
//-------------------------vst--------------------------------------------------//				
				input logic [`var_num-1:0]bcp_engine_vst_out,
                output logic bcp_engine_vst_write,
				output logic bcp_engine_vst_bcp_write,
                output logic bcp_engine_vst_en,
                output logic [1:0]bcp_engine_vst_address,
                output logic [`var_num-1:0]bcp_engine_vst_in				
			
				);
				
				
//	logic [`clause_num_log-1:0] sel;
	logic [`initial_data_size-1:0] initial_data;
	logic [`clause_num-1:0] unit_exist;

   logic [`var_num-1:0]free;
   logic [`var_num-1:0]assignment;
	
	
	logic initial_signal;
	
    logic write;
	logic mem_en; 
    logic [`var_num-1:0] d_in;
    logic [`var_num_log-1:0] cdb_address; 
    logic initial_finish_flag;

//	logic bcp_finish_flag;
	logic unit_exist_bitwise_or;
	logic rewrite;
	logic rw_en;
	logic w_en;	
	logic sel_next;
	logic [`clause_num-1:0] unit_clause;
	logic [`var_num_log-1:0] next_var;
	logic next_assignment;
	
	logic conflict;
	logic conflict_analysis_en;
	logic bcp_work_en;
	logic [`var_num_log-1:0]pe_out;
	
	logic backtrack;
	logic bcp_done;
	logic [`var_num_log-1:0]pe_out_back;
	logic backreg;
	logic check_unit_rewrite;
	
	logic bcp_free_initial;
	logic bcp_assignment_initial;
	logic [`var_num-1:0] gen_bcp_free_reg;
	logic [`var_num-1:0] gen_bcp_assignment_reg;
	logic [`var_num-1:0] gen_bcp_force_assign_reg;	
  
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
						  .mem_en(bcp_engine_clause_db_en),
						  .write(bcp_engine_clause_db_write),
						  .bcp_finish_flag(bcp_finish_flag),
						  .unit_exist_bitwise_or(unit_exist_bitwise_or),
						  .w_en(w_en),						  
						  .rw_en(rw_en),
						  .sel_next(sel_next),
						  .cdb_address(bcp_engine_clause_db_address),
						  .initial_flag(initial_flag),
						  .bcp_done(bcp_done),
						  .backtrack(backtrack),
                          .initial_finish(initial_finish),
//---------------------------------------------------------------------------//
                          .bcp_engine_vst_write(bcp_engine_vst_write),
						  .bcp_engine_vst_bcp_write(bcp_engine_vst_bcp_write),
                          .bcp_engine_vst_en(bcp_engine_vst_en),
                          .bcp_engine_vst_address(bcp_engine_vst_address),
						  .bcp_engine_vst_in(bcp_engine_vst_in),
						  .bcp_free_initial(bcp_free_initial),
						  .bcp_assignment_initial(bcp_assignment_initial),
                          .gen_bcp_free_reg(gen_bcp_free_reg),
                          .gen_bcp_assignment_reg(gen_bcp_assignment_reg),
                          .gen_bcp_force_assign_reg(gen_bcp_force_assign_reg)						  
						  );
						  

						  
    gen_bcp	gb1(          .sel(bcp_engine_data_mem_address),
	                      .clk(clk),
						  .rst(rst),
						  .bcp_engine_vst_out(bcp_engine_vst_out),
						  .mem_out(bcp_engine_clause_db_out),
						  .initial_data(bcp_engine_data_mem_out),
						  .w_en(w_en),						  
						  .rw_en(rw_en),
						  .sel_next(sel_next),
						  .initial_flag(initial_flag),
						  .conflict_analysis_en(conflict_analysis_en),	
                          .bcp_work_en(bcp_work_en),
                          .backtrack(backtrack),	
                          .bcp_request(bcp_request),						  
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
						  .check_unit_rewrite(check_unit_rewrite),
						  .bcp_free_initial(bcp_free_initial),
						  .bcp_assignment_initial(bcp_assignment_initial),
                          .free_reg(gen_bcp_free_reg),
                          .assignment_reg(gen_bcp_assignment_reg),
                          .force_assign_reg(gen_bcp_force_assign_reg)						  
						  );
						  
    initial_controller ic(.rst(rst),
	                      .initial_request(initial_request),
						  .clk(clk),
						  .address(bcp_engine_data_mem_address),
						  .initial_finish_flag(initial_finish_flag),
						  .bcp_engine_data_mem_en(bcp_engine_data_mem_en));
   endmodule