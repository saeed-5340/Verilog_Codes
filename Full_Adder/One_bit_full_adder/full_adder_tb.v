`timescale 1ns/1ps

module full_adder_tb;
    reg x,y,carry;
    wire carry_out,sum;

// Instantiate DUT (Device Under Test)
full_adder uut (
    .a(x),
    .b(y),
    .cin(carry),
    .s(sum),
    .cout(carry_out)
);

integer i;

initial begin
    $display("x y carry | sum carry_out");
    $display("------------------------------");
    $dumpfile("wave.vcd");
    $dumpvars(2, full_adder_tb);
    for (i=0; i<8 ; i=i+1)
    begin
        {x,y,carry} = i[2:0];
        #10;
        $display("%b %b %b | %b  %b", x, y, carry, sum, carry_out);
    end

    $finish;
end

endmodule