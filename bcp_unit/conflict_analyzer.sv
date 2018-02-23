//`define var_num 4
module conflict_analyzer (
                                       input logic [`var_num-1:0] mask,
                                       input logic [`var_num-1:0] assignment,
									   input logic en,
									   output logic  conflict

); 

/*
    logic [SIZE-1:0] mask;
	logic [SIZE-1:0] assignment;
	 logic en;
	logic conflict;
*/	

	logic counter0;
	logic counter1;


	
    genvar i;
    generate 
        for(i=0; i<`var_num; i=i+1) 
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
	
	

/*	
  initial
  begin
    $fsdbDumpfile("conflict_analyzer.fsdb");
    $fsdbDumpvars(0, conflict_analyzer);
  end  

initial
   begin
   en=1'b0;
   #10
   en=1'b1;
   mask      =4'b1010;
   assignment=4'b1010;
   #10
   $display("mask=%b,time=%d",mask,$time);
   $display("assignment=%b,time=%d",assignment,$time);
   $display("counter1=%b,time=%d",counter1,$time);
   $display("counter0=%b,time=%d",counter0,$time);
   $display("conflict=%b,time=%d",conflict,$time);   
   $display("===================================================");      
   #10
   en=1'b0;
   #10
   en=1'b1;
   mask      =4'b1110;
   assignment=4'b1110;
   #10
   $display("mask=%b,time=%d",mask,$time);
   $display("assignment=%b,time=%d",assignment,$time);
   $display("counter1=%b,time=%d",counter1,$time);
   $display("counter0=%b,time=%d",counter0,$time);
   $display("conflict=%b,time=%d",conflict,$time);     
   $display("===================================================");         
   #10
   en=1'b0;
   #10
   en=1'b1;
   mask      =4'b1110;
   assignment=4'b1010;
   #10
   $display("mask=%b,time=%d",mask,$time);
   $display("assignment=%b,time=%d",assignment,$time);
   $display("counter1=%b,time=%d",counter1,$time);
   $display("counter0=%b,time=%d",counter0,$time);
   $display("conflict=%b,time=%d",conflict,$time);    
   $display("===================================================");         
   #1000
       $finish;	  
   end	
*/	

endmodule