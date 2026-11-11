`timescale 1ns / 1ps

module tb_counter;

    parameter WIDTH = 4;

    reg clk;
    reg rst_n;
    reg enable;
    reg up_down;
    reg load;
    reg [WIDTH-1:0] data_in;

    wire [WIDTH-1:0] count;

    // Instantiate Unit Under Test
    counter_register_block #(
        .WIDTH(WIDTH)
    ) uut (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .up_down(up_down),
        .load(load),
        .data_in(data_in),
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
        load = 0;
        data_in = 0;

        // Generate waveform
        $dumpfile("counter_v2.vcd");
        $dumpvars(0, tb_counter);

        // Release reset
        #20;
        rst_n = 1;

        // Test 1: Parallel load value 5
        load = 1;
        data_in = 4'b0101;
        #10;
        load = 0;

        // Test 2: Count UP
        enable = 1;
        up_down = 1;
        #50;

        // Test 3: Hold counter
        enable = 0;
        #30;

        // Test 4: Count DOWN
        enable = 1;
        up_down = 0;
        #30;

        // Test 5: Load zero
        enable = 0;
        load = 1;
        data_in = 4'b0000;
        #10;
        load = 0;

        // Test 6: Down counter rollover
        enable = 1;
        up_down = 0;
        #20;

        // Test 7: Reset
        rst_n = 0;
        #20;
        rst_n = 1;

        #30;
        $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time=%0t | Reset=%b Enable=%b Up_Down=%b Load=%b Data=%b Count=%d",
                 $time, rst_n, enable, up_down, load, data_in, count);
    end

endmodule
