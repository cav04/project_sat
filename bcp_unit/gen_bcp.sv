`include "register8.sv"
`include "decoder_8_to_1.sv"
`include "bcp_checker1.sv"
`include "unit_clause_reg.sv"
//`include "gen_pe.sv"
`include "priority_encoder_clause.sv"
`include "conflict_analyzer.sv"


module gen_bcp (
				    input logic [`clause_num_log-1:0] sel,
				    input logic clk,
					input logic rst,
					input logic [`clause_num-1:0]mem_out,
					input logic [`var_num-1:0] bcp_engine_vst_out,
					input logic [`initial_data_size-1:0]initial_data,
					input logic w_en,
					input logic rw_en,
					input logic sel_next,
					input logic initial_flag,
					input logic conflict_analysis_en,
					input logic bcp_work_en,
					input logic backtrack,
					input logic check_unit_rewrite,
					input logic bcp_request,
					output logic [`clause_num_log-1:0]pe_out,
					output logic [`clause_num-1:0] unit_exist,
					output logic [`clause_num-1:0] unit_clause,
                    output logic [`var_num_log-1:0] next_var,
//                    output logic next_assignment,					
					output logic bcp_finish_flag,
					output logic conflict,
					output logic [`clause_num_log-1:0]pe_out_back,
					output logic backreg,
					input logic bcp_free_initial,
					input logic bcp_assignment_initial
                    output logic [`var_num-1:0] assignment_reg,
                    output logic [`var_num-1:0] free_reg,
					output logic [`var_num-1:0] force_assign_reg
				);


//   logic [7:0] initial_bcp;
   
   logic [`var_num-1:0] flag;
   logic [`var_num-1:0] assign_value;
   
