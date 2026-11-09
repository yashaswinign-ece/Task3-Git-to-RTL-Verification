`timescale 1ns / 1ps

module tb_counter;

    parameter WIDTH = 4;

    reg clk;
    reg rst_n;
    reg enable;
    reg up_down;

    wire [WIDTH-1:0] count;

    // Instantiate the counter
    counter_register_block #(
        .WIDTH(WIDTH)
    ) uut (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .up_down(up_down),
        .count(count)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        // Initialize signals
        clk = 0;
        rst_n = 0;
        enable = 0;
        up_down = 1;

        // Waveform generation
        $dumpfile("counter.vcd");
        $dumpvars(0, tb_counter);

        // Reset
        #20;
        rst_n = 1;

        // Count UP
        enable = 1;
        up_down = 1;
        #100;

        // Hold counter
        enable = 0;
        #30;

        // Count DOWN
        enable = 1;
        up_down = 0;
        #100;

        // Count UP again
        up_down = 1;
        #50;

        // Count DOWN and test rollover
        up_down = 0;
        #200;

        // Reset again
        rst_n = 0;
        #20;
        rst_n = 1;

        #30;
        $finish;
    end

    // Display counter values
    initial begin
        $monitor("Time=%0t | Reset=%b Enable=%b Direction=%b Count=%d",
                 $time, rst_n, enable, up_down, count);
    end

endmodule
