module unit_clause_reg
	#(w=8)
	(
	output logic [w-1:0] unit_clause,
	input logic  w_en,
	input logic  rw_en,
	input logic [w-1:0] wd,
	input logic [2:0] delete_var
	,input logic clk
	);
  logic [w-1:0] uc; 

  
/*  
  logic [2:0] delete_var;
  logic clk;
  logic  w_en;
  logic  rw_en;
  logic [w-1:0] wd;
*/
  
  
  
 always_comb begin
   unit_clause =uc; 
 end
 
  always @(posedge clk) begin
    if (w_en) begin
      uc <= wd; 	
    end
    else if(rw_en) begin
      uc[delete_var]<=1'b0;
	end  
    else
      uc<=uc; 
  end

/*
  
 initial
    begin
	$monitor("unit_clause=%b",unit_clause);
	
		w_en=1;
		wd=8'b1111_1111;
		#10
//		$display("unit_clause=%b",unit_clause);
		w_en=0;
		#10
		rw_en=1;
		delete_var=3'b010;
		#5
		delete_var=3'b110;
		#5
		delete_var=3'b001;	
		#5
		delete_var=3'b000;			
//		$display("delete_var=%b",delete_var);		
		
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