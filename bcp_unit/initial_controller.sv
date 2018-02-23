module initial_controller
				(
					input logic rst,
					input logic clk,
					input logic initial_request,
					output logic [`clause_num_log-1:0] address,
					output logic initial_finish_flag,
					output logic bcp_engine_data_mem_en
				);
	
	
	logic [1:0] curr_state;
	logic [1:0] next_state;
	
	parameter idle          =  2'b00;
	parameter initial_state1=  2'b01;
	parameter initial_state2=  2'b10;	
	
	logic [`clause_num_log-1:0] counter;
//	logic [`clause_num_log-1:0] counter_next;
	
	
  always_comb begin
    if(rst)
	  bcp_engine_data_mem_en=1'b0;
	else if((curr_state==initial_state1)||(curr_state==initial_state2))
	  bcp_engine_data_mem_en=1'b1;
	else  
	  bcp_engine_data_mem_en=1'b0;	  
  end	
	
	
  always_comb begin
    if(rst)
	  initial_finish_flag=1'b0;
	else if((curr_state==initial_state2)&&(address==`clause_num_log'd`clause_num-1))
	  initial_finish_flag=1'b1;
	else  
	  initial_finish_flag=1'b0;	  
  end  
	
	
  always_ff@(posedge clk or posedge rst) begin
    if(rst)
	  address<=`clause_num_log'd0;
	else if(curr_state==initial_state2)  
	  address<=address+1;
	else if((curr_state==initial_state2)&&(address==`clause_num_log'd`clause_num-1))
      address<=	`clause_num_log'd0;	  
  end  
	
  always_ff@(posedge clk or posedge rst) begin
    if(rst)
	  curr_state<=idle;
	else  
	  curr_state<=next_state;
  end  
  
	
  always_comb begin
    case(curr_state)
	  idle:begin
	    if(initial_request)
		  next_state=initial_state1;
		else  
		  next_state=idle;
	  end
	  initial_state1:begin
	    next_state=initial_state2;
	  end
	  initial_state2:begin
	    if((address==`clause_num_log'd`clause_num-1))
	      next_state=idle;
		else  
		  next_state=initial_state1;
	  end	  
    endcase
  end  
	

	
/*	
always @ (posedge clk or posedge rst)
begin
    if (clk)
        counter <= 3'd0;
    else if (counter==3'd7&&(curr_state==initial_state))
        counter <= 3'd0;
    else if(curr_state==initial_state)
        counter <= counter + 1;
	else
		counter <= counter ;
end
*/	
	
/*	
	//counter
	always @(posedge clock) begin  
		state <= state_next;   
		counter <= counter_next;
	end

//state
	always_comb begin
		if (counter  == 2'd10) 
			state_next = state+1'b1;
		else 
			state_next = state;
	end
//counter
	always_comb begin
		if (input  == 1'b1) 
			counter_next = counter+1'b1;
		else 
			counter_next = counter;	
	end
*/	
	
	
	
/*	
	initial begin
//	counter_next=3'd0;
//	counter=3'd0;
#10

	$display("rst=%b",rst);
	  $monitor("rst=%b",rst);
	  $monitor("counter=%b",counter);
//	  $display("counter=%b",counter);
	  $monitor("state=%b",state);
	  $monitor("address=%b",address);	  
	  
	  
	  
//	  $display("12315646546465465456465465465465");
//	  $display("12315646546465465456465465465465");	  


	end
*/	
	

   
   
   endmodule