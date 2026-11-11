
module counter_register_block #(
    parameter WIDTH = 4
)(
    input wire clk,
    input wire rst_n,
    input wire enable,
    input wire up_down,
    input wire load,
    input wire [WIDTH-1:0] data_in,
    output reg [WIDTH-1:0] count
);

    always @(posedge clk) begin
        if (!rst_n) begin
            count <= {WIDTH{1'b0}};
        end
        else if (load) begin
            count <= data_in;
        end
        else if (enable) begin
            if (up_down) begin
                count <= count + 1'b1;
            end
            else begin
                count <= count - 1'b1;
            end
        end
    end

endmodule

