module ttest0905(a,b,c,d,e);
input a;
input b;
input c;
input d;
output e;
	wire a1,a2,a3,a4;
	and #5 aa1(a1,a,b);
	and #5 aa2(a2,c,d);
	and  aa3(e,a1,a2);
	
endmodule