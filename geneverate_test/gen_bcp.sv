`include"register8.sv"
`include"decoder_3_to_8.sv"
module gen_bcp #(w=8)
				(
				input logic [2:0] sel,
				input logic [w-1:0] wd,
				input logic clk
				);


   logic [w-1:0] a;
/*   
   logic [2:0] sel;
   logic [w-1:0] wd;
   logic clk;
*/
   genvar   i;   
   generate
      for(i=0;i<w;i=i+1)begin :reg_instance        
		register r1(.clk(clk),.w_en(a[i]),.wd(wd));
      end
   endgenerate
   
   decode_3_input  de8(.de_in(sel),.de_out(a));
   
   
   initial
    begin
	#30

    $display("reg_instance[0]=%d",reg_instance[0].r1.rd);	
	#5
    $display("reg_instance[1]=%d",reg_instance[1].r1.rd);
	#5
    $display("reg_instance[2]=%d",reg_instance[2].r1.rd);
	#5
    $display("reg_instance[3]=%d",reg_instance[3].r1.rd);	
	#5
    $display("reg_instance[4]=%d",reg_instance[4].r1.rd);	
	#5
    $display("reg_instance[5]=%d",reg_instance[5].r1.rd);	
	#5
    $display("reg_instance[6]=%d",reg_instance[6].r1.rd);		
	

	
    end 
   
   
   
   
/*  
   initial
    begin
	#5
	wd=8'd0;
	sel=3'd0;
	#5
    $display("reg_instance[0]=%d",reg_instance[0].r1.rd);	
	#5
	wd=8'd1;
	sel=3'd1;
	#5
    $display("reg_instance[1]=%d",reg_instance[1].r1.rd);
	#5
	wd=8'd2;
	sel=3'd2;
	#5
    $display("reg_instance[2]=%d",reg_instance[2].r1.rd);
	#5
	wd=8'd3;
	sel=3'd3;
	#5
    $display("reg_instance[3]=%d",reg_instance[3].r1.rd);	
	
	
	
	
	#100 $finish;
    end


initial
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
            	  
   end
   
   
*/   
   
   
   
   endmodule