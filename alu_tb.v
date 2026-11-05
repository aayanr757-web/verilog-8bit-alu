
`timescale 1ns/1ps

module alu_tb;

reg [7:0] A, B;
reg [2:0] select;
wire [7:0] result;
wire zero;

integer passed = 0;
integer failed = 0;

alu dut (
    .A(A),
    .B(B),
    .select(select),
    .result(result),
    .zero(zero)
);

task check;
    input [7:0] a_in, b_in;
    input [2:0] operation;
    input [7:0] expected;
    begin
        A = a_in;
        B = b_in;
        select = operation;
        #10;

        if (result === expected &&
            zero === (expected == 0)) begin
            $display("PASS: Op=%0d A=%0d B=%0d Result=%0d",
                     select, A, B, result);
            passed = passed + 1;
        end else begin
            $display("FAIL: Op=%0d A=%0d B=%0d Expected=%0d Got=%0d",
                     select, A, B, expected, result);
            failed = failed + 1;
        end
    end
endtask

initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0, alu_tb);

    check(15, 5, 0, 20);
    check(15, 5, 1, 10);
    check(15, 5, 2, 5);
    check(15, 5, 3, 15);
    check(15, 5, 4, 10);
    check(15, 5, 5, 30);
    check(15, 5, 6, 7);
    check(15, 5, 7, 0);

    // Additional edge cases
    check(0, 0, 0, 0);
    check(255, 1, 0, 0);
    check(0, 1, 1, 255);
    check(5, 10, 7, 1);
    check(255, 255, 2, 255);
    check(255, 0, 5, 254);
    check(1, 0, 6, 0);
    check(42, 42, 1, 0);

    $display("------------------------");
    $display("PASSED: %0d", passed);
    $display("FAILED: %0d", failed);
    $display("------------------------");

    if (failed != 0)
        $fatal(1, "ALU verification failed");

    $finish;
end

endmodule
