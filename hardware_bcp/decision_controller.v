//`include "var_mem.v"
//`include "priority_encoder1.v"
module var_mem(data_read, data_write, mem_request
				, d_in, address, d_out,mem_work);

	input wire [7:0] in,
	input wire pe_request,
	input clock,
	output reg [2:0] out,
	output reg pe_work
	
	
module decision_engine(  clock
						,reset
						,decision_en
					//----------------mem-------------------------------//	
						,mem_grant
						,data_read
						,data_write
						,data
						,address
						,mem_request
					//-----------------pe---------------------------------//
						,pe_work
						,var_out
						,decision_finish
						,assignment);
						
	parameter var_num=8;
	parameter address_width=3;	
	input clock;
	input reset;
	input decision_en;
	output [var_num-1:0]var_out;
	output reg decision_finish;
	output reg assignment;
	
	
	reg [var_num-1:0] temp_memory_data;
	reg r_w;
	reg [1:0]address;
	
	wire [var_num-1:0]var_data;
	wire mem_work;
	wire pe_work;
	wire [2:0]assign_var_temp;	
	
	reg [var_num-1:0]var_out;	
	reg rewite_free_state_finish;
	reg mem_request;
	reg [2:0]assign_var;
	reg data_read;
	reg data_write;
	integer i,j;
	
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
	always@(posedge clock)
	begin
	  #1
		case (curr_state)
		idle    : if (decision_en) next_state =access_free_data;
				else     next_state = idle;
		access_free_data: if (mem_work) next_state = priority_encode;	
				else     next_state = access_free_data;
		priority_encode: if (pe_work) next_state =rewite_free_state;
				else     next_state = priority_encode;
		rewite_free_state: if (rewite_free_state_finish) next_state =idle;
				else     next_state = rewite_free_state;				
		default :          next_state = idle;
		endcase    
	end
	
	
	
//----------------------------- output logic------------------------------------------------------------------//
	always@(posedge clock)
	begin
	    #1
		case (curr_state)
		idle    :
			begin
				mem_request<=1;		
				data_read<=0;
				data_write<=0;				
			end
		access_free_data:
			begin
				 rewite_free_state_finish<=0;
				 decision_finish<=0;
				 mem_request<=0;
				 data_read<=1;
				 data_write<=0;
				 address<=2'b01;	
			end
		priority_encode:
			begin		
				 temp_memory_data<=var_data;	
				 assign_var<=assign_var_temp;
				 mem_request<=1;
				 assignment<=1'b0;
				 data_read<=0;
				 data_write<=0;				 
			end
		rewite_free_state:
			begin
				temp_memory_data[assign_var]<=1'b0;
				data_read<=0;
				data_write<=1;
				address<=2'b01;
				mem_request<=0;
				var_out<=assign_var;	
				rewite_free_state_finish<=1;
				decision_finish<=1;

			end			
			
		default :
			begin
				address<= 2'bzz;
				data_read<=0;
				data_write<=0;	
				mem_request<=1;				
			end	
		endcase		
	end
	
/*	
	always@(posedge clock)
	begin
		#1
		if(mem_work&&!mem_request)
			mem_request<=1'b1;
			
	end
*/	
endmodule