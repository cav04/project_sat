`include "var_table.sv"
`include "priority_encoder1.sv"
`define var_num 8
`define address_width 3

module decision_engine(
						input logic clock,
						input logic reset,
						input logic decision_en,
						input logic back_sign,
						output logic [`var_num-1:0] var_out,
						output logic [`var_num-1:0] decision_finish,
						output logic assignment);

	logic [`var_num-1:0] temp_memory_data;
	logic r_w;
	logic [1:0]address;
	

	logic mem_work;
	logic pe_work;
	
	
	logic rewite_free_state_finish;
	logic pe_finish;
	logic [`var_num-1:0]pe_in;		
	logic mem_request;
	logic [2:0] pe_out;
	logic data_read;
	logic data_write;
	logic pe_request;
	logic [7:0] mem_out;
	
	integer i,j;
	
	var_table var_table(	.clock(clock),
							.reset(reset),
							.enable(mem_request),
							.write(data_write),
							.read(data_read),
							.data_in(temp_memory_data),
							.data_address(address),
							.data_out(mem_out),
							.mem_work(mem_work));

	priority_encoder pe(	.out(pe_out),
							.in(pe_in),
							.pe_request(pe_request),
							.pe_work(pe_work),
							.clock(clock)
							);

	parameter idle        = 2'b00;
	parameter access_free_data   = 2'b01;
	parameter priority_encode = 2'b10;
	parameter rewite_free_state = 2'b11;

	reg [1:0] curr_state;	
	reg [1:0] next_state;
	

 
//---------------------------- state reg-------------------------------------------------------------------//
	always@(posedge clock or negedge reset)
		if (!reset) curr_state <= idle;
		else        curr_state <= next_state;
		
		
     
//-------------------------- next state logic  -------------------------------------------------------------//  
	always@(curr_state)
	begin
		case (curr_state)
		idle    : if (decision_en) next_state =access_free_data;
				else     next_state = idle;
		access_free_data: if (mem_work) next_state = priority_encode;	
				else     next_state = access_free_data;
		priority_encode: if (pe_work) next_state =rewite_free_state;
				else     next_state = priority_encode;
		rewite_free_state: if (mem_work) next_state =idle;
				else     next_state = rewite_free_state;				
		default :          next_state = idle;
		endcase    
	end
	
	
	
//----------------------------- output logic------------------------------------------------------------------//
	always_ff@(posedge clock)
	begin
		case (next_state)
		idle    :
			begin
//------------------state_sign
//				pe_finish                <=0;
//				rewite_free_state_finish <=0;	
//-------------------pe
				pe_request               <=0;				
//--------------------mem		
				temp_memory_data         <=0;
				mem_request              <=0;		
				data_read                <=0;
				data_write               <=0;
				address                  <=2'b00;	
//--------------------output				
				decision_finish          <=1;		
			end
		
		
		access_free_data:
			begin
//------------------state_sign	
//				 pe_finish                <=0;		
//				 rewite_free_state_finish <=0;	
//-------------------pe
				 pe_request               <=0;		
//--------------------mem	
				 temp_memory_data         <=8'd0;
				 mem_request              <=1;
				 data_write               <=0;
				 data_read                <=0;					 
				 address                  <=2'b01;	
//--------------------output				
				decision_finish           <=0;		  			 
			end
			
			
		priority_encode:
			begin	
//------------------state_sign
//				 pe_finish                <=1;		
//				 rewite_free_state_finish <=0;
//-------------------pe
				 pe_request               <=1;					 
				 pe_in                    <=mem_out ;
				 var_out                  <=pe_out;		
//---------------------mem				 
				 mem_request              <=0;
				 data_read                <=0;
				 data_write               <=0;	
				 address                  <=2'b00;	
				 temp_memory_data[pe_out] <=1'b0;				 
//--------------------output
				 decision_finish          <=1;				 
			end
			
			
		rewite_free_state:
			begin
//------------------state_sign
//				pe_finish                    <=0;				
//				rewite_free_state_finish     <=1;
//-------------------pe
				 pe_request                  <=0;					 
				 pe_in                     	 <=8'd0 ;
//---------------------mem				
				mem_request                  <=0;
				data_write                   <=1;
				data_read                    <=0;				
				address                      <=2'b01;
//--------------------output				
				decision_finish              <=0;

			end

			
		default :
			begin
//------------------state_sign	
				pe_finish                    <=0;		
				temp_memory_data[pe_out]     <=1'b0;
				rewite_free_state_finish     <=1;
//-------------------pe
				 pe_request                  <=0;				
//---------------------mem				
				mem_request                  <=0;
				data_write                   <=0;
				data_read                    <=0;				
				address                      <=2'b00;
//--------------------output				
				decision_finish              <=0;			
			end	
		endcase		
	end

endmodule