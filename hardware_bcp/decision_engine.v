`include "var_mem.v"
`include "priority_encoder1.v"

module decision_engine(clock,reset,decision_en,var_out,decision_finish,assignment);
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
	reg pe_request;
	integer i,j;
	
	var_mem var_mem1(	    .clock(clock),
							.reset(reset),
							.mem_request(mem_request),
							.data_read(data_read),
							.data_write(data_write),
							.d_in(temp_memory_data),
							.address(address),
							.d_out(var_data),
							.mem_work(mem_work));

	priority_encoder pe(	.pe_request(pe_request),
							.clock(clock),
							.out(assign_var_temp),
							.in(var_data),
							.pe_work(pe_work)
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
	always@(curr_state)
	begin
	    #1
		case (curr_state)
		idle    :
			begin
				mem_request=1;		
				decision_finish=1;	
				data_read=0;
				data_write=0;
				pe_request=1;				
			end
		access_free_data:
			begin
				 rewite_free_state_finish=0;
				 decision_finish=0;
				 mem_request=0;
				 pe_request=1;
				 data_read=1;
				 data_write=0;
				 address=2'b01;	
			end
		priority_encode:
			begin		
				 temp_memory_data=var_data;	
				 assign_var=assign_var_temp;
				 decision_finish=0;
				 mem_request=1;
				 pe_request=0;
				 assignment=1'b0;
				 data_read=0;
				 data_write=0;				 
			end
		rewite_free_state:
			begin
				temp_memory_data[assign_var]=1'b0;
				data_read=0;
				data_write=1;
				decision_finish=0;
				pe_request=1;
				address=2'b01;
				mem_request=0;
				var_out=assign_var;	
				rewite_free_state_finish=1;
				

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