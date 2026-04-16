`timescale 1ns/1ps

module sq_1011_d_tb;

    reg clk;
    reg reset;
    reg din;
    wire dout;

    sq_1011_d uut(
        .clk(clk),
        .reset(reset),
        .din(din),
        .dout(dout)
    );

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    task test_bit(input reg bit);
    begin
        din = bit;
        #10;
    end
    endtask


    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, sq_1011_d_tb);
        reset = 1'b1;
        din = 1'b0;
        #5
        reset = 1'b0;

        // dummpy check
        test_bit(1);
        test_bit(0);
        test_bit(0);

        // main check
        test_bit(1);
        test_bit(0);
        test_bit(1);
        test_bit(1);


        test_bit(1);
        test_bit(1);
        test_bit(0);
        test_bit(1);
        test_bit(1);

        test_bit(0);
        test_bit(0);
        test_bit(1);
        test_bit(0);
        test_bit(1);
        test_bit(0);

        $finish;
    end

endmodule