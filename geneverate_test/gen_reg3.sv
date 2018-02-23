`timescale 1 ns / 10 ps 
`include"register3.sv"
`include"mux_8_1.sv"
module gen_register(//input clk
	output logic [31:0]reg_out
	);


   reg w_en;

   reg clk;
   reg ar;
   reg [7:0] a; 
   reg [15:0] b;
   reg [2:0] sel; 
//   reg [31:0]reg_out;
   

   initial 
   begin
     w_en=1; 
 	 a=8'b0101_0101;
  	 sel=3'd4;
	
	 $display("a=%b",a);	 
//	 $monitor("clk=%d",clk);
     #2
	 $display("reg_instance[0]=%d",reg_instance[0].r1.w_en);
	 $display("reg_instance[0]=%d",reg_instance[1].r1.w_en);
	 $display("reg_instance[0]=%d",reg_instance[2].r1.w_en);
	 $display("reg_instance[0]=%d",reg_instance[3].r1.w_en);
	 $display("reg_instance[0]=%d",reg_instance[4].r1.w_en);
	 $display("reg_instance[0]=%d",reg_instance[5].r1.w_en);
	 $display("reg_instance[0]=%d",reg_instance[6].r1.w_en);
	 $display("reg_instance[0]=%d",reg_instance[7].r1.w_en);	
	 $display("---------------------------------------------------");	
	 
	 $display("reg_instance[0]=%d",reg_instance[0].r1.wd);
	 $display("reg_instance[1]=%d",reg_instance[1].r1.wd);
	 $display("reg_instance[2]=%d",reg_instance[2].r1.wd);
	 $display("reg_instance[3]=%d",reg_instance[3].r1.wd);
	 $display("reg_instance[4]=%d",reg_instance[4].r1.wd);
	 $display("reg_instance[5]=%d",reg_instance[5].r1.wd);
	 $display("reg_instance[6]=%d",reg_instance[6].r1.wd);
	 $display("reg_instance[7]=%d",reg_instance[7].r1.wd);	 
	 $display("---------------------------------------------------");		 
	 $display("reg_instance[0]=%d",reg_instance[0].r1.rd);
	 $display("reg_instance[1]=%d",reg_instance[1].r1.rd);
	 $display("reg_instance[2]=%d",reg_instance[2].r1.rd);
	 $display("reg_instance[3]=%d",reg_instance[3].r1.rd);
	 $display("reg_instance[4]=%d",reg_instance[4].r1.rd);
	 $display("reg_instance[5]=%d",reg_instance[5].r1.rd);
	 $display("reg_instance[6]=%d",reg_instance[6].r1.rd);
	 $display("reg_instance[7]=%d",reg_instance[7].r1.rd);	
	 $display("---------------------------------------------------");		 
	 
	 #4 sel=3'd0;
	 $display("reg_out=%d,sel=%d",reg_out,sel);
	 #4 sel=3'd1;
	 $display("reg_out=%d,sel=%d",reg_out,sel);
	 #4 sel=3'd2;
	 $display("reg_out=%d,sel=%d",reg_out,sel);
	 #4 sel=3'd3;
	 $display("reg_out=%d,sel=%d",reg_out,sel);
	 #4 sel=3'd4;
	 $display("reg_out=%d,sel=%d",reg_out,sel);
	 #4 sel=3'd5;
	 $display("reg_out=%d,sel=%d",reg_out,sel);
	 #4 sel=3'd6;
	 $display("reg_out=%d,sel=%d",reg_out,sel);
	 #4 sel=3'd7;
	 $display("reg_out=%d,sel=%d",reg_out,sel);
	 $display("---------------------------------------------------");		 
	 	 $display("b=%b",b);
		 
	#10 a=8'b0000_0101;
	#10 a=8'b1111_0000;
	#10 a=8'b1101_0111;
	#10 a=8'b1010_1100;	
		 
	 #100 $finish;
	 
  
  end         
 
   genvar   i,j;   
   generate
      for(i=0;i<8;i=i+1)begin :reg_instance        
		register r1(.clk(clk),.w_en(w_en),.wd(a[i]),.rd(b[2*i+1:2*i]));
		// $display("a[i]=%d",a[i]);
		
      end
   endgenerate
   
   mux_8_1 m1(.input0(b[1:0]),
			  .input1(b[3:2]),
			  .input2(b[5:4]),
		      .input3(b[7:6]),
			  .input4(b[9:8]),
			  .input5(b[11:10]),
			  .input6(b[13:12]),
			  .input7(b[15:14]),
			  .sel(sel),
			  .mux_out(reg_out)  
   );
   
/*   
   always_comb begin
     case(sel)
		3'b000:
			reg_out=reg_instance[0].r1.rd;
		3'b001:
			reg_out=reg_instance[1].r1.rd;
		3'b010:
			reg_out=reg_instance[2].r1.rd;
		3'b011:
			reg_out=reg_instance[3].r1.rd;
		3'b100:
			reg_out=reg_instance[4].r1.rd;
		3'b101:
			reg_out=reg_instance[5].r1.rd;
		3'b110:
			reg_out=reg_instance[6].r1.rd;
		3'b111:
			reg_out=reg_instance[7].r1.rd;
       endcase
   end
  */ 
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
*/
  initial
  begin
    $fsdbDumpfile("gen_register.fsdb");
    $fsdbDumpvars(0, gen_register);
  end  
   
  
 initial// forever 
   begin
      clk   = 1;   
      #2 
      clk   = 0;
      #2      
      clk   = 1;   
      #2 
      clk   = 0;
      #2  	  
      clk   = 1;   
      #2 
      clk   = 0;
      #2      
      clk   = 1;   
      #2 
      clk   = 0;
      #2  
      clk   = 1;   
      #2 
      clk   = 0;
      #2      
      clk   = 1;   
      #2 
      clk   = 0;
      #2
      clk   = 1;   
      #2 
      clk   = 0;
      #2      
      clk   = 1;   
      #2 
      clk   = 0;
      #2  	  
      clk   = 1;   
      #2 
      clk   = 0;
      #2      
      clk   = 1;   
      #2 
      clk   = 0;
      #2  
      clk   = 1;   
      #2 
      clk   = 0;
      #2      
      clk   = 1;   
      #2 
      clk   = 0;
      #2  	  
      clk   = 1;   
      #2 
      clk   = 0;
      #2      
      clk   = 1;   
      #2 
      clk   = 0;
      #2  
      clk   = 1;   
      #2 
      clk   = 0;
      #2      
      clk   = 1;   
      #2 
      clk   = 0;
      #2
      clk   = 1;   
      #2 
      clk   = 0;
      #2      
      clk   = 1;   
      #2 
      clk   = 0;
      #2  	  
      clk   = 1;   
      #2 
      clk   = 0;
      #2      
      clk   = 1;   
      #2 
      clk   = 0;
      #2  
      clk   = 1;   
      #2 
      clk   = 0;
      #2      
      clk   = 1;   
      #2 
      clk   = 0;   
      #2      
      clk   = 1;   
      #2 
      clk   = 0;
      #2  	  
      clk   = 1;   
      #2 
      clk   = 0;
      #2      
      clk   = 1;   
      #2 
      clk   = 0;
      #2  
      clk   = 1;   
      #2 
      clk   = 0;
      #2      
      clk   = 1;   
      #2 
      clk   = 0;
      #2
      clk   = 1;   
      #2 
      clk   = 0;
      #2      
      clk   = 1;   
      #2 
      clk   = 0;
      #2  	  
      clk   = 1;   
      #2 
      clk   = 0;
      #2      
      clk   = 1;   
      #2 
      clk   = 0;
      #2  
      clk   = 1;   
      #2 
      clk   = 0;
      #2      
      clk   = 1;   
      #2 
      clk   = 0;
      #2  	  
      clk   = 1;   
      #2 
      clk   = 0;
      #2      
      clk   = 1;   
      #2 
      clk   = 0;
      #2  
      clk   = 1;   
      #2 
      clk   = 0;
      #2      
      clk   = 1;   
      #2 
      clk   = 0;
      #2
      clk   = 1;   
      #2 
      clk   = 0;
      #2      
      clk   = 1;   
      #2 
      clk   = 0;
      #2  	  
      clk   = 1;   
      #2 
      clk   = 0;
      #2      
      clk   = 1;   
      #2 
      clk   = 0;
      #2  
      clk   = 1;   
      #2 
      clk   = 0;
      #2      
      clk   = 1;   
      #2 
      clk   = 0;   	  
   end

endmodule // gentest

