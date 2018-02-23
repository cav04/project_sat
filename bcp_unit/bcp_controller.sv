//`define var_num 4
  module bcp_controller 
                       ( 
					     input logic clk,
						 input logic rst,
						 input logic initial_request,
						 input logic initial_finish_flag,
					     input logic bcp_request,
						 input logic bcp_finish_flag,
						 input logic unit_exist_bitwise_or,
						 input logic [`clause_num-1:0] unit_clause,
						 input logic [`var_num_log-1:0] next_var,
						 input logic conflict,
						 input logic [`var_num_log-1:0]pe_out,
						 input logic backreg,
						 input logic [`var_num_log-1:0]pe_out_back,
						 input logic [`var_num-1:0]bcp_engine_vst_out,
						 input logic [`var_num-1:0]gen_bcp_free_reg,
						 input logic [`var_num-1:0]gen_bcp_assignment_reg,
						 input logic [`var_num-1:0]gen_bcp_force_assign_reg,
//						 input logic [2:0] assign_var,
                         output logic mem_en,
						 output logic write,
						 output logic w_en,
                         output logic rw_en,
                         output logic sel_next,
                         output logic [`var_num_log-1:0]cdb_address,
                         output logic initial_flag,
                         output logic conflict_analysis_en,
                         output logic bcp_work_en,
                         output logic bcp_done,
                         output logic backtrack,
					     output logic check_unit_rewrite,
                         output logic initial_finish,
                         output logic [`var_num-1:0] gen_bcp_free,
                         output logic [`var_num-1:0] gen_bcp_assignment,
                         output logic [1:0]bcp_engine_vst_address,
                         output logic bcp_engine_vst_en,
                         output logic bcp_engine_vst_write,		
                         output logic bcp_engine_vst_bcp_write,						 
                         output logic [`var_num-1:0]bcp_engine_vst_in,							 
                         output logic bcp_free_initial,
                         output logic bcp_assignment_initial							 
                       );
					   
	logic [4:0] cur_state;	
    logic [4:0] next_state;
	
	logic implication_stack_not_empty;
	

	logic backtrack_finish;
	
