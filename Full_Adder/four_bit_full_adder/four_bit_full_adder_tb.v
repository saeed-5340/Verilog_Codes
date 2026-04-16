`timescale 1ns/1ps

module four_bit_full_adder_tb;
    reg [3:0] a,b;
    reg cin;
    wire [3:0] s;
    wire cout;

    four_bit_full_adder uut(
        .a(a),
        .b(b),
        .cin(cin),
        .s(s),
        .cout(cout)
    );

    integer i,j;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, four_bit_full_adder_tb);
        $display("a   b   cin | cout    s  | Result");
        $display("---------------------------------");
        for(i=0; i<16; i=i+1)
        begin
            for(j=0; j<16; j=j+1)
            begin
                cin = 0;
                {a} = i[3:0];
                {b} = j[3:0];
                #10;
                // $display("%d %d | %d", a,b,{cout,s});
                $display("%4b %4b %b | %4b %b | %d", a, b, cin, cout, s, {cout,s});  //In binary
                // $display("%d %d %d | %d %d", a, b, cin, s, cout);     // In decimal
            end
        end
        $finish;
    end

endmodule
