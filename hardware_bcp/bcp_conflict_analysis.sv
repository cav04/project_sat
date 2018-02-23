`define mem_address_size 3
`define bcp_check_num 8

module bcp_conflict_analysis(   input  logic clock,
								input  logic reset,
								input  logic system_initial_signal,
								input  logic initial_finish,						
								input  logic bcp_request,
								input  logic [`bcp_check_num-1:0] bcp_finish,
								input  logic mem_finish,

								input  logic conflict,
								input  logic select_var_finish,						
								output  logic initial_request,
								output  logic mem_request,
								output  logic [`mem_address_size-1:0]mem_address,
								output  logic mem_write,
								output  logic mem_read,
								output  logic conflict_analysis_request,
								output  logic select_var_request
					);



	logic [2:0] curr_state;
	logic [2:0] next_state;


//----------------------------------------------------//					
	parameter idle                 = 3'b000;
	parameter access_mem           = 3'b001;
	parameter bcp_check            = 3'b010;
	parameter conflict_analysis    = 3'b011;
	parameter select_var           = 3'b100;
	
	parameter initial_state        = 3'b111;
	
	
 // state reg
	always_ff@(posedge clock or negedge reset)
		if (!reset) curr_state <= idle;
		else        curr_state <= next_state;
		
		
     
 // next state logic    
	always_comb
	begin
		case (curr_state)
		idle             : if (bcp_request)				next_state = access_mem;
							 else if(system_initial_signal)   next_state = initial_state;
							 else    			    	next_state = idle;
							 
		access_mem       : if (mem_finish)				next_state = bcp_check;	
							 else    	    			next_state = access_mem;
							 
		bcp_check        : if (bcp_finish) 				next_state = conflict_analysis;
							 else    	 				next_state = bcp_check;

		conflict_analysis: if (conflict) 				next_state = idle;
							 else if(!conflict)			next_state = select_var;
							 else    	 				next_state = conflict_analysis;
							 
		select_var       : if (select_var_finish) 		next_state = idle;
							 else    	 				next_state = select_var;
							 
		initial_state   : if (initial_finish)			next_state = idle;
							 else    	 				next_state = initial_state;

		default :          								next_state = idle;
		endcase    
	end
	
	
 // output logic
	always_comb
	begin
		case (curr_state)
		idle    :
			begin
				bcp_controll_signal(0,0,2'b00,0,0,0,0);
			end
		access_mem:
			begin
				bcp_controll_signal(0,1,2'b01,0,1,0,0);		
			end
		bcp_check:
			begin
				bcp_controll_signal(0,0,2'b00,0,0,0,0);
			end	
		conflict_analysis:
			begin
				bcp_controll_signal(0,0,2'b00,0,0,1,0);
			end	
		select_var:
			begin
				bcp_controll_signal(0,0,2'b00,0,0,0,1);	
			end	
		initial_state:
			begin
				bcp_controll_signal(1,0,2'b00,0,0,0,0);	
			end	
		default :
			begin
				bcp_controll_signal(0,0,2'b00,0,0,0,0);
			end	
		endcase		
	end

	task bcp_controll_signal;
		input  initial_request_task;
		input  mem_request_task;
		input  [1:0] mem_address_task;
		input  mem_write_task;
		input  mem_read_task;
		input  conflict_analysis_request_task;
		input  select_var_request_task;
			begin
				initial_request=initial_request_task;
				mem_request=mem_request_task;
				mem_address=mem_address_task;
				mem_write=mem_write_task;
				mem_read=mem_read_task;
				conflict_analysis_request=conflict_analysis_request_task;
				select_var_request=select_var_request_task;
			end
	endtask
	
endmodule