//	logic bcp_done;

    logic initial_signal;  //test
	
	logic [`var_num-1:0]rewrite_free_reg;
	logic [`var_num-1:0]rewrite_assignment_reg;

	
	
	parameter idle                =5'd0;
	parameter initial_state       =5'd1;
	parameter read_free1          =5'd2;	
	parameter read_free2          =5'd3;
	parameter read_assignment1    =5'd4;
	parameter read_assignment2    =5'd5;	
	parameter read_cdb0           =5'd6;	
	parameter read_cdb            =5'd7;	
	parameter bcp_work            =5'd8;
	parameter bcp_work2           =5'd9;	
    parameter force_assign        =5'd10;	
    parameter stall2              =5'd11;		
	parameter conflict_analysis1  =5'd12;
	parameter conflict_analysis2  =5'd13;	
    parameter rewrite_fa          =5'd14;	
    parameter stall               =5'd15;
    parameter backtrack_state     =5'd16;
    parameter read_cdb_b          =5'd17;
    parameter check_unit_rw       =5'd18;
    parameter stall3              =5'd19;
    parameter stall4              =5'd20;
	parameter rewrite_free1       =5'd21;	
	parameter rewrite_free2       =5'd22;
	parameter rewrite_assignment1 =5'd23;
	parameter rewrite_assignment2 =5'd24;		
	parameter rewrite_force_assign1 =5'd25;
	parameter rewrite_force_assign2 =5'd26;	
	
	always_comb begin
	  if(rst)
	    initial_finish=0;
	  else 
	    initial_finish=initial_finish_flag;
	end  

	
	always_ff@(posedge clk or posedge rst) begin
	  if(rst) begin
        rewrite_free_reg<=`var_num'dz;
		rewrite_assignment_reg<=`var_num'dz;
	  end
      else begin
	    if((cur_state==stall)&&(!implication_stack_not_empty)&&((conflict==1'b0)))begin
          rewrite_free_reg<=gen_bcp_free_reg;
		  rewrite_assignment_reg<=gen_bcp_assignment_reg;		
		end
		else begin
          rewrite_free_reg<=rewrite_free_reg;
		  rewrite_assignment_reg<=rewrite_assignment_reg;
		end
	  end
	end
	
	
	
	always_ff@(posedge clk or posedge rst) begin
	  if(rst)
	    implication_stack_not_empty<=1'b0;	  
	  else if(cur_state==rewrite_fa)
	    implication_stack_not_empty<=|unit_clause;
      else
        implication_stack_not_empty<=implication_stack_not_empty;	  
	end
	
	always_ff@(posedge clk or posedge rst) begin
	  if(rst)
	    bcp_done  <=1'b0;
	  else begin
        if(cur_state==rewrite_assignment2)
	      bcp_done  <=1'b1;
	    else if((cur_state==stall4)&&(!backreg))
	      bcp_done  <=1'b1; 
        else 
	      bcp_done  <=1'b0;
      end		  
    end		
	
	
	

	

	always_ff@(posedge clk or posedge rst) begin
      if(rst)
	    cur_state  <=idle;
	  else
	    cur_state  <=next_state;    	  
    end	
	
	always_comb begin
	  case(cur_state)
	    idle:begin
		  if(initial_request)
		    next_state=initial_state;
		  else if(bcp_request)
		    next_state=read_free1;
   //      else if(unit_exist_bitwise_or)
//		    next_state=rewrite_fa;		 
		  else
		    next_state=idle;  
		end
		initial_state:begin
		  if(!initial_finish_flag)
		    next_state=initial_state;
		  else
		    next_state=idle;  
		end	
		read_free1: begin
		    next_state=read_free2;
        end
		read_free2: begin
		    next_state=read_assignment1;
        end			
		read_assignment1: begin
		    next_state=read_assignment2;	
        end			
		read_assignment2: begin
		    next_state=read_cdb0;		
        end			
		read_cdb0: begin
		    next_state=bcp_work;
		end			
		read_cdb: begin
		    next_state=bcp_work;
		end			
		bcp_work: begin
		    next_state=bcp_work2;	
		end	
		bcp_work2: begin
		    next_state=force_assign;	
		end			
	
		force_assign: begin
		    next_state=stall2;	  
		end		
		stall2: begin
		    next_state=conflict_analysis1;	  
		end	
		conflict_analysis1: begin
		    next_state=conflict_analysis2;
        end			
		conflict_analysis2: begin 
//		  if(implication_stack_not_empty)
		    next_state=rewrite_fa;		 
 //         else
  //          next_state=stall;		  
		end			
		rewrite_fa: begin
		    next_state=stall;			  
		end	
		stall: begin
		  if(conflict==1'b1)
		    next_state=backtrack_state;
		  else if(implication_stack_not_empty)
		    next_state=read_cdb;		
		  else 
		    next_state=rewrite_free1;	  
		end	
        backtrack_state: begin
		  next_state=read_cdb_b;
        end		
        read_cdb_b: begin
		  next_state=check_unit_rw;
        end		
		check_unit_rw: begin
		  next_state=stall3;
		end
		stall3: begin
		    next_state=stall4;	
		end	
		stall4: begin
		  if(backreg)
		    next_state=backtrack_state;
		  else 	
		    next_state=idle;	
		end	
        rewrite_free1:
            next_state=rewrite_free2;
        rewrite_free2:
            next_state=rewrite_assignment1;			
        rewrite_assignment1:
            next_state=rewrite_assignment2;
        rewrite_assignment2:
            next_state=rewrite_force_assign1;
        rewrite_force_assign1:
            next_state=rewrite_force_assign2;
        rewrite_force_assign2:	
            next_state=idle;		
      endcase		
	end
  
  
  

	
	always_comb begin
	  case(cur_state)
	    idle:begin
          mem_en         =1'b0;
	      write          =1'b0; 
	      w_en           =1'b0;  		  
	      rw_en          =1'b0;  	
          sel_next   	 =1'b0;
          cdb_address    =`var_num_log'bzz; 
          initial_flag   =1'b0;	
		  bcp_work_en    =1'b0;
          conflict_analysis_en=1'b0;	
          backtrack      =1'b0;	
          check_unit_rewrite=1'b0;		
          gen_bcp_free   =`var_num'dz;
          gen_bcp_assignment=`var_num'dz;
          bcp_engine_vst_address    =2'bzz;		
		  bcp_engine_vst_en =1'b0;
          bcp_engine_vst_write =1'b0;
          bcp_engine_vst_bcp_write=1'b0;		  
          bcp_engine_vst_in=`var_num'dz;		  
          bcp_free_initial =1'b0;	
          bcp_assignment_initial =1'b0;				  
		end
		initial_state:begin
          mem_en         =1'b0;
	      write          =1'b0; 
	      w_en           =1'b0;  		  
	      rw_en          =1'b0;  
          sel_next   	 =1'b0; 
          cdb_address    =`var_num_log'bzz;
          initial_flag   =1'b1;	
		  bcp_work_en    =1'b0;		  
          conflict_analysis_en=1'b0;	
          backtrack      =1'b0;	
          check_unit_rewrite=1'b0;	
          gen_bcp_free   =`var_num'dz;
          gen_bcp_assignment=`var_num'dz;	
          bcp_engine_vst_address    =2'bzz;
		  bcp_engine_vst_en =1'b0;
          bcp_engine_vst_write =1'b0;	
          bcp_engine_vst_bcp_write=1'b0;		  
          bcp_engine_vst_in=`var_num'dz;		  
          bcp_free_initial =1'b0;			  	
          bcp_assignment_initial =1'b0;				  
		end
		read_free1: begin
          mem_en         =1'b1;
	      write          =1'b0;
	      w_en           =1'b0;  		  
	      rw_en          =1'b0;  
          sel_next   	 =1'b0; 
          cdb_address    =`var_num_log'b00; 	
          initial_flag   =1'b0;
		  bcp_work_en    =1'b0;		  
          conflict_analysis_en=1'b0;
          backtrack      =1'b0;	
          check_unit_rewrite=1'b0;	
          gen_bcp_free   =`var_num'dz;
          gen_bcp_assignment=`var_num'dz;	
          bcp_engine_vst_address    =2'b00;	
		  bcp_engine_vst_en =1'b1;		  
          bcp_engine_vst_write =1'b0;	
          bcp_engine_vst_bcp_write=1'b0;		  
          bcp_engine_vst_in=`var_num'dz;		  
          bcp_free_initial =1'b0;			  
          bcp_assignment_initial =1'b0;				  
		end	
		read_free2: begin
          mem_en         =1'b1;
	      write          =1'b0;
	      w_en           =1'b0;  		  
	      rw_en          =1'b0;  
          sel_next   	 =1'b0; 
          cdb_address    =`var_num_log'b00; 	
          initial_flag   =1'b0;
		  bcp_work_en    =1'b0;		  
          conflict_analysis_en=1'b0;
          backtrack      =1'b0;	
          check_unit_rewrite=1'b0;	
          gen_bcp_free   =bcp_engine_vst_out;
          gen_bcp_assignment=`var_num'dz;	
          bcp_engine_vst_address    =2'bzz;	
		  bcp_engine_vst_en =1'b0;          
		  bcp_engine_vst_write =1'b0;
          bcp_engine_vst_bcp_write=1'b0;		  
          bcp_engine_vst_in=`var_num'dz;		  
          bcp_free_initial =1'b1;			  	
          bcp_assignment_initial =1'b0;				  
		end	
		read_assignment1: begin
          mem_en         =1'b1;
	      write          =1'b0;
	      w_en           =1'b0;  		  
	      rw_en          =1'b0;  
          sel_next   	 =1'b0; 
          cdb_address    =`var_num_log'b00; 	
          initial_flag   =1'b0;
		  bcp_work_en    =1'b0;		  
          conflict_analysis_en=1'b0;
          backtrack      =1'b0;	
          check_unit_rewrite=1'b0;	
          gen_bcp_free   =`var_num'dz;
          gen_bcp_assignment=`var_num'dz;	
          bcp_engine_vst_address    =2'b01;	
		  bcp_engine_vst_en =1'b1;		  
		  bcp_engine_vst_write =1'b0;	
          bcp_engine_vst_bcp_write=1'b0;		  
          bcp_engine_vst_in=`var_num'dz;		  
          bcp_free_initial =1'b0;		
          bcp_assignment_initial =1'b0;				  
		end	
		read_assignment2: begin
          mem_en         =1'b1;
	      write          =1'b0;
	      w_en           =1'b0;  		  
	      rw_en          =1'b0;  
          sel_next   	 =1'b0; 
          cdb_address    =`var_num_log'b00; 	
          initial_flag   =1'b0;
		  bcp_work_en    =1'b0;		  
          conflict_analysis_en=1'b0;
          backtrack      =1'b0;	
          check_unit_rewrite=1'b0;	
          gen_bcp_free   =`var_num'dz;
          gen_bcp_assignment=bcp_engine_vst_in;
          bcp_engine_vst_address    =2'bzz;
		  bcp_engine_vst_en =1'b0;		  
          bcp_engine_vst_write =1'b0;	
          bcp_engine_vst_bcp_write=1'b0;		  
          bcp_engine_vst_in=`var_num'dz;		  
          bcp_free_initial =1'b0;			  	
          bcp_assignment_initial =1'b1;				  
		end			
		read_cdb0: begin
          mem_en         =1'b1;
	      write          =1'b0;
	      w_en           =1'b0;  		  
	      rw_en          =1'b0;  
          sel_next   	 =1'b0; 
          cdb_address    =`var_num_log'b00; 	
          initial_flag   =1'b0;
		  bcp_work_en    =1'b0;		  
          conflict_analysis_en=1'b0;
          backtrack      =1'b0;	
          check_unit_rewrite=1'b0;		 
          gen_bcp_free   =`var_num'dz;
          gen_bcp_assignment=`var_num'dz;	
          bcp_engine_vst_address    =2'bzz;	
		  bcp_engine_vst_en =1'b0;		  
          bcp_engine_vst_write =1'b0;
          bcp_engine_vst_bcp_write=1'b0;		  
          bcp_engine_vst_in=`var_num'dz;		  
          bcp_free_initial =1'b0;			  		
          bcp_assignment_initial =1'b0;				  
		end		
		read_cdb: begin
          mem_en         =1'b1;
	      write          =1'b0;
	      w_en           =1'b0;  		  
	      rw_en          =1'b0;  
          sel_next   	 =1'b0; 
          cdb_address    =next_var; 
          initial_flag   =1'b0;
		  bcp_work_en    =1'b0;		  
          conflict_analysis_en=1'b0;
          backtrack      =1'b0;	
          check_unit_rewrite=1'b0;	
          gen_bcp_free   =`var_num'dz;
          gen_bcp_assignment=`var_num'dz;	
          bcp_engine_vst_address    =2'bzz;	
		  bcp_engine_vst_en =1'b0;		  
          bcp_engine_vst_write =1'b0;
          bcp_engine_vst_bcp_write=1'b0;		  
          bcp_engine_vst_in=`var_num'dz;		  
          bcp_free_initial =1'b0;			  		
          bcp_assignment_initial =1'b0;				  
		end
		bcp_work: begin
          mem_en         =1'b0;
	      write          =1'b0; 
	      w_en           =1'b0;  		  
	      rw_en          =1'b0; 
          sel_next   	 =1'b0;  
          cdb_address    =`var_num_log'bzz; 	
          initial_flag   =1'b0;		  
		  bcp_work_en    =1'b1;	
          conflict_analysis_en=1'b0;	
          backtrack      =1'b0;
          check_unit_rewrite=1'b0;		
          gen_bcp_free   =`var_num'dz;
          gen_bcp_assignment=`var_num'dz;	
          bcp_engine_vst_address    =2'bzz;	
		  bcp_engine_vst_en =1'b0;		  
          bcp_engine_vst_write =1'b0;	
          bcp_engine_vst_bcp_write=1'b0;		  
          bcp_engine_vst_in=`var_num'dz;		  
          bcp_free_initial =1'b0;			  	
          bcp_assignment_initial =1'b0;				  
		end	
		bcp_work2: begin
          mem_en         =1'b0;
	      write          =1'b0; 
	      w_en           =1'b0;  		  
	      rw_en          =1'b0; 
          sel_next   	 =1'b0;  
          cdb_address    =`var_num_log'bzz; 	
          initial_flag   =1'b0;		  
		  bcp_work_en    =1'b1;	
          conflict_analysis_en=1'b0;	
          backtrack      =1'b0;	
          check_unit_rewrite=1'b0;	
          gen_bcp_free   =`var_num'dz;
          gen_bcp_assignment=`var_num'dz;	
          bcp_engine_vst_address    =2'bzz;	
		  bcp_engine_vst_en =1'b0;		  
          bcp_engine_vst_write =1'b0;	
          bcp_engine_vst_bcp_write=1'b0;		  
          bcp_engine_vst_in=`var_num'dz;		  
          bcp_free_initial =1'b0;			  	
          bcp_assignment_initial =1'b0;				  
		end			
		
		force_assign: begin
          mem_en         =1'b0;
	      write          =1'b0; 
	      w_en           =1'b1;  		  
	      rw_en          =1'b0;  	
          sel_next   	 =1'b0; 
          cdb_address    =`var_num_log'bzz; 
          initial_flag   =1'b0;		  
          conflict_analysis_en=1'b0;	
          backtrack      =1'b0;	
          check_unit_rewrite=1'b0;
          gen_bcp_free   =`var_num'dz;
          gen_bcp_assignment=`var_num'dz;		
          bcp_engine_vst_address    =2'bzz;
		  bcp_engine_vst_en =1'b0;		  
          bcp_engine_vst_write =1'b0;	
          bcp_engine_vst_bcp_write=1'b0;		  
          bcp_engine_vst_in=`var_num'dz;		  
          bcp_free_initial =1'b0;			  
          bcp_assignment_initial =1'b0;				  
		end		
		stall2: begin
          mem_en         =1'b0;
	      write          =1'b0; 
	      w_en           =1'b0;  		  
	      rw_en          =1'b0; 
          sel_next   	 =1'b1;  
          cdb_address    =`var_num_log'bzz; 
          initial_flag   =1'b0;	
		  bcp_work_en    =1'b0;		  
          conflict_analysis_en=1'b0;	
          backtrack      =1'b0;	
          check_unit_rewrite=1'b0;	
          gen_bcp_free   =`var_num'dz;
          gen_bcp_assignment=`var_num'dz;	
          bcp_engine_vst_address    =2'bzz;	
		  bcp_engine_vst_en =1'b0;		  
          bcp_engine_vst_write =1'b0;	
          bcp_engine_vst_bcp_write=1'b0;		  
          bcp_engine_vst_in=`var_num'dz;		  
          bcp_free_initial =1'b0;			  	
          bcp_assignment_initial =1'b0;				  
		end	
		
		conflict_analysis1: begin
          mem_en         =1'b1;
	      write          =1'b0; 
	      w_en           =1'b0;  		  
	      rw_en          =1'b0; 
          sel_next   	 =1'b0;  
          cdb_address    =pe_out; 	
          initial_flag   =1'b0;
		  bcp_work_en    =1'b0;		  
          conflict_analysis_en=1'b1;	
          backtrack      =1'b0;	
          check_unit_rewrite=1'b0;
          gen_bcp_free   =`var_num'dz;
          gen_bcp_assignment=`var_num'dz;	
          bcp_engine_vst_address    =2'bzz;	
          bcp_engine_vst_write =1'b0;
          bcp_engine_vst_bcp_write=1'b0;		  
          bcp_engine_vst_in=`var_num'dz;		  
          bcp_free_initial =1'b0;			  	
          bcp_assignment_initial =1'b0;				  
		end	
		conflict_analysis2: begin
          mem_en         =1'b0;
	      write          =1'b0; 
	      w_en           =1'b0;  		  
	      rw_en          =1'b0; 
          sel_next   	 =1'b0;  
          cdb_address    =`var_num_log'bzz; 	
          initial_flag   =1'b0;
		  bcp_work_en    =1'b0;		  
          conflict_analysis_en=1'b1;		
          backtrack      =1'b0;	
          check_unit_rewrite=1'b0;
          gen_bcp_free   =`var_num'dz;
          gen_bcp_assignment=`var_num'dz;
          bcp_engine_vst_address    =2'bzz;	
		  bcp_engine_vst_en =1'b0;		  
          bcp_engine_vst_write =1'b0;	
          bcp_engine_vst_bcp_write=1'b0;		  
          bcp_engine_vst_in=`var_num'dz;		  
          bcp_free_initial =1'b0;			  	 
          bcp_assignment_initial =1'b0;				  
		end		
		
		rewrite_fa: begin
          mem_en         =1'b0;
	      write          =1'b0; 
	      w_en           =1'b0;  		  
	      rw_en          =1'b1;  
          sel_next   	 =1'b0; 
          cdb_address    =`var_num_log'bzz; 
          initial_flag   =1'b0;		
		  bcp_work_en    =1'b0;		  
          conflict_analysis_en=1'b0;	
          backtrack      =1'b0;	
          check_unit_rewrite=1'b0;	
          gen_bcp_free   =`var_num'dz;
          gen_bcp_assignment=`var_num'dz;		
          bcp_engine_vst_address    =2'bzz;
		  bcp_engine_vst_en =1'b0;		  
          bcp_engine_vst_write =1'b0;	
          bcp_engine_vst_bcp_write=1'b0;		  
          bcp_engine_vst_in=`var_num'dz;		  
          bcp_free_initial =1'b0;			  
          bcp_assignment_initial =1'b0;				  
		end	
		stall: begin
          mem_en         =1'b0;
	      write          =1'b0; 
	      w_en           =1'b0;  		  
	      rw_en          =1'b0;  
          sel_next   	 =1'b0; 
          cdb_address    =`var_num_log'bzz; 
          initial_flag   =1'b0;		  
		  bcp_work_en    =1'b0;		  
          conflict_analysis_en=1'b0;	
          backtrack      =1'b0;	
          check_unit_rewrite=1'b0;	
          gen_bcp_free   =`var_num'dz;
          gen_bcp_assignment=`var_num'dz;	
          bcp_engine_vst_address    =2'bzz;
		  bcp_engine_vst_en =1'b0;		  
          bcp_engine_vst_write =1'b0;		 
          bcp_engine_vst_bcp_write=1'b0;		  
          bcp_engine_vst_in=`var_num'dz;		  
          bcp_free_initial =1'b0;			  		
          bcp_assignment_initial =1'b0;				  
		end	
        backtrack_state: begin
          mem_en         =1'b0;
	      write          =1'b0; 
	      w_en           =1'b0;  		  
	      rw_en          =1'b0;  
          sel_next   	 =1'b0; 
          cdb_address    =`var_num_log'bzz; 
          initial_flag   =1'b0;		  
		  bcp_work_en    =1'b0;		  
          conflict_analysis_en=1'b0;	
          backtrack      =1'b0;	
          check_unit_rewrite=1'b0;
          gen_bcp_free   =`var_num'dz;
          gen_bcp_assignment=`var_num'dz;
          bcp_engine_vst_address    =2'bzz;		
		  bcp_engine_vst_en =1'b0;		  
          bcp_engine_vst_write =1'b0;	
          bcp_engine_vst_bcp_write=1'b0;		  
          bcp_engine_vst_in=`var_num'dz;		  
          bcp_free_initial =1'b0;			  
          bcp_assignment_initial =1'b0;				  
		end
        read_cdb_b: begin
          mem_en         =1'b1;
	      write          =1'b0; 
	      w_en           =1'b0;  		  
	      rw_en          =1'b0;  
          sel_next   	 =1'b0; 
          cdb_address    =pe_out_back; 
          initial_flag   =1'b0;		  
		  bcp_work_en    =1'b0;		  
          conflict_analysis_en=1'b0;	
          backtrack      =1'b0;	
          check_unit_rewrite=1'b0;		
          gen_bcp_free   =`var_num'dz;
          gen_bcp_assignment=`var_num'dz;	
          bcp_engine_vst_address    =2'bzz;
		  bcp_engine_vst_en =1'b0;		  
          bcp_engine_vst_write =1'b0;	
          bcp_engine_vst_bcp_write=1'b0;		  
          bcp_engine_vst_in=`var_num'dz;		  
          bcp_free_initial =1'b0;			  
          bcp_assignment_initial =1'b0;				  
		end	
        check_unit_rw: begin
          mem_en         =1'b0;
	      write          =1'b0; 
	      w_en           =1'b0;  		  
	      rw_en          =1'b0;  
          sel_next   	 =1'b0; 
          cdb_address    =`var_num_log'bzz; 
          initial_flag   =1'b0;		  
		  bcp_work_en    =1'b0;		  
          conflict_analysis_en=1'b0;	
          backtrack      =1'b0;	
          check_unit_rewrite=1'b1;		
          gen_bcp_free   =`var_num'dz;
          gen_bcp_assignment=`var_num'dz;
          bcp_engine_vst_address    =2'bzz;	
		  bcp_engine_vst_en =1'b0;		  
          bcp_engine_vst_write =1'b0;	
          bcp_engine_vst_bcp_write=1'b0;		  
          bcp_engine_vst_in=`var_num'dz;		  
          bcp_free_initial =1'b0;			  
          bcp_assignment_initial =1'b0;				  
		end	
        stall3: begin
          mem_en         =1'b0;
	      write          =1'b0; 
	      w_en           =1'b0;  		  
	      rw_en          =1'b0;  
          sel_next   	 =1'b0; 
          cdb_address    =`var_num_log'bzz; 
          initial_flag   =1'b0;		  
		  bcp_work_en    =1'b0;		  
          conflict_analysis_en=1'b0;	
          backtrack      =1'b1;	
          check_unit_rewrite=1'b0;	
		  gen_bcp_free   =`var_num'dz;
          gen_bcp_assignment=`var_num'dz;	
		  bcp_engine_vst_address    =2'bzz;
		  bcp_engine_vst_en =1'b0;		  
          bcp_engine_vst_write =1'b0;	
          bcp_engine_vst_bcp_write=1'b0;		  
          bcp_engine_vst_in=`var_num'dz;		  
          bcp_free_initial =1'b0;			  
          bcp_assignment_initial =1'b0;				  
		end  
        stall4: begin
          mem_en         =1'b0;
	      write          =1'b0; 
	      w_en           =1'b0;  		  
	      rw_en          =1'b0;  
          sel_next   	 =1'b0; 
          cdb_address    =`var_num_log'bzz; 
          initial_flag   =1'b0;		  
		  bcp_work_en    =1'b0;		  
          conflict_analysis_en=1'b0;	
          backtrack      =1'b0;	
          check_unit_rewrite=1'b0;	
          gen_bcp_free   =`var_num'dz;
          gen_bcp_assignment=`var_num'dz;		
          bcp_engine_vst_address    =2'bzz;	
		  bcp_engine_vst_en =1'b0;		  
          bcp_engine_vst_write =1'b0;
          bcp_engine_vst_bcp_write=1'b0;		  
          bcp_engine_vst_in=`var_num'dz;		  
          bcp_free_initial =1'b0;			  
          bcp_assignment_initial =1'b0;			  
		end		
		rewrite_free1: begin
          mem_en         =1'b1;
	      write          =1'b0;
	      w_en           =1'b0;  		  
	      rw_en          =1'b0;  
          sel_next   	 =1'b0; 
          cdb_address    =`var_num_log'b00; 	
          initial_flag   =1'b0;
		  bcp_work_en    =1'b0;		  
          conflict_analysis_en=1'b0;
          backtrack      =1'b0;	
          check_unit_rewrite=1'b0;	
          gen_bcp_free   =`var_num'dz;
          gen_bcp_assignment=`var_num'dz;	
          bcp_engine_vst_address    =2'b00;	
		  bcp_engine_vst_en =1'b1;		  
          bcp_engine_vst_write =1'b0;	
          bcp_engine_vst_bcp_write=1'b1;		  
          bcp_engine_vst_in=rewrite_free_reg;		  
          bcp_free_initial =1'b0;			  
          bcp_assignment_initial =1'b0;				  
		end	
		rewrite_free2: begin
          mem_en         =1'b1;
	      write          =1'b0;
	      w_en           =1'b0;  		  
	      rw_en          =1'b0;  
          sel_next   	 =1'b0; 
          cdb_address    =`var_num_log'b00; 	
          initial_flag   =1'b0;
		  bcp_work_en    =1'b0;		  
          conflict_analysis_en=1'b0;
          backtrack      =1'b0;	
          check_unit_rewrite=1'b0;	
          gen_bcp_free   =bcp_engine_vst_in;
          gen_bcp_assignment=`var_num'dz;	
          bcp_engine_vst_address    =2'bzz;	
		  bcp_engine_vst_en =1'b0;          
		  bcp_engine_vst_write =1'b0;	
          bcp_engine_vst_bcp_write=1'b0;		  
          bcp_engine_vst_in=`var_num'dz;		  
          bcp_free_initial =1'b1;			  	
          bcp_assignment_initial =1'b0;				  
		end	
		rewrite_assignment1: begin
          mem_en         =1'b1;
	      write          =1'b0;
	      w_en           =1'b0;  		  
	      rw_en          =1'b0;  
          sel_next   	 =1'b0; 
          cdb_address    =`var_num_log'b00; 	
          initial_flag   =1'b0;
		  bcp_work_en    =1'b0;		  
          conflict_analysis_en=1'b0;
          backtrack      =1'b0;	
          check_unit_rewrite=1'b0;	
          gen_bcp_free   =`var_num'dz;
          gen_bcp_assignment=`var_num'dz;	
          bcp_engine_vst_address    =2'b01;	
		  bcp_engine_vst_en =1'b1;		  
		  bcp_engine_vst_write =1'b0;	
          bcp_engine_vst_bcp_write=1'b1;		  
          bcp_engine_vst_in=rewrite_assignment_reg;		  
          bcp_free_initial =1'b0;		
          bcp_assignment_initial =1'b0;				  
		end	
		rewrite_assignment2: begin
          mem_en         =1'b1;
	      write          =1'b0;
	      w_en           =1'b0;  		  
	      rw_en          =1'b0;  
          sel_next   	 =1'b0; 
          cdb_address    =`var_num_log'b00; 	
          initial_flag   =1'b0;
		  bcp_work_en    =1'b0;		  
          conflict_analysis_en=1'b0;
          backtrack      =1'b0;	
          check_unit_rewrite=1'b0;	
          gen_bcp_free   =`var_num'dz;
          gen_bcp_assignment=`var_num'dz;	
          bcp_engine_vst_address    =2'bzz;
		  bcp_engine_vst_en =1'b0;		  
          bcp_engine_vst_write =1'b0;	
          bcp_engine_vst_bcp_write=1'b0;		  
          bcp_engine_vst_in=`var_num'dz;		  
          bcp_free_initial =1'b0;			  	
          bcp_assignment_initial =1'b1;				  
		end	
		rewrite_force_assign1: begin
          mem_en         =1'b1;
	      write          =1'b0;
	      w_en           =1'b0;  		  
	      rw_en          =1'b0;  
          sel_next   	 =1'b0; 
          cdb_address    =`var_num_log'b00; 	
          initial_flag   =1'b0;
		  bcp_work_en    =1'b0;		  
          conflict_analysis_en=1'b0;
          backtrack      =1'b0;	
          check_unit_rewrite=1'b0;	
          gen_bcp_free   =`var_num'dz;
          gen_bcp_assignment=`var_num'dz;	
          bcp_engine_vst_address    =2'b10;	
		  bcp_engine_vst_en =1'b1;		  
		  bcp_engine_vst_write =1'b0;	
          bcp_engine_vst_bcp_write=1'b1;		  
          bcp_engine_vst_in=gen_bcp_force_assign_reg;
          bcp_free_initial =1'b0;		
          bcp_assignment_initial =1'b0;				  
		end	
		rewrite_force_assign2: begin
          mem_en         =1'b1;
	      write          =1'b0;
	      w_en           =1'b0;  		  
	      rw_en          =1'b0;  
          sel_next   	 =1'b0; 
          cdb_address    =`var_num_log'b00; 	
          initial_flag   =1'b0;
		  bcp_work_en    =1'b0;		  
          conflict_analysis_en=1'b0;
          backtrack      =1'b0;	
          check_unit_rewrite=1'b0;	
          gen_bcp_free   =`var_num'dz;
          gen_bcp_assignment=`var_num'dz;	
          bcp_engine_vst_address    =2'bzz;
		  bcp_engine_vst_en =1'b0;		  
          bcp_engine_vst_write =1'b0;	
          bcp_engine_vst_bcp_write=1'b0;		  
          bcp_engine_vst_in=`var_num'dz;		  
          bcp_free_initial =1'b0;			  	
          bcp_assignment_initial =1'b1;				  
		end			
	  endcase
	end

  always_ff@(posedge clk or posedge rst) begin
    if(initial_request)
      	initial_signal<=1'b1;
	else	
      	initial_signal<=1'b0;  
  end
  

  
  
	
  endmodule