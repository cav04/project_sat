module unit_clause_reg
	(
	output logic [`clause_num-1:0] unit_clause,
	input logic  w_en,
	input logic  rw_en,
	input logic [`clause_num-1:0] wd,
//	input logic [1:0] delete_var,
	input logic [`clause_num-1:0] delete_unit,
	input logic clk,
	input logic rst
	);
  logic [`clause_num-1:0] uc; 


  
  
  
 always_comb begin
   unit_clause =uc; 
 end
 
  always @(posedge clk or posedge rst) begin
    if(rst)
	  uc<=`clause_num'd0;
	else begin  
      if (w_en) begin
        uc <= wd; 	
      end
      else if(rw_en) begin
//      uc[delete_var]<=1'b0;
        uc<=delete_unit&uc;
	  end  
      else
        uc<=uc;
    end	  
  end

endmodule