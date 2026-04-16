// Testbench for 1011 Mealy non-overlapping sequence detector
module sq_1011_d_tb;

    // Signals
    reg clk;
    reg reset;
    reg din;
    wire dout;

    // Instantiate the design
    sq_1011_d uut (
        .clk(clk),
        .reset(reset),
        .din(din),
        .dout(dout)
    );

    // Clock generation: 10 ns period
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    task apply_bit(input reg bit_in);
        begin
            din = bit_in;
            #10;
        end
    endtask

    initial begin
        // Initialize inputs
        $dumpfile("wave.vcd");
        $dumpvars(0, sq_1011_d_tb);
        reset = 1'b1;
        din   = 1'b0;

        // Display signal activity
        $monitor("Time = %0t | reset = %b | din = %b | dout = %b", $time, reset, din, dout);

        // Apply reset
        #12;
        reset = 1'b0;

        // Sequence: 1 0 1 1 -> detect
        apply_bit(1'b1);
        apply_bit(1'b0);
        apply_bit(1'b1);
        apply_bit(1'b1);

        // Extra bits: no detect
        apply_bit(1'b0);
        apply_bit(1'b1);
        apply_bit(1'b0);

        // Sequence: 1 0 1 1 -> detect again
        apply_bit(1'b1);
        apply_bit(1'b0);
        apply_bit(1'b1);
        apply_bit(1'b1);

        // Back-to-back stream to show non-overlapping behavior
        // 10111011 should produce two pulses, one for each complete 1011
        apply_bit(1'b1);
        apply_bit(1'b0);
        apply_bit(1'b1);
        apply_bit(1'b1);
        apply_bit(1'b1);
        apply_bit(1'b0);
        apply_bit(1'b1);
        apply_bit(1'b1);

        #20;
        $finish;
    end



endmodule
