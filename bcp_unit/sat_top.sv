


`include "decision_engine.sv"
`include "variable_state_table.sv"
`include "central_controller.sv"  
`include "bcp_top.sv"
`include "clause_db.sv"
`include "data_mem.sv"

 

module sat_top
				(
				input logic clk,
				input logic rst,
				input logic sat_start,
	            output logic sat,
				output logic sat_finish
				);
				

  logic vst_write; 
  logic decision_vst_en; 
  logic decision_vst_write;
  logic central_vst_write;
  logic [`var_num_log-1:0]decision_rewrite_free_bit;
  logic [`var_num_log-1:0]central_rewrite_free_bit;  
  logic [2:0] decision_vst_address;
  logic [2:0] central_vst_address;   
  logic [`var_num-1:0] decision_vst_out;
  logic [`var_num-1:0] central_vst_out;  
  logic [`var_num-1:0] decision_vst_in;
  logic [`var_num-1:0] central_vst_in;  
  logic central_vst_bcp_write;
  logic bcp_done;  
  logic decide_request;
  logic assign_var; 
  logic backtrack1;
  logic backtrack2; 
  
  logic [`initial_data_size-1:0] data_mem_out;                    
  logic [`initial_data_size-1:0] central_data_mem_out;                  
  logic [`initial_data_size-1:0] central_data_mem_in;
  logic [`clause_num_log-1:0] central_data_mem_address;
  logic central_data_mem_en;
  logic central_data_mem_write;
  logic [`initial_data_size-1:0] bcp_engine_data_mem_out;
  logic [`initial_data_size-1:0] bcp_engine_data_mem_in;
  logic [`clause_num_log-1:0] bcp_engine_data_mem_address;
  logic bcp_engine_data_mem_en;
  logic bcp_engine_data_mem_write;
  logic [`clause_num-1:0]bcp_engine_clause_db_out;
  logic bcp_engine_clause_db_write;
  logic bcp_engine_clause_db_en;
  logic [`var_num-1:0]bcp_engine_clause_db_address;
  logic [1:0]bcp_engine_vst_address;
  logic bcp_engine_vst_write;
  logic bcp_engine_vst_bcp_write;
  logic bcp_engine_vst_en;
  logic [`var_num-1:0]bcp_engine_vst_out;
  logic [`var_num-1:0]bcp_engine_vst_in;

  
  logic central_clause_db_write;
  logic [`var_num_log-1:0]central_clause_db_address;
  logic central_clause_db_en;
  logic [`clause_num-1:0]central_clause_db_in;
  logic [`clause_num-1:0]central_clause_db_out;
  
  
  
  
  
  
  
  
  logic decide_done;  
//  logic decide_next_var;
  
  
  variable_state_table vst1
               (  .clk(clk), 
                  .rst(rst),  
                  .vst_write(central_vst_write), 
				  .vst_bcp_write(central_vst_bcp_write),
                  .vst_en(central_vst_en), 
                  .vst_in(central_vst_in),
				  .rewrite_free_bit(central_rewrite_free_bit),
                  .vst_address(central_vst_address), 
                  .vst_out(central_vst_out)
				  );  
				  
 decision_engine decision_engine1(
                  .clk(clk),
				  .rst(rst),
				  .decide_request(decide_request),
				  .assign_var(assign_var),
				  .backtrack1(backtrack1),
				  .backtrack2(backtrack2),
				  .vst_out(decision_vst_out),		
				  .rewrite_free_bit(decision_rewrite_free_bit),
				  .vst_address(decision_vst_address),
				  .vst_en(decision_vst_en),
				  .vst_write(decision_vst_write),
				  .decide_done(decide_done)
					  );
				
  central_controller central_controller1(
                  .clk(clk),
				  .rst(rst),
//-----------------------controll signal---------------------------------//						  
				  .sat_start(sat_start),				  
				  .decide_done(decide_done),  
				  .bcp_done(bcp_done),
				  .decide_next_var(decide_next_var),  
				  .backtrack1(backtrack1), 
				  .backtrack2(backtrack2),	
                  .backtrack_done(backtrack_done),
				  .initial_finish(initial_finish),
				  .initial_request(initial_request),			  
//-----------------------vst_port----------------------------------------------//				  
				  .central_vst_en(central_vst_en),
				  .central_vst_write(central_vst_write),
				  .central_vst_bcp_write(central_vst_bcp_write),
				  .central_vst_address(central_vst_address),
				  .central_rewrite_free_bit(central_rewrite_free_bit),
                  .central_vst_in(central_vst_in),	
//--------------------------clause_db port--------------------------------------//
                  .central_clause_db_out(central_clause_db_out),
//					  output logic [`clause_num-1:0]central_clause_db_in,
				  .central_clause_db_address(central_clause_db_address),
				  .central_clause_db_write(central_clause_db_write),
				  .central_clause_db_en(central_clause_db_en),				  
//-------------------------decision port--------------------------------------//
				  .decision_vst_en(decision_vst_en),
				  .decision_vst_write(decision_vst_write),
				  .decision_vst_address(decision_vst_address),
				  .decision_rewrite_free_bit(decision_rewrite_free_bit),
				  .decision_vst_in(decision_vst_in),				  
				  .central_vst_out(central_vst_out),				  
				  .decide_request(decide_request),					  
                  .decision_vst_out(decision_vst_out),
//---------------------------data_mem_port------------------------------------------// 
                  .central_data_mem_out(central_data_mem_out),  //in
//                  .central_data_mem_in(central_data_mem_in),  //out 
                  .central_data_mem_address(central_data_mem_address),  //out
                  .central_data_mem_en(central_data_mem_en),//out
                  .central_data_mem_write(central_data_mem_write),//out
//---------------------------bcp_engine_port--------------------------------------------//
                  .bcp_engine_data_mem_out(bcp_engine_data_mem_out),//out
//                  .bcp_engine_data_mem_in(bcp_engine_data_mem_in),  //in
                  .bcp_engine_data_mem_address(bcp_engine_data_mem_address),  //in
                  .bcp_engine_data_mem_en(bcp_engine_data_mem_en),  //in
				  .bcp_engine_clause_db_write(bcp_engine_clause_db_write),
				  .bcp_engine_clause_db_en(bcp_engine_clause_db_en),
				  .bcp_engine_clause_db_address(bcp_engine_clause_db_address),
				  .bcp_engine_clause_db_out(bcp_engine_clause_db_out),
                  .bcp_request(bcp_request),
				  .bcp_engine_vst_address(bcp_engine_vst_address),
                  .bcp_engine_vst_write(bcp_engine_vst_write),
				  .bcp_engine_vst_bcp_write(bcp_engine_vst_bcp_write),
                  .bcp_engine_vst_en(bcp_engine_vst_en),
                  .bcp_engine_vst_out(bcp_engine_vst_out),
				  .bcp_engine_vst_in(bcp_engine_vst_in)
					  );		
					  
	clause_db cdb(  
	              .clk(clk),
	              .rst(rst),
				  .clause_db_write(central_clause_db_write),
				  .clause_db_en(central_clause_db_en),
//				  .clause_db_in(central_clause_db_in),
				  .clause_db_address(central_clause_db_address),
				  .clause_db_out(central_clause_db_out)
				  );


	data_mem mm1(   
 	              .clk(clk),
				  .rst(rst),					
				  .data_mem_address(central_data_mem_address),
				  .data_mem_in(central_data_mem_in),
				  .data_mem_en(central_data_mem_en),
				  .data_mem_write(central_data_mem_write),
				  .data_mem_out(central_data_mem_out)
					);				

    bcp_top bcp_top1
				(
				  .clk(clk),
				  .rst(rst),
				  .initial_request(initial_request),	
                  .initial_finish(initial_finish),				  
	              .bcp_request(bcp_request),
				  .bcp_finish_flag(bcp_finish_flag),
                  .bcp_engine_data_mem_out(bcp_engine_data_mem_out),
//                  .bcp_engine_data_mem_in(bcp_engine_data_mem_in),
                  .bcp_engine_data_mem_address(bcp_engine_data_mem_address),
                  .bcp_engine_data_mem_en(bcp_engine_data_mem_en),
				  .bcp_engine_clause_db_write(bcp_engine_clause_db_write),
				  .bcp_engine_clause_db_en(bcp_engine_clause_db_en),
				  .bcp_engine_clause_db_address(bcp_engine_clause_db_address),
				  .bcp_engine_clause_db_out(bcp_engine_clause_db_out),
//                  .bcp_engine_data_mem_write(bcp_engine_data_mem_write)
				  .bcp_engine_vst_address(bcp_engine_vst_address),
                  .bcp_engine_vst_write(bcp_engine_vst_write),
                  .bcp_engine_vst_bcp_write(bcp_engine_vst_bcp_write),				  
                  .bcp_engine_vst_en(bcp_engine_vst_en),
                  .bcp_engine_vst_out(bcp_engine_vst_out),
				  .bcp_engine_vst_in(bcp_engine_vst_in)
				);
				
				

   endmodule