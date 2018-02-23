module conflict_analysis_controller #(var_num=8)
                                   (
								     input logic clk,
									 input logic rst,
                                     input logic [SIZE-1:0] mask,
                                     input logic [SIZE-1:0] assignment,									 
                                     input logic [1:0] address,
									 input logic [1:0] pe_out,
									 input logic [var_num-1:0]mem_out,
									 input logic [var_num-1:0]unit_exit,
									 input logic conflict_analysis_en,
									 output logic conflict
                                    );
	logic [var_num-1:0] conflict_reg;

	logic counter0;
	logic counter1;

	
    genvar i;
    generate 
        for(i=0; i<SIZE; i=i+1) 
            begin: test 
                    always @(mask or en)  begin
                    if(en==1'b0) begin
  					  counter0=1'b0;
					  counter1=1'b0;
					end  
                    else if(mask[i]==1'b1) 
					  begin					
                        if(assignment[i]==1'b1)
						  counter1=1'b1;
						else if(assignment[i]==1'b0)
                          counter0=1'b1;
                        else  begin
						  counter1=1'b0;
						  counter0=1'b0;						  
                        end						
					
//						$display("assignment[%d]=%b",i,assignment[i]);
                      end
 				   end			
				  
            end 

    endgenerate 
	
	always_comb begin
	  conflict=counter0&&counter1;
	end
	
  always_comb begin
    conflict_reg= mem_out & unit_exit;
  end   
  
  parameter read_next_var
  parameter 
  
  
  
  always_ff(posedge clk or negedge rst)begin
    if(conflict_analysis_en)begin
	  address <=pe_out;
	end  
	else   
	  
	  
  end
									
									
									


endmodule