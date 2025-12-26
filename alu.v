module alu #(
    parameter N = 8   // Bit-width (can change to 4, 16, etc.)
)(
    input  wire [N-1:0] a,
    input  wire [N-1:0] b,
    input  wire         sel,   // 0 = ADD, 1 = SUB
    output reg  [N-1:0] result
);

    // Combinational logic
    always_comb begin
        if (sel == 1'b0)
            result = a + b;   // ADD
        else
            result = a - b;   // SUB
    end

endmodule
