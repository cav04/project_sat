`include"gen_pe.sv"
`include"unit_clause_reg.sv"
module unit_delete_controll
	#(w=4)
	(
//	output logic [2:0] pe_out,
//	input [7:0]
	);

  logic clk;
    
  logic [w-1:0]pe_in;
  logic [w-1:0]unit_clause;
  logic [1:0]pe_out;
  logic w_en;
  logic rw_en;
  logic [w-1:0]wd;
  

  gen_pe gp(
			.pe_in(unit_clause),
			.pe_out(pe_out)
			);
			
 unit_clause_reg ucr
			(
			.unit_clause(unit_clause),
			.w_en(w_en),
			.rw_en(rw_en),
			.wd(wd),
			.delete_var(pe_out),
			.clk(clk)		
			); 

/*			
  initial
  begin
    $fsdbDumpfile("unit_delete_controll.fsdb");
    $fsdbDumpvars(0, unit_delete_controll);
  end  
  
 initial
    begin
	$monitor("unit_clause=%b",unit_clause);
	    rw_en=0;
		w_en=1;
		wd=4'b1011;
		#5
//		$display("unit_clause=%b",unit_clause);
		w_en=0;
		#5
		rw_en=1;
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