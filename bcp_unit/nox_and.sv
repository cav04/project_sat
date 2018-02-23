module nox_and(assignment,clause_type,clause_mask,not_free,na_out);


input  logic assignment;
input  logic clause_type;
input  logic clause_mask;
input  logic not_free;
output logic na_out;

	
	assign na_out=(~(assignment^clause_type)&&clause_mask&&not_free);

endmodule