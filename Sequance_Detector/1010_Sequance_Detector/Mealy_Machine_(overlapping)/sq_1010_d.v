module sq_1010_d(
    input wire clk,
    input wire reset,
    input wire din,
    output reg dout
);

 reg [1:0] state;
 parameter s0 = 2'b00,
           s1 = 2'b01,
           s2 = 2'b10,
           s3 = 2'b11;

 always @(posedge clk or posedge reset) begin
    if(reset) begin
        dout <= 1'b0;
        state <= s0;
    end
    else begin
        dout <= 0;
        case(state)
            s0: begin
                if(din)
                    state <=s1;
                else 
                    state <= s0;
            end
            s1 : begin
                if(din) 
                    state <= s1;
                else
                    state <= s2;
            end
            s2 : begin
                if(din)
                    state <= s3;
                else
                    state <= s0;
            end
            s3 : begin
                if(din) begin
                    state <= s1;
                end
                else begin
                    state <=s2;
                    dout <= 1;
                end
            end
        endcase
    end
 end
endmodule
