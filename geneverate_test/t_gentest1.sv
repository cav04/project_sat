module test();
   reg   clock ;
   reg [3:0] idx;

   wire [7:0] value;

   initial forever begin
      clock   <= 1;   
      #2 
      clock   <= 0;
      #2      ;
   end

   gentest g1(/*AUTOINST*/
          // Outputs
          .value            (value[7:0]),
          // Inputs
          .idx          (idx[3:0]));

   integer i;
   initial begin
      $display("start.");
      for(i=0;i<16;i=i+1)begin
        idx=i;        
        $display("%d",value);
        @(posedge clock);
      end 
      $display("end.");
      $finish();
   end

endmodule