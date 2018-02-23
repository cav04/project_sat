module m
#(
    parameter w = 2
)
(
output [w*2-1:0] a,
input [w-1:0][w-1:0] c
);


genvar i, j;
generate
    for(i = 0; i < w; i = i+1) begin: s1
        for(j = 0; j < w; j = j+1) begin: s2
            assign a[w*i+j] = c[j][i];
        end
    end
endgenerate
endmodule