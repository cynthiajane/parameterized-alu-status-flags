module alu #(
    parameter N = 8   
)(
    input  wire [N-1:0] a,
    input  wire [N-1:0] b,
    input  wire [2:0]   sel,   
    output reg  [N-1:0] result,
    output reg          Z,     
    output reg          C,   
    output reg          V,     
    output reg          Nf     
);

    reg [N:0] temp;  

    always @(*) begin
        // Default values
        result = {N{1'b0}};
        temp   = {N+1{1'b0}};
        C = 1'b0;
        V = 1'b0;

        case (sel)
            3'b000: begin 
                temp   = a + b;
                result = temp[N-1:0];
                C = temp[N];
                V = (~(a[N-1] ^ b[N-1])) & (result[N-1] ^ a[N-1]);
            end

            3'b001: begin // SUB
                temp   = a - b;
                result = temp[N-1:0];
                C = ~temp[N]; // Borrow flag
                V = (a[N-1] ^ b[N-1]) & (result[N-1] ^ a[N-1]);
            end

            3'b010: result = a & b;   
            3'b011: result = a | b;   
            3'b100: result = a ^ b;   
            3'b101: result = ~a;      
            3'b110: result = a << 1;  
            3'b111: result = a >> 1;  

            default: result = {N{1'b0}};
        endcase

        // Status flags
        Z  = (result == 0);    
        Nf = result[N-1];       
    end

endmodule
