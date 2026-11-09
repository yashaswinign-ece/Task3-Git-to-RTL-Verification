module counter_register_block #(
    parameter WIDTH = 4
)(
    input wire clk,
    input wire rst_n,      // Synchronous active-low reset
    input wire enable,     // Count enable control
    output reg [WIDTH-1:0] count
);

    always @(posedge clk) begin
        if (!rst_n) begin
            count <= {WIDTH{1'b0}};
        end else if (enable) begin
            count <= count + 1'b1;
        end
    end

endmodule
