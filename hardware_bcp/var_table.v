module var_table(clock, reset, en, r_w,din,address,dout,table_finish);
parameter address_width=3;
parameter var_num=8;
input clock, reset, en, r_w;
input [1:0] address;
input [var_num-1:0] din;
output [var_num-1:0] dout;
output table_finish;
reg [var_num-1:0] variable_table [0:address_width-1];
reg [var_num-1:0] data;
reg table_finish;
/*
integer i;
integer a=0;
*/
wire [var_num-1:0] dout;

/*	initial
	begin
	#50
	for(i=0;i<address_width-1;i++)
		$display("m[%d]=%d",i,m[i]);
	end
*/


/*
	initial
	begin
		$monitor("variable_table[1]=%b,time=%d",variable_table[1],$time);	
	end
*/

    always @(posedge clock or negedge reset) 
    begin	
        if (!reset)
        begin				
            variable_table[0] <= 8'b0000_0000;//assignment
            variable_table[1] <= 8'b1110_1111;//free
            variable_table[2] <= 8'b0000_0000;//assigned
            data <= 8'h00;
//			variable_table[1][5]=0;
			table_finish<=1'b0;
        end
        else if (en == 1 && r_w == 0) // r_w==0:write
        begin
            variable_table[address] <=din;
			table_finish <=1'b1;
        end
        else if (en == 1 && r_w == 1) // r_w==1:read
        begin
			data <= variable_table[address];
			table_finish <=1'b1;
		end
        else
            data <= 8'hZZ;
    end
    assign dout = data;
/*
  always @* 
  begin
	if(table_finish)
	begin
	#8 table_finish=0;
	end			
  end	*/
	
	
endmodule

