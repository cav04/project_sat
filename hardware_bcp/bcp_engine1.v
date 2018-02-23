`include "bcp_fifo.v"
`include "clausedb.v"

module bcp_engine(   clock
					,reset
					,bcp_engine_en
					,access_address
					,free
					,assignment
					,clause_mask
					,clause_size
					,clause_type
					,counter					
					,check_finish
					,bcp_initial
					);
	parameter var_num=8;
	parameter clause_num=8;
	input wire clock;
	input wire reset;
	input wire bcp_engine_en;
	input wire [var_num-1:0] access_address;
	input wire [var_num-1:0] free;
	input wire [var_num-1:0] assignment;
	input wire [var_num-1:0] clause_mask;
	input wire [var_num-1:0] clause_type;
	input wire [var_num-1:0] clause_size;
	input wire [var_num-1:0] counter;
	input wire bcp_initial;

	
	
	output reg  check_finish;



	reg [1:0] curr_state;
	reg [1:0] next_state;
	reg data_read;
	reg data_write;
	reg	[var_num-1:0]address;
	reg [clause_num-1:0] unit_exist;
	reg [clause_num-1:0] implication_reg;
	reg mem_request;



	wire [clause_num-1:0] clause_en;	
	wire [clause_num-1:0] unit_exist_wire;
	wire [clause_num-1:0] implication_reg_wire;
	wire [clause_num-1:0] bcp_is_work_wire;
	wire mem_work;
	
	reg [31:0] bcp_reg;


	reg fifo_write;
	reg fifo_read;
	wire [3:0] fifo_count;
	wire fifo_full;

	
/*	
	genvar c;
	generate 
		for(c=0;c<clause_num;c = c+1)
		begin : implication_wire
			reg [2:0] implication_wire1;
		end
	endgenerate
*/	
//-----------------------------------------------------------//

	genvar i;
	generate 
		for(i=0;i<clause_num-1;i = i+1)
		begin : label2
			bcp_fifo bcp_checker11(
						clock,
						reset,
						clause_en[i],
						free,
						assignment,
						clause_type,
						clause_mask,
						clause_size,
						counter,
						unit_exist_wire[i],
//						implication_wire[i],
						bcp_is_work_wire[i],
						bcp_initial);
		end
	endgenerate
	

	
/*	
		bcp_checker1 bcp_checker11(
						clock,
						reset,
						clause_en,
						free,
						assignment,
						clause_type,
						clause_mask,
						clause_size,
						counter,
						unit_exist_wire,
						implication_reg_wire,
						bcp_is_work_wire);	
						
*/						
						
//--------------------------------------------------------//
	clause_db clause_db1(	.clock(clock),
							.reset(reset),
							.mem_request(mem_request),
							.data_read(data_read),
							.data_write(data_write),
							//.d_in(temp_memory_data),
							.address(address),
							.d_out(clause_en),
							.mem_work(mem_work));
							
//--------------------------------------------------------//
/*
	reg fifo_write;
	reg fifo_read;
	wire [3:0] fifo_count;
	wire fifo_full;

	fifo fifo1(				.clock(clock),
							.reset(reset),
							.fifo_write(fifo_write),
							.fifo_read(fifo_read),
							.fifo_count(fifo_count),
							.fifo_full(fifo_full),
							.fifo_empty(fifo_empty),
							.fifo_datain(bcp_reg),
							.fifo_dataout(fifo_dataout));				
*/							
					
					
//----------------------------------------------------//		
/*  bcp_checker port
bcp_checker1(  clock
					,reset
					,en
					,free
					,assignment
					,clause_type
					,clause_mask
					,clause_size
					,counter
					,unit_exist
					,implication
					,bcp_finish);
*/

//----------------------------------------------------//					
	parameter idle        = 2'b00;
	parameter access_clause_data   = 2'b01;
	parameter bcp_check = 2'b10;
	parameter put_to_fifo = 2'b11;
	
	
	
 // state reg
	always@(posedge clock or negedge reset)
		if (!reset) curr_state <= idle;
		else        curr_state <= next_state;
		
		
     
 // next state logic    
	always@(*)
	begin
		case (curr_state)
		idle    : if (bcp_engine_en) next_state =access_clause_data;
				else     next_state = idle;
		access_clause_data: if (mem_work) next_state = bcp_check;	
				else     next_state = access_clause_data;
		bcp_check: if (bcp_is_work_wire[0]) next_state =put_to_fifo;
				else     next_state = bcp_check;
		put_to_fifo: if (1) next_state =idle;
				else     next_state = put_to_fifo;				
				
		default :          next_state = idle;
		endcase    
	end
	
	
	
	
	
 // output logic
	always@(*)
	begin
		case (curr_state)
		idle    :
			begin
				check_finish=1;
				
				bcp_reg=32'd0;

				mem_request=1'b1;
				data_read=0;
				data_write=0;
				address=8'd0;		

				fifo_read=0;
				fifo_write=0;

			end
		access_clause_data:
			begin
				check_finish=0;
				
				bcp_reg=32'd0;

				mem_request=0;
				data_read=1;
				data_write=0;
				address=access_address;				

				fifo_read=0;
				fifo_write=0;
			
			end
		bcp_check:
			begin
				check_finish=0;

				bcp_reg=unit_exist_wire;
				
				mem_request=1;
				data_read=0;
				data_write=0;
				address=8'd0;

				fifo_read=0;
				fifo_write=0;
	
				
			end	
		put_to_fifo:
			begin
				check_finish=0;
				
				mem_request=0;
				data_read=0;
				data_write=0;	
				address=8'd0;
				
				fifo_read=0;
				fifo_write=0;

				if(!fifo_full)
					fifo_write=1;
						
			end	
			
		default :
			begin
				address= 8'bzzzz_zzzz;
			end	
		endcase		
	end

/*	
initial
begin
#100
  $display("bcp_checker11.assignment=%b",bcp_checker11.assignment);  
end	
*/	
	
endmodule