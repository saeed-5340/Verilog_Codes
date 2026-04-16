module sq_1010_d(
    input wire clk,
    input wire reset,
    input wire din,
    output wire dout
);

reg [2:0] state;
parameter s0 = 3'b000,
          s1 = 3'b001,
          s2 = 3'b010,
          s3 = 3'b011,
          s4 = 3'b100;

always @(posedge clk or posedge reset) begin
    if(reset) begin
        state <= s0;
    end
    else begin
        case(state)
            s0: if (din) state <= s1; else state <= s0;
            s1: if (din) state <= s1; else state <= s2;
            s2: if (din) state <= s3; else state <= s0;
            s3: if (din) state <= s1; else state <= s4;
            s4: if (din) state <= s3; else state <= s0;
            default: state <= s0;
        endcase
    end
end

assign dout = (state==s4);

endmodule




 // answer delay in one cycle


// module sq_1011_d(
//     input wire clk,
//     input wire reset,
//     input wire din,
//     output reg dout
// );

// reg [2:0] state;
// parameter s0 = 3'b000,
//           s1 = 3'b001,
//           s2 = 3'b010,
//           s3 = 3'b011,
//           s4 = 3'b100;

// always @(posedge clk or posedge reset) begin
//     if(reset) begin
//         state <= s0;
//         dout <= 0;
//     end
//     else begin
//         case(state)
//             s0: dout <= 0; if (din) state <= s1; else state <= s0;
//             s1: dout <= 0; if (din) state <= s1; else state <= s2;
//             s2: dout <= 0; if (din) state <= s3; else state <= s0;
//             s3: dout <= 0; if (din) state <= s4; else state <= s2;
//             s4: dout <= 1; if (din) state <= s1; else state <= s2;
//             default: state <= s0;
//         endcase
//     end
// end

// endmodule