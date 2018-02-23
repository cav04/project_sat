`timescale 1ns/10ps

module memoryTest;
reg clock, reset, en, r_w;
reg [7:0] addr;
reg [7:0] data_in;

wire [7:0] dbus_out;
integer i,a;

memory DUT (.clock(clock), .reset(reset), .en(en), .r_w(r_w), 
   .abus(addr), .dbus_in(data_in), .dbus_out(dbus_out));

initial // reset：設定 memory 內容為 0,1,2,....,127
begin
  clock = 0;
  reset = 1;
  en = 0;
  r_w = 1; // r_w=1:讀取模式

  

  
  
  $display("addr=%d, data_in=%d,dbus_out=%d,en=%d,r_w=%d,time=%d",addr,data_in,dbus_out,en,r_w,$time);
  #75;
  en = 1;
  reset = 0;
  addr = 0;
  for(i=0;i<127;i++)
  begin
	$display("addr=%d, data_in=%d,dbus_out=%d,en=%d,r_w=%d,time=%d",addr,data_in,dbus_out,en,r_w,$time);
	addr=addr+1;
	#10;
  end
  
  
  $display("addr=%d, data_in=%d,dbus_out=%d,en=%d,r_w=%d,time=%d",addr,data_in,dbus_out,en,r_w,$time);
  #500;
  addr = 15;
  r_w = 0; // 寫入模式
  data_in = 8'd10;
  $display("addr=%d, data_in=%d,dbus_out=%d,en=%d,r_w=%d,time=%d",addr,data_in,dbus_out,en,r_w,$time);
  #100;
  addr = 6;
  r_w = 1; // 讀取模式
  data_in = 0;
  $display("addr=%d, data_in=%d,dbus_out=%d,en=%d,r_w=%d,time=%d",addr,data_in,dbus_out,en,r_w,$time);
  #10000
 
  begin
	
  end
  $finish ;
end

always #50 clock = clock + 1; 

always #200 
begin
 addr=addr+1;
end

endmodule