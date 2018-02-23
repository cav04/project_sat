`include"data_mem.sv"
`include"gen_bcp.sv"
`include"initial_controller.sv"

module initial_top #(w=8)
				(

				);
	logic [2:0] sel;
	logic clk;
	logic rst;
	logic [w-1:0] wd;
	
	logic initial_sign;
	
	data_mem mm1(.address(sel),.clk(clk),.data_out(wd));
    gen_bcp	gb1(.sel(sel),.wd(wd),.clk(clk));
    initial_controller ic(.rst(rst),.initial_sign(initial_sign),.clk(clk),.address(sel));
	

  initial
  begin
    $fsdbDumpfile("initial_top.fsdb");
    $fsdbDumpvars(0, initial_top);
  end  

initial
   begin
//   $monitor("sel=%b",sel);
//   $monitor("rst=%b",rst);
	  initial_sign=1;
	  rst=1;
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
	  rst   = 0;
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
	   initial_sign=0;	  
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
   
   
   endmodule