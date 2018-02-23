module gray2bin2 (bin, gray); 
    parameter SIZE = 8; // this module is parameterizable output [SIZE-1:0] bin; 
    input [SIZE-1:0] gray; 

    reg [SIZE-1:0] bin;  

    genvar i; 

    generate  

        for(i=0; i<SIZE; i=i+1) 
            begin: bit 
                    always @(gray[SIZE-1:i]) // fixed part select 
                            bin[i] = ^gray[SIZE-1:i]; 
            end 

    endgenerate 

endmodule