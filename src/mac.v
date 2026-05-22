module mac (
    input wire clk,
    input wire rst_n,
    input wire clk_enable,
    input wire signed [7:0] in_a,
    input wire signed [7:0] in_b,
    output reg signed [19:0] out_accum
);
    // 8-bit x 8-bit signed multiplication yields a 16-bit signed product
    wire signed [15:0] product;
    assign product = in_a * in_b;

    // Sequential logic for accumulation
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            out_accum <= 20'sd0; // Clear the accumulator on reset
        end else if (clk_enable) begin
            out_accum <= out_accum + product; // Add product to accumulator
        end
    end
endmodule
