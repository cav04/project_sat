`timescale 1 ns / 10 ps 
`include"register.sv"
module gen_register(//input clk
	output logic reg_out
	);


   reg w_en;

   reg clk;
   reg ar;
   reg [3:0] a; 
   reg [1:0] b;
//   reg [31:0]reg_out;
   

   initial 
   begin
    w_en=1;
	b=2'b01;
	$monitor("clk=%d",clk);
	$monitor("reg_instance[0]=%d",reg_instance[0].r1.r);
	 #10
	$display("reg_out=%d",reg_out);
	$display("a=%b",a);	 
	$display("\b=%b",b);	
	 #100 $finish;
   end         
   
   genvar   i,j;   
   generate
      for(i=0;i<2;i=i+1)begin :reg_instance
         register r1(.clk(clk),.w_en(w_en),.wd(b),.rd(a[i*2+1:i*2]));
      end
   endgenerate
   
   always_comb begin
     if(w_en)
	   reg_out<=reg_instance[0].r1.r;
	 else  
	   reg_out<=reg_instance[1].r1.r;

/*
     if(w_en)
	   ar=1;	   
     reg_out<=reg_instance[ar].r1.rd;
     $display("reg_out=%d",reg_out);
*/

   end
/*   
   always @ (posedge clk) begin
     if(reg_instance[0].r1.r)
        $display("\n");
        $display("        ****************************               ");
        $display("        **                        **       |\__||  ");
        $display("        **  Congratulations !!    **      / O.O  | ");
        $display("        **                        **    /_____   | ");
        $display("        **  Simulation PASS!!     **   /^ ^ ^ \\  |");
        $display("        **                        **  |^ ^ ^ ^ |w| ");
        $display("        *************** ************   \\m___m__|_|");
        $display("\n");
   end

   
   
   
 initial// forever 
   begin
      clk   <= 1;   
      #2 
      clk   <= 0;
      #2      
      clk   <= 1;   
      #2 
      clk   <= 0;
      #2  	  
      clk   <= 1;   
      #2 
      clk   <= 0;
      #2      
      clk   <= 1;   
      #2 
      clk   <= 0;
      #2  
      clk   <= 1;   
      #2 
      clk   <= 0;
      #2      
      clk   <= 1;   
      #2 
      clk   <= 0;
      #2  	  
      clk   <= 1;   
      #2 
      clk   <= 0;
      #2      
      clk   <= 1;   
      #2 
      clk   <= 0;
      #2  
      clk   <= 1;   
      #2 
      clk   <= 0;
      #2      
      clk   <= 1;   
      #2 
      clk   <= 0;
      #2  	  
      clk   <= 1;   
      #2 
      clk   <= 0;
      #2      
      clk   <= 1;   
      #2 
      clk   <= 0;
      #2  
      clk   <= 1;   
      #2 
      clk   <= 0;
      #2      
      clk   <= 1;   
      #2 
      clk   <= 0;
      #2  	  
      clk   <= 1;   
      #2 
      clk   <= 0;
      #2      
      clk   <= 1;   
      #2 
      clk   <= 0;
      	  
   end
*/
endmodule // gentest

