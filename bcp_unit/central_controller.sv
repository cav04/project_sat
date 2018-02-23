
`define var_num 8
`define var_num_log 3
`define state_num 4

  module central_controller(
                      input logic clk,
					  input logic rst,
					  input logic [`var_num-1:0]decision_vst_in,
//-----------------------controll signal---------------------------------//						  
					  input logic sat_start,				  
					  input logic decide_done,  
					  input logic bcp_done,
					  input logic decide_next_var,  //bcp done and no conflict
					  input logic backtrack1,  //confict  backtrack 1
					  input logic backtrack2,	//confict  backtrack 2
                      input logic backtrack_done,
                      input logic initial_finish,	
                      output logic initial_request,	
					  output logic decide_request,	
                      output logic bcp_request,	
					  output logic sat_finish,
					  output logic sat,					  
//-------------------------vst port--------------------------------------//
                      input logic [`var_num-1:0] central_vst_out,						  
					  output logic central_vst_en,
					  output logic central_vst_write,
					  output logic central_vst_bcp_write,
					  output logic [2:0]central_vst_address,
					  output logic [`var_num_log-1:0]central_rewrite_free_bit,
					  output logic [`var_num-1:0]central_vst_in,					  
//--------------------------data_mem port--------------------------------------//					  
                      input  logic [`initial_data_size-1:0]central_data_mem_out,
					  output logic central_data_mem_en,
					  output logic central_data_mem_write,
					  output logic [`clause_num_log-1:0]central_data_mem_address,					  
//--------------------------clause_db port--------------------------------------//
                      input logic [`clause_num-1:0]central_clause_db_out,
//					  output logic [`clause_num-1:0]central_clause_db_in,
					  output logic [`var_num-1:0]central_clause_db_address,
					  output logic central_clause_db_write,
					  output logic central_clause_db_en,					  
//-------------------------decision engine port--------------------------------------//		
					  input logic decision_vst_en,
					  input logic decision_vst_write,
					  input logic [2:0]decision_vst_address,
					  input logic [`var_num_log-1:0]decision_rewrite_free_bit,			  
                      output logic [`var_num-1:0] decision_vst_out,	
//--------------------------bcp_engine_port------------------------------------//
					  input logic [`clause_num_log-1:0]bcp_engine_data_mem_address,
                      input logic bcp_engine_data_mem_en,
					  input logic bcp_engine_clause_db_en,
					  input logic bcp_engine_clause_db_write,
					  input logic [`var_num-1:0]bcp_engine_clause_db_address,	
					  input logic [1:0]bcp_engine_vst_address,
					  input logic bcp_engine_vst_write,
					  input logic bcp_engine_vst_bcp_write,
					  input logic bcp_engine_vst_en,
					  input logic [`var_num-1:0]bcp_engine_vst_in,
					  output logic [`var_num-1:0]bcp_engine_vst_out,
					  output logic [`clause_num-1:0]bcp_engine_clause_db_out,						  
