`timescale 1ns/10ps

module memoryTest;
parameter address_width=8;
parameter data_width=8;

reg clock, reset, en, r_w;
reg [address_width-1:0] addr;
reg [data_width-1:0] din;

wire [data_width-1:0] dout;
integer i,a;

clausedb DUT (.clock(clock), .reset(reset), .en(en), .r_w(r_w), 
   .address(addr), .din(din), .dout(dout));

initial // reset砞﹚ memory ず甧 0,1,2,....,127
begin
  clock = 0;
  reset = 1;
  en = 1;
  r_w = 1; // r_w=1:弄家Α
  #20
  reset = 0;
	
  $display("addr=%d, din=%6b,dout=%6b,en=%d,r_w=%d,time=%d",addr,din,dout,en,r_w,$time);
  #30;
  addr = 0;
  r_w = 0; // 糶家Α
  din = 8'b1110_0000;
  #30;
  $display("addr=%d, din=%6b,dout=%6b,en=%d,r_w=%d,time=%d",addr,din,dout,en,r_w,$time);
  #30;
  addr = 1;
  r_w = 0; // 糶家Α
  din = 8'b1001_0000;
  #30;
  $display("addr=%d, din=%6b,dout=%6b,en=%d,r_w=%d,time=%d",addr,din,dout,en,r_w,$time);
  #30;
  addr = 2;
  r_w = 0; // 糶家Α
  din = 8'b0100_1000;
  #30;
  $display("addr=%d, din=%6b,dout=%6b,en=%d,r_w=%d,time=%d",addr,din,dout,en,r_w,$time);
  #30;
  addr = 3;
  r_w = 0; // 糶家Α
  din = 8'b0001_1000;
  #30;
  $display("addr=%d, din=%6b,dout=%6b,en=%d,r_w=%d,time=%d",addr,din,dout,en,r_w,$time);
 
  #30;
  addr = 0;
  r_w = 1; // 弄家Α
  din = 0;
  #30;
  $display("addr=%d, din=%6b,dout=%6b,en=%d,r_w=%d,time=%d",addr,din,dout,en,r_w,$time);
  #30;
  addr = 1;
  r_w = 1; // 弄家Α
  din = 0;
  #30;
  $display("addr=%d, din=%6b,dout=%6b,en=%d,r_w=%d,time=%d",addr,din,dout,en,r_w,$time);
  #30;
  addr = 2;
  r_w = 1; // 弄家Α
  din = 0;
  #30;
  $display("addr=%d, din=%6b,dout=%6b,en=%d,r_w=%d,time=%d",addr,din,dout,en,r_w,$time);
  #30;
  addr = 3;
  r_w = 1; // 弄家Α
  din = 0;
  #30;
  $display("addr=%d, din=%6b,dout=%6b,en=%d,r_w=%d,time=%d",addr,din,dout,en,r_w,$time);
  #30;
  addr = 4;
  r_w = 1; // 弄家Α
  din = 0;
  #30;
  $display("addr=%d, din=%6b,dout=%6b,en=%d,r_w=%d,time=%d",addr,din,dout,en,r_w,$time);  
  #10000
 
  begin
	
  end
  $finish ;
end

always #10 clock = ~clock;  

endmodule