module fifo (
  clock, reset,
  fifo_write,
  fifo_read,
  fifo_count,
  fifo_full,
//  fifo_hfull,
  fifo_empty,
//  fifo_hempty,
  fifo_datain,
  fifo_dataout
);

parameter fifohempty_level = 1;
parameter fifohfull_level = 7;
parameter fifo_length = 8;
parameter fifo_length_log=3;
parameter data_size =8;

input         clock, reset;
input         fifo_write;
input         fifo_read;
output [3:0]  fifo_count;
output        fifo_full;
//output        fifo_hfull;
output        fifo_empty;
//output        fifo_hempty;
input  [data_size-1:0] fifo_datain;
output reg [data_size-1:0] fifo_dataout;



wire    fifo_full_s, fifo_empty_s;
wire   [fifo_length_log:0]  fifo_count_s;
reg    [fifo_length_log:0]  rptr, wptr;
reg    [data_size-1:0] fifo [fifo_length-1:0];

always @(posedge clock or negedge reset)
begin//1
    if (!reset) 
	begin
      wptr <= 4'd0;
		fifo_dataout <=8'd0;	  
	end 
    else if (fifo_write && !fifo_full&&!fifo_read) 
	begin//3
      fifo[wptr[fifo_length_log-1:0]] <= fifo_datain;
      wptr <= wptr + 4'd1;
    end//3
end//1

always @(posedge clock or negedge reset) begin
    if (!reset)
	begin	
      rptr <= 4'd0;
	  fifo_dataout <=8'd0;
	end 	  
    else if (fifo_read && !fifo_empty&&!fifo_write) 
	begin
      rptr <= rptr + 4'd1;
	  fifo_dataout <= fifo[rptr[fifo_length_log-1:0]];
    end
end

//assign fifo_dataout = fifo[rptr[fifo_length_log-1:0]];

assign fifo_count_s = wptr - rptr;
	
assign fifo_full_s  = (fifo_count_s==fifo_length);
assign fifo_empty_s = (fifo_count_s==4'd0);

//assign fifo_hfull   = (fifo_count_s>=fifohfull_level);
//assign fifo_hempty  = (fifo_count_s<=fifohempty_level);				
assign fifo_full    = fifo_full_s;
assign fifo_empty   = fifo_empty_s;
assign fifo_count   = fifo_count_s;

endmodule