`timescale 1ns/10ps
`include"var_table.v"
module var_tableTest;
parameter address_width=3;
parameter var_num=8;

reg clock, reset, en, r_w;
reg [1:0] addr;
reg [var_num-1:0] din;

wire [var_num-1:0] dout;
integer i,a;

var_table DUT (.clock(clock), .reset(reset), .en(en), .r_w(r_w), 
   .address(addr), .din(din), .dout(dout));

initial // reset memory  0,1,2,....,127
begin
  clock = 0;
  reset = 1;
  en = 1;
  r_w = 1; // read
  addr = 1;
  #20
  reset = 0;
  #10
	
  $display("addr=%d, din=%6b,dout=%6b,en=%d,r_w=%d,time=%d",addr,din,dout,en,r_w,$time);
  #30;
  addr = 0;
  r_w = 0; // write
  din = 8'b1110_0000;
  #30;
  $display("addr=%d, din=%6b,dout=%6b,en=%d,r_w=%d,time=%d",addr,din,dout,en,r_w,$time);
  #30;
  addr = 1;
  r_w = 0; // write
  din = 8'b1001_0000;
  #30;
  $display("addr=%d, din=%6b,dout=%6b,en=%d,r_w=%d,time=%d",addr,din,dout,en,r_w,$time);
  #30;
  addr = 2;
  r_w = 0; // write
  din = 8'b0100_1000;
  #30;
  $display("addr=%d, din=%6b,dout=%6b,en=%d,r_w=%d,time=%d",addr,din,dout,en,r_w,$time);
   
  #30;
  addr = 0;
  r_w = 1; // read
  din = 0;
  #30;
  $display("addr=%d, din=%6b,dout=%6b,en=%d,r_w=%d,time=%d",addr,din,dout,en,r_w,$time);
  #30;
  addr = 1;
  r_w = 1; // read
  din = 0;
  #30;
  $display("addr=%d, din=%6b,dout=%6b,en=%d,r_w=%d,time=%d",addr,din,dout,en,r_w,$time);
  #30;
  addr = 2;
  r_w = 1; // read
  din = 0;
  #30;
  $display("addr=%d, din=%6b,dout=%6b,en=%d,r_w=%d,time=%d",addr,din,dout,en,r_w,$time);
  


 
  begin
	
  end
  $finish ;
end

always #10 clock = ~clock;  

endmodule