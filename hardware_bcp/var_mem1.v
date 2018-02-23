module var_mem(clock, reset, data_read, data_write, mem_request, d_in, address, d_out,mem_work);

parameter data_size  = 8;         //Data Size
parameter mem_size = 8;      //Memory Size
parameter address_size = 2;         //Address Size


input clock, reset, data_read, data_write, mem_request;
input [data_size-1:0]  d_in;
input [address_size-1:0] address;

output reg [data_size-1:0]  d_out;
output reg mem_work;

reg [data_size-1:0] mem_data [mem_size-1:0];

wire pkt_in;
wire pkt_out;
wire [7:0] pkt_in_from_port;
wire [7:0] pkt_out_to_port;
wire polarity;
wire [7:0]d_in;
reg [7:0]d_out;
wire w_en;
wire data_o;

integer j;

reg [2:0] index;
always@(*)
begin   
	for(j=0;j<8;j=j+1)
	if(j==index)
	   d_in[j]<=data_o;
end

jasper_model_mem  #(3,1,1,0,0) dp 

( .clk(clock)
, .rstN(reset)
, .datain(d_in[index])
, .datain_reg()
, .addr_in (address)
, .addr_out(address)
, .weN(~mem_request)
, .pkt_vld(1'b1)
, .polarity(polarity)
, .dataout(data_o)
, .dataout_reg()
);




endmodule