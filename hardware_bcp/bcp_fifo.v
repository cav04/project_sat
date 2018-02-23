`include "bcp_checker1.v"
`include "fifo.v"
`define var_num 8

module bcp__check_fifo( input wire clock,
		input wire reset,
		input en,	
		output bcp_is_work,
		output fifo_full,
		output fifo_empty,
		output [`var_num-1:0] fifo_dataout
		);
		reg [3:0] bcp_reg;
		wire unit_exist;
		wire [2:0]  encoded_implication;
		reg fifo_read;
		reg fifo_write;


	fifo fifo1(				.clock(clock),
							.reset(reset),
							.fifo_write(fifo_write),
							.fifo_read(fifo_read),
							.fifo_full(fifo_full),
							.fifo_empty(fifo_empty),
							.fifo_datain(bcp_reg),
							.fifo_dataout(fifo_dataout));		
							
	bcp_checker1 bcp_checker11(
							.clock(clock),
							.reset(reset),
							.en(en),
							.unit_exist(unit_exist),
							.encoded_implication(encoded_implication),
							.bcp_is_work(bcp_is_work));
							
							
							
	parameter idle        = 2'b00;
	parameter bcp_check   = 2'b01;
	parameter put_to_fifo = 2'b10;
	
	reg [1:0] curr_state;
	reg [1:0] next_state;
	
	

	
	
	
 // state reg
	always@(posedge clock or negedge reset)
		if (!reset) curr_state <= idle;
		else        curr_state <= next_state;
		
     
 // next state logic    
	always@(*)
	begin
		case (curr_state)
		idle    : if (en) next_state =bcp_check;
				else     next_state = idle;
		bcp_check: if (bcp_is_work) next_state =put_to_fifo;
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
				bcp_reg=4'd0;
				
				fifo_write=0;
				fifo_read=0;				
			end
		bcp_check:
			begin
				bcp_reg=4'd0;

				fifo_write=0;
				fifo_read=0;				

			end	
		put_to_fifo:
			begin
				bcp_reg={unit_exist,encoded_implication};	
				if(unit_exist)
					fifo_write=1;
				fifo_read=0;				
			end	
			
		default :
			begin
				bcp_reg=4'd0;	

				fifo_write=0;
				fifo_read=0;				
			end	
		endcase		
	end						
  endmodule							
								