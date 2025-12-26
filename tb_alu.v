module tb_alu;

    // Inputs to ALU (we drive these manually)
    reg  [7:0] a;
    reg  [7:0] b;
    reg        sel;

    // Output from ALU
    wire [7:0] result;

    // Instantiate ALU
    alu dut (
        .a(a),
        .b(b),
        .sel(sel),
        .result(result)
    );

    initial begin
        // Dump waveforms
        $dumpfile("alu.vcd");
        $dumpvars(0, tb_alu);

        // TEST 1: ADD
        a = 8'd5;
        b = 8'd3;
        sel = 0;     // ADD
        #10;

        // TEST 2: SUB
        a = 8'd10;
        b = 8'd4;
        sel = 1;     // SUB
        #10;

        // TEST 3: ADD (edge case)
        a = 8'd255;
        b = 8'd1;
        sel = 0;     // ADD
        #10;

        $finish;
    end

endmodule
