`include "nox_and.v"
module bcp_checker1(  clock
					,reset
					,en
					,free
					,assignment
					,clause_type
					,clause_mask
					,clause_size
					,counter
					,unit_exist
					,encoded_implication
					,bcp_is_work
					,bcp_initial);

	parameter var_num=8;
	
	input  wire clock;
	input  wire reset;
	input  wire en;
	input  wire [var_num-1:0]free;
	input  wire [var_num-1:0]assignment;
	input  wire [var_num-1:0]clause_type;
	input  wire [var_num-1:0]clause_mask;
	input  wire [var_num-1:0]clause_size;
	input  wire [var_num-1:0]counter;
	input  wire bcp_initial;
	
	output reg unit_exist;
//	output 
	output reg [2:0] encoded_implication;
	output reg bcp_is_work;
	

	wire [var_num-1:0]na_out;
	wire part_sat;
	wire unit;
	wire unit_exist_temp;
	wire [var_num-1:0] implication_wire;
	wire [var_num-1:0] counter_next;
	

	reg [var_num-1:0] counter_reg;
	reg [var_num-1:0] clause_type_reg;
	reg [var_num-1:0] clause_mask_reg;
	reg [var_num-1:0] clause_size_reg;
	reg [var_num-1:0] free_reg;
	reg [var_num-1:0] implication;

	genvar i;
	generate 
		for(i=0;i<var_num;i = i+1)
		begin : label
			nox_and na(assignment[i],clause_type_reg[i],clause_mask_reg[i],na_out[i]);
		end
	endgenerate


	genvar a;
	generate 
		for(a=0;a<var_num;a = a+1)
		begin : implication_unit
			and a1(implication_wire[a],clause_mask_reg[a],free[a]);
		end
	endgenerate
	

	assign  part_sat=&na_out;
	assign  unit=(clause_size_reg==counter_reg)?1:0;
	assign  unit_exist_temp=((unit&part_sat)==1)?1:0;
	
/*	
//-----------------------------encoder-----------------------------------------------------------------//	
	always@(posedge clock or negedge reset)
	begin
		if(!reset)

		
	end
	
*/	
	
	
//--------------------------------------------------------------------------------------------------//	
//	assign counter_next = (en) ? counter_reg + 1'b1 :  counter_reg ;

	always@(posedge clock or negedge reset)
	begin
		if(!reset)
		begin	
			   unit_exist<=1'b0;
			   implication<=8'b0000_0000;
			   counter_reg<=0;
			   clause_type_reg<=8'b0000_0000;
	       	   clause_mask_reg<=8'b0000_0000;
			   clause_size_reg<=8'b0000_0000;
			   free_reg<=8'b0000_0000;
			   bcp_is_work<=1;
			   encoded_implication<=3'b000;
		end
		else if(bcp_initial)
		begin//1
			   clause_type_reg<=clause_type;
	       	   clause_mask_reg<=clause_mask;
			   clause_size_reg<=clause_size;
			   free_reg<=free;
			   implication<=8'b0000_0000;	
			   counter_reg<=1;
			   encoded_implication<=3'b000;
			   bcp_is_work<=1;
		end//1
		else if(en)
			begin
			   if(counter_reg!=8'b1111_1111)
			     counter_reg<=counter_reg+1;
			   unit_exist<=unit_exist_temp;
			   implication<=implication_wire;
			   bcp_is_work<=0;	

//-----------------------------encoder-----------------------------------------------------------------//	
			case(implication_wire)
				8'b1000_0000: encoded_implication<=3'b111;
				8'b0100_0000: encoded_implication<=3'b110;
				8'b0010_0000: encoded_implication<=3'b101;
				8'b0001_0000: encoded_implication<=3'b100;
				8'b0000_1000: encoded_implication<=3'b011;
				8'b0000_0100: encoded_implication<=3'b010;
				8'b0000_0010: encoded_implication<=3'b001;
				8'b0000_0001: encoded_implication<=3'b000;
			endcase

//------------------------------------------------------------------------------------------//

			   
			end
		else if(bcp_is_work==1'b0)
				bcp_is_work<=1'b1;
		else	
			begin
			   implication<=implication;
			   unit_exist<=unit_exist;
			   bcp_is_work<=1;
			end	
		
	end
/*
	always@(bcp_is_work)
	begin
		if(bcp_is_work==1'b0)
			#5 bcp_is_work=1'b1;
		else
			bcp_is_work=bcp_is_work;
	end
*/
	
endmodule