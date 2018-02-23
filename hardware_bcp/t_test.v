module t_test;
    reg clk; 
	reg en;
	reg we;
	reg [3:0] di;
	wire [3:0] dout;
    integer i;
        clause_table uut (
        .clk(clk), 
        .en(en),
		.we(we),
		.data(data),
		.di(di),
		.dout(dout));
     
	 
	 parameter CLK_PERIOD = 10;
 	
     initial begin
		clk = 1;	
		en=1;
		we=1;
		#10
		di=3;
		$display("din,=%d,dout=%d",di,data);
		#20
		di=5;
		$display("din,=%d,dout=%d,en=%d,we=%d",di,data,en,we);		
		

         # 256 $finish;  
     end    
         
     always #(CLK_PERIOD/2) clk = ~clk;
     


 
 endmodule