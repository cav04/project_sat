module  for_handshake (
  in,
  out_rdy,
  out,
  tx_ing,
  clk,
  rst
);
input in;
input out_rdy;
input clk;
input rst;
output out;
output tx_ing;
 
parameter       IDLE      = 3'h0,
                TX_HIGH   = 3'h1,
                TX_LOW    = 3'h2;
 
reg [3:0]cnt;
reg [1:0]in_reg;
reg [1:0]out_rdy_reg;
reg [2:0]state;
reg [2:0]state_nxt;
wire in_rise;
wire out_fall;
 
always @ (posedge clk or negedge rst) begin
    if (!rst) begin
        in_reg <= 2'b0;
    end else begin
        in_reg <= {in_reg[0],in};
    end
end
assign in_rise = !in_reg[0] & in;
 
always @ (posedge clk or negedge rst) begin
    if (!rst) begin
        out_rdy_reg <= 2'b0;
    end else begin
        out_rdy_reg <= {out_rdy_reg[0],out_rdy};
    end
end
assign out_rdy_rise = !out_rdy_reg[0] &  out_rdy;
assign out_rdy_fall =  out_rdy_reg[0] & !out_rdy;
assign out_fall     = (state==TX_LOW) & out_rdy_fall;
 
always @ (posedge clk or negedge rst) begin
    if (!rst) begin
        cnt <= 4'd0;
    end else begin
        cnt <= cnt + {3'b0,in_rise} - {3'b0,out_fall};    
    end
end   
 
always @ (posedge clk or negedge rst) begin
    if (!rst) begin
        state <= IDLE;
    end else begin
        state <= state_nxt;
    end
end
 
always @ (*) begin
    case(state)
        IDLE      :begin
            if(cnt!=4'd0)  begin
                state_nxt = TX_HIGH ;
            end else begin
                state_nxt = IDLE ;
            end
        end
        TX_HIGH   :begin
            if(out_rdy_rise)  begin
                state_nxt = TX_LOW ;
            end else begin
                state_nxt = TX_HIGH ;
            end        
        end
        TX_LOW    :begin
            if(out_rdy_fall)  begin
                state_nxt = IDLE ;
            end else begin
                state_nxt = TX_LOW ;
            end        
        end
        default   :begin
            state_nxt = IDLE ; 
        end        
    endcase
end
assign out = (state == TX_HIGH) ? 1'b1 : 1'b0;
assign tx_ing = (cnt!=4'b0);            
              
 
endmodule
