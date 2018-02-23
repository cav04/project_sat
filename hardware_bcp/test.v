 module clause_table (clk, en, we, data, di, dout);
        input        clk;
        input        en;
        input        we;
        input  [4:0] data;
        input  [3:0] di;
        output [3:0] dout;
        reg    [2:0] ram [3:0];
        reg    [4:0] read_a;
		
        always @(posedge clk)
        begin
           if (en) begin
              if (we)
                 ram[data] <= di;
              read_a <= data;
           end
        end
           assign dout = ram[read_a];
        endmodule