module four_bit_full_adder(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] s,
    output cout
);

    wire c1,c2,c3;

    full_adder fa0(a[0],b[0],cin,s[0],c1);
    full_adder fa1(a[1],b[1],c1,s[1],c2);
    full_adder fa2(a[2],b[2],c2,s[2],c3);
    full_adder fa3(a[3],b[3],c3,s[3],cout);

endmodule