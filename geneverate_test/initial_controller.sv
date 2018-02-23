module initial_controller #(w=8)
				(
					input logic rst,
					input logic clk,
					input logic initial_sign,
					output logic [2:0] address
				);
	logic state;	
	
	logic curr_state;
	logic next_state;
	
	parameter idle=1'b0;
	parameter initial_state=1'b1;
	
	logic [2:0] counter;
	logic [2:0] counter_next;
/*	
	always_ff@(posedge clk or posedge rst) begin
		if(rst) begin

			curr_state<=idle;
		end	
		else		
			curr_state<=next_state;

	end
	
	always_comb begin
	  case(curr_state)
		idle:
			if(initial_sign)
				next_state=idle;
			else	
				next_state=initial_state;
		initial_state:
			if(counter!=3'd7)
				next_state=initial_state;
			else
				next_state=idle;

	  endcase	
	end	
*/	
	always_ff@(posedge clk or posedge rst) begin
	  if(rst) begin
		state<=idle;
		counter<=8'd0;
	  end
	  else
		case(state)
		  idle:		  begin
			if(initial_sign)
				state<=initial_state;
			else
				state<=idle;
		  
		  end
		initial_state:		 
		  if(counter<3'd7) begin
			state<=initial_state;
			counter<=counter+1;
	//	    address<=counter;
		  end
		  else begin	
			state<=idle;
			counter<=0;
		  end
	  endcase	
	end
	
	always_comb begin
	  address=counter;	
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
	
	
	
	
	initial begin
//	counter_next=3'd0;
//	counter=3'd0;

/*
	$display("rst=%b",rst);
	  $monitor("rst=%b",rst);
	  $monitor("counter=%b",counter);
	  $display("counter=%b",counter);
	  $monitor("curr_state=%b",curr_state);
*/	  
	  
	  
//	  $display("12315646546465465456465465465465");
//	  $display("12315646546465465456465465465465");	  


	end
	
	

   
   
   endmodule