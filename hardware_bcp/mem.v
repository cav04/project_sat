module memory(input clock, reset, en, r_w, 
input [7:0] dbus_in,
input [7:0] abus,
output [7:0] dbus_out);
reg [7:0] m [0:15];
reg [7:0] data;
integer i;
integer a=0;
    always @(posedge clock or negedge reset) 
    begin	
        if (reset == 1)
        begin
 /*           m[0] <= 8'h00;
            m[1] <= 8'h01;
            m[2] <= 8'h02;
            m[3] <= 8'h03;
            m[4] <= 8'h04;*/
				
			for(i=0;i<127;i++)
			begin
				m[i]<=i;
			end			
            data = 8'h00;
        end
        else if (en == 1 && r_w == 0) // r_w==0:write
        begin
            data = dbus_in;
            m[abus] = dbus_in;
        end
        else if (en == 1 && r_w == 1) // r_w==1:read
            data = m[abus];
        else
            data = 8'hZZ;
    end
    assign dbus_out = data;
endmodule