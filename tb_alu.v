`timescale 1ns / 1ps

module tb_alu;

    parameter N = 8;

    reg  [N-1:0] a;
    reg  [N-1:0] b;
    reg  [2:0]   sel;

    wire [N-1:0] result;
    wire         Z;
    wire         C;
    wire         V;
    wire         Nf;

    // Instantiate ALU
    alu #(N) dut (
        .a(a),
        .b(b),
        .sel(sel),
        .result(result),
        .Z(Z),
        .C(C),
        .V(V),
        .Nf(Nf)
    );

    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(0, tb_alu);

        $display("TIME |  A   B  SEL | RESULT | Z C V N");
        $display("---------------------------------------");

        // ADD (normal)
        a = 8'd10; b = 8'd20; sel = 3'b000; #10;
        $display("%4t | %3d %3d  ADD | %6d | %b %b %b %b",
                 $time, a, b, result, Z, C, V, Nf);

        // ADD (overflow)
        a = 8'd120; b = 8'd120; sel = 3'b000; #10;
        $display("%4t | %3d %3d  ADD | %6d | %b %b %b %b",
                 $time, a, b, result, Z, C, V, Nf);

        // SUB (normal)
        a = 8'd50; b = 8'd20; sel = 3'b001; #10;
        $display("%4t | %3d %3d  SUB | %6d | %b %b %b %b",
                 $time, a, b, result, Z, C, V, Nf);

        // SUB (negative)
        a = 8'd10; b = 8'd20; sel = 3'b001; #10;
        $display("%4t | %3d %3d  SUB | %6d | %b %b %b %b",
                 $time, a, b, result, Z, C, V, Nf);

        // AND
        a = 8'b10101010; b = 8'b11001100; sel = 3'b010; #10;
        $display("%4t | AND        | %b | Z=%b",
                 $time, result, Z);

        // OR
        sel = 3'b011; #10;
        $display("%4t | OR         | %b | Z=%b",
                 $time, result, Z);

        // XOR
        sel = 3'b100; #10;
        $display("%4t | XOR        | %b | Z=%b",
                 $time, result, Z);

        // NOT
        sel = 3'b101; #10;
        $display("%4t | NOT        | %b | Z=%b",
                 $time, result, Z);

        // SHIFT LEFT
        a = 8'b00001111; sel = 3'b110; #10;
        $display("%4t | SHL        | %b | C=%b",
                 $time, result, C);

        // SHIFT RIGHT
        sel = 3'b111; #10;
        $display("%4t | SHR        | %b",
                 $time, result);

        // ZERO result
        a = 8'd0; b = 8'd0; sel = 3'b000; #10;
        $display("%4t | ZERO TEST  | %d | Z=%b",
                 $time, result, Z);
      $monitor("t=%0t sel=%b a=%d b=%d result=%d Z=%b C=%b V=%b N=%b",
          $time, sel, a, b, result, Z, C, V, Nf);


        $display("---------------------------------------");
        $display("Simulation completed.");

        $finish;
    end

endmodule