//                      input logic bcp_engine_data_mem_write,
                      output logic [`initial_data_size-1:0]bcp_engine_data_mem_out         					  
					  );
			
    
			
  logic [`state_num-1:0] curr_state;
  logic [`state_num-1:0] next_state;
  
  
  parameter idle                   =`state_num'd0;
  parameter initial_state          =`state_num'd1;
  parameter decide_state           =`state_num'd2;
  parameter bcp_state              =`state_num'd3;
  parameter backtrack_state        =`state_num'd4;    



  
  always_ff@(posedge clk or posedge rst) begin
    if(rst) 
	  curr_state<=idle;
	else
      curr_state<=next_state;	  
  end
  
  
  always_comb begin
    case(curr_state)
	  idle:begin
        if(sat_start)	  
		  next_state=initial_state;
	    else if(decide_next_var)
		  next_state=decide_state;
		else if(backtrack1)
          next_state=backtrack_state;		
		else if(backtrack2)
          next_state=backtrack_state;
		else 	
		  next_state=idle;	
	  end
	  initial_state:begin
	    if(initial_finish)
		  next_state=decide_state;
		else  
	      next_state=initial_state;
	  end
	  decide_state:begin
	    if(decide_done)
		  next_state=bcp_state;
		else
          next_state=decide_state;		
	  end
	  bcp_state:begin
	    if(bcp_done)
          next_state=idle;
        else
          next_state=bcp_state;		
	  end
	  backtrack_state:begin
	    if(backtrack_done)
		  next_state=idle;
		else
          next_state=backtrack_state;		
	  end	  
	endcase  
  end 


  

        
  always_comb begin
    case(curr_state)
	  idle:begin
        //-----------------------controll signal---------------------------------//
		sat_finish                    =1'b0;
		sat                           =1'b0;  
		if(sat_start)
          initial_request             =1'b1;
        else		  
		  initial_request             =1'b0;		
		if(decide_next_var)
          decide_request              =1'b1;
        else		  
		  decide_request              =1'b0;
          bcp_request		          =1'b0;
        //-----------------------vst_port----------------------------------------//	  
		central_vst_en                =1'b0;  
		central_vst_write             =1'b0;
		central_vst_bcp_write         =1'b0;
		central_vst_address           =2'b00;
		central_rewrite_free_bit      =`var_num_log'd0;  
        central_vst_in                =`var_num'd0;	
        //-----------------------data_mem_port-----------------------------------//	  				
		central_data_mem_en           =1'b0;  
		central_data_mem_write        =1'b0;
		central_data_mem_address      =2'b00;
        //-----------------------clause_db_port----------------------------------------//	  
		central_clause_db_en          =1'b0;  
		central_clause_db_write       =1'b0;
		central_clause_db_address     =`var_num'dz;		
        //-----------------------decision_port-----------------------------------//		
        decision_vst_out              =`var_num'd0;	
        //-----------------------bcp_enigne_port---------------------------------//
        bcp_engine_data_mem_out       =`initial_data_size'd0;
		bcp_engine_clause_db_out      =`clause_num'dz;		
		bcp_engine_vst_out            =`var_num'dz;		
	  end
	  initial_state:begin
        //-----------------------controll signal---------------------------------//
		sat_finish                    =1'b0;
		sat                           =1'b0;    
	    initial_request               =1'b0;		
		if(initial_finish)
          decide_request              =1'b1;
        else		  
		  decide_request              =1'b0;	
          bcp_request		          =1'b0;		  
        //-----------------------vst_port----------------------------------------//	  
		central_vst_en                =1'b0;  
		central_vst_write             =1'b0;
		central_vst_bcp_write         =1'b0;		
		central_vst_address           =2'b00;
		central_rewrite_free_bit      =`var_num_log'd0;  
        central_vst_in                =`var_num'd0;	
        //-----------------------data_mem_port-----------------------------------//	  				
		central_data_mem_en           =bcp_engine_data_mem_en;  
		central_data_mem_write        =1'b0;
		central_data_mem_address      =bcp_engine_data_mem_address;
        //-----------------------clause_db_port----------------------------------------//	  
		central_clause_db_en          =1'b0;  
		central_clause_db_write       =1'b0;
		central_clause_db_address     =`var_num'dz;		
        //-----------------------decision_port-----------------------------------//		
        decision_vst_out              =`var_num'd0;	
        //-----------------------bcp_enigne_port---------------------------------//
        bcp_engine_data_mem_out       =central_data_mem_out;
		bcp_engine_clause_db_out      =`clause_num'dz;	
		bcp_engine_vst_out            =`var_num'dz;			
	  end	  
	  decide_state:begin
        //-----------------------controll signal---------------------------------//
		sat_finish                    =1'b0;
		sat                           =1'b0;    
	    initial_request               =1'b0;		
		decide_request                =1'b0;
        if(decide_done)		
          bcp_request		          =1'b1;
        else		  
		  bcp_request		          =1'b0;
        //-----------------------vst_port----------------------------------------//	  
		central_vst_en                =decision_vst_en;  
		central_vst_write             =decision_vst_write;
		central_vst_bcp_write         =1'b0;		
		central_vst_address           =decision_vst_address;
		central_rewrite_free_bit      =decision_rewrite_free_bit;  
        central_vst_in                =decision_vst_in;	
        //-----------------------data_mem_port-----------------------------------//	  				
		central_data_mem_en           =1'b0;  
		central_data_mem_write        =1'b0;
		central_data_mem_address      =2'b00;
        //-----------------------clause_db_port----------------------------------------//	  
		central_clause_db_en          =1'b0;  
		central_clause_db_write       =1'b0;
		central_clause_db_address     =`var_num'dz;		
        //-----------------------decision_port-----------------------------------//		
        decision_vst_out              =central_vst_out;	
        //-----------------------bcp_enigne_port---------------------------------//	
        bcp_engine_data_mem_out       =`initial_data_size'd0;			
		bcp_engine_clause_db_out      =`clause_num'dz;	
		bcp_engine_vst_out            =`var_num'dz;			
	  end
	  bcp_state:begin
        //-----------------------controll signal---------------------------------//
		sat_finish                    =1'b0;
		sat                           =1'b0;    
	    initial_request               =1'b0;		
		decide_request                =1'b0;	
        bcp_request		              =1'b0;		
        //-----------------------vst_port----------------------------------------//	  
		central_vst_en                =bcp_engine_vst_en;  
		central_vst_write             =bcp_engine_vst_write;
		central_vst_bcp_write         =bcp_engine_vst_bcp_write;
		central_vst_address           =bcp_engine_vst_address;
		central_rewrite_free_bit      =`var_num_log'd0;  
        central_vst_in                =bcp_engine_vst_in;
        //-----------------------data_mem_port-----------------------------------//	  				
		central_data_mem_en           =1'b0;  
		central_data_mem_write        =1'b0;
		central_data_mem_address      =2'b00;
        //-----------------------clause_db_port----------------------------------------//	  
		central_clause_db_en          =bcp_engine_clause_db_en;
		central_clause_db_write       =bcp_engine_clause_db_write;
		central_clause_db_address     =bcp_engine_clause_db_address;		
        //-----------------------decision_port-----------------------------------//		
        decision_vst_out              =`var_num'd0;	
        //-----------------------bcp_enigne_port---------------------------------//
        bcp_engine_data_mem_out       =`initial_data_size'd0;	
		bcp_engine_clause_db_out      =central_clause_db_out;
		bcp_engine_vst_out            =central_vst_out;
	  end
	  backtrack_state:begin
        //-----------------------controll signal---------------------------------//
		sat_finish                    =1'b0;
		sat                           =1'b0;    
	    initial_request               =1'b0;		
		decide_request                =1'b0;	
        bcp_request		              =1'b0;			
        //-----------------------vst_port----------------------------------------//	  
		central_vst_en                =1'b0;  
		central_vst_write             =1'b0;
		central_vst_bcp_write         =1'b0;		
		central_vst_address           =2'b00;
		central_rewrite_free_bit      =`var_num_log'd0;  
        central_vst_in                =`var_num'd0;	
        //-----------------------data_mem_port-----------------------------------//	  				
		central_data_mem_en           =1'b0;  
		central_data_mem_write        =1'b0;
		central_data_mem_address      =2'b00;
        //-----------------------clause_db_port----------------------------------------//	  
		central_clause_db_en          =1'b0;  
		central_clause_db_write       =1'b0;
		central_clause_db_address     =`var_num'dz;		
        //-----------------------decision_port-----------------------------------//		
        decision_vst_out              =`var_num'd0;	
        //-----------------------bcp_enigne_port---------------------------------//
        bcp_engine_data_mem_out       =`initial_data_size'd0;		
		bcp_engine_clause_db_out      =`clause_num'dz;	
		bcp_engine_vst_out            =`var_num'dz;			
	  end	  
    endcase	  
  end  
  
  
  
					  
  endmodule					  