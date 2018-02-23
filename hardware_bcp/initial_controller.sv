`include "check_unit.sv"

`define mem_address_size 3
`define bcp_check_num 8

module bcp_controller(  input  logic clock,
						input  logic reset,
						input  logic system_initial_signal,		
						input  logic initial_mem,						
						output logic initial_finish,						
						
					);



	logic curr_state;
	logic next_state;


//----------------------------------------------------//					
	parameter idle                 = 1'b0;
	parameter initial_state        = 1'b1;
	
	
 // state reg
	always_ff@(posedge clock or negedge reset)
		if (!reset) curr_state <= idle;
		else        curr_state <= next_state;
		
		
     
 // next state logic    
	always_comb
	begin
		case (curr_state)
		idle             : if (system_initial_signal)	next_state = initial_state;
							 else    			    	next_state = idle;
							 
		initial_state   : if (initial_finish)			next_state = idle;
							 else    	 				next_state = initial_state;

		default :          								next_state = idle;
		endcase    
	end
	
	always_comb begin
		clause_type  =initial_mem[23:16];
		clause_mask  =initial_mem[15:8];
		clause_size  =initial_mem[7:0];
	end
	
	integer i;
 // output logic
	always_comb
	begin
		case (curr_state)
		idle    :
			begin
				bcp_controll_signal(0,0,2'b00,0,0,0,0);
			end
		initial_state:
			begin
				
				i<=i+1;
			end	
		default :
			begin
				bcp_controll_signal(0,0,2'b00,0,0,0,0);
			end	
		endcase		
	end


	
endmodule