//   logic [`var_num-1:0] assignment_reg;
//   logic [`var_num-1:0] free_reg;
   logic [`var_num-1:0] free_back_rag;
   
   
//   logic [1:0] pe_out;
   logic next_assignment;
   
   logic [`clause_num-1:0] de_out;
   logic [`var_num-1:0] initial_bcp;   

  
   logic [`clause_num-1:0] bcp_lock;
   logic [`clause_num-1:0] bcp_lock_n;   
   logic [`clause_num-1:0] bcp_en;
   logic [`clause_num-1:0] b_en;   
   
	logic [`clause_num-1:0] conflict_reg;   
	
	logic [`clause_num-1:0] backtrack_en;
	logic backtrack_rw_en;
	
	
	logic [`clause_num-1:0] conflict_reg1;
	logic [`clause_num-1:0] conflict_reg1_n;	
	
//	logic [`clause_num-1:0]force_assign_reg;
	
	
	logic [`clause_num-1:0] back_reg;
    
	logic [`clause_num_log-1:0]de_in;  //sel delay 1	
	
  always_ff@(posedge clk or posedge rst) begin
    de_in<=sel;
  end		
	
	
  always_ff@(posedge clk or posedge rst) begin
    if(rst)
	  force_assign_reg<=`clause_num'd0;
	else if(bcp_request)
	  force_assign_reg<=`clause_num'd0;      	
	else if(rw_en&&(|unit_clause==1'b1)) 
      force_assign_reg[next_var]<=1'b1;
	else  
	  force_assign_reg<=force_assign_reg;
  end	
	
   
   
  always_ff@(posedge clk or posedge rst) begin
    if(rst)begin
	  b_en<=1'b0;
	end
	else begin
      if(bcp_work_en)
	    b_en<=mem_out;
	  else  
        b_en<=b_en;
	end	
  end
  
  always_ff@(posedge clk or posedge rst) begin
    if(check_unit_rewrite)
	  backtrack_en<=mem_out;
	else  
      backtrack_en<=`var_num'bzzzz;
  end  
/*  
  always_comb begin
	  backreg<=|free_back_rag;
  end  
*/  
  always_ff@(posedge clk or posedge rst) begin
	  conflict_reg1<=conflict_reg;
  end   
  
  always_comb begin
    conflict_reg1_n = ~conflict_reg1;
  end	  
   
  always_comb begin
    if(conflict_analysis_en)
      conflict_reg = mem_out & unit_clause;
	else
      conflict_reg =`var_num'bzzzz;	
  end	   
   
  always_comb begin
    bcp_lock_n=~bcp_lock;
    bcp_en=(b_en&bcp_lock_n);

  end  
  
  
  
  logic conflict_signal;
   
   
  

  logic [`var_num_log-1:0] encoded_implication_reg [`clause_num-1:0];
  genvar j;
  generate 
    for(j=0;j<`clause_num;j=j+1)begin :bcp_instance
	  bcp_checker1 b1( .clk(clk),
	                   .rst(rst),
					   .en(bcp_en[j]),
					   .free(free_reg),
					   .assignment(assignment_reg),
					   .initial_data(initial_data),
					   .bcp_initial(initial_bcp[j]),
					   .backtrack_en(backtrack_en[j]),
//----------------------------output---------------------------------------------------------//					   
					   .unit_exist(unit_exist[j]),
					   .encoded_implication(encoded_implication_reg[j]),
					   .assign_value(assign_value[j]),
					   .flag(flag[j])
					   );
	end  
  endgenerate	  
  
  always@(posedge clk or posedge rst) begin
    if(rst)begin
	    next_var         <=   `var_num_log'dz;
        next_assignment  <=   1'b0;	  
	end
	else begin
      if(sel_next) begin
	    next_var         <=   encoded_implication_reg[pe_out];
        next_assignment  <=   assign_value[pe_out];
      end
      else begin
	    next_var         <=   next_var;
        next_assignment  <=   next_assignment;
      end	
	end
  end
  
   always_comb begin
     if(initial_flag)
       initial_bcp=de_out;
	 else
	   initial_bcp=`var_num'd0;
   end
  	 	  
   decoder_8_to_1   de8(.de_in(de_in),.de_out(de_out));
  
/*
  gen_pe gp(
			.pe_in(unit_clause),
			.pe_out(pe_out)
			);
			
  gen_pe gpb(
			.pe_in(back_reg),
			.pe_out(pe_out_back)
			);		
*/
  priority_encoder_clause pec1(
			.pe_in(unit_clause),
			.pe_out(pe_out)
  );
  priority_encoder_clause pecb(
			.pe_in(back_reg),
			.pe_out(pe_out_back)
			);


		
			
			
 unit_clause_reg ucr
			(
			.unit_clause(unit_clause),  //output
			.w_en(w_en),
			.rw_en(rw_en),
			.wd(unit_exist),
//			.delete_var(pe_out),
			.delete_unit(conflict_reg1_n),
			.clk(clk)		
			); 
			
  logic conflict1;	
  conflict_analyzer ca1(.mask(conflict_reg),
                        .assignment(assign_value),
						.en(conflict_analysis_en),
						.conflict(conflict_signal)
  
  )	;	
  
  always@(posedge clk or posedge rst) begin
    if(rst)
	  conflict<=0;
	else if(conflict_signal)
	  conflict<=1;
	else if(bcp_finish_flag)
      conflict<=0;
    else 
      conflict<=conflict;	

  end  

  
  
   
   
  always_comb begin
    if(&flag==1)
	  bcp_finish_flag=1'b1;
    else
      bcp_finish_flag=1'b0; 
  end
  
  
  
  always@(posedge clk or posedge rst) begin
    if(rst) begin
	  assignment_reg  <=`var_num'd0;
      free_reg        <=`var_num'd0;
//	  free_back_rag   <=free;
	  bcp_lock        <=`clause_num'd0;
	  back_reg        <=`clause_num'd0;
	end  
	else if(bcp_free_initial)begin
	  assignment_reg  <=assignment_reg;
      free_reg        <=bcp_engine_vst_out;
	  bcp_lock        <=bcp_lock;	  
	  back_reg        <=back_reg;	
	end
	else if(bcp_assignment_initial)begin
	  assignment_reg  <=bcp_engine_vst_out;
      free_reg        <=free_reg;
	  bcp_lock        <=`clause_num'd0;	  
	  back_reg        <=back_reg;		
	end
	else if(rw_en) begin
	  if(|unit_clause==1'b1)begin
	    assignment_reg[next_var]     <=next_assignment;
        free_reg[next_var]           <=1'b0;	
	    bcp_lock[pe_out]             <=1'b1;
	    back_reg[next_var]           <=1'b1;
	  end
      else begin
	  assignment_reg  <=assignment_reg;
      free_reg        <=free_reg;
	  bcp_lock        <=bcp_lock;	  
	  back_reg        <=back_reg;		  
      end	  
	end
//	else if(backtrack_rw_en) begin
//	  free_back_rag[next_var]      <=1'b0;	
//	end

    else if(backtrack) begin
	  back_reg[pe_out_back]        <=1'b0;
	  assignment_reg               <=assignment_reg;
      free_reg                     <=free_reg;
	  bcp_lock                     <=bcp_lock;		
	end
    else begin
	  assignment_reg  <=assignment_reg;
      free_reg        <=free_reg;
	  bcp_lock        <=bcp_lock;	  
	  back_reg        <=back_reg;
	end  
  end 


    always_comb begin
	  backreg<=|back_reg;
    end 

  
   endmodule