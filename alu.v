`timescale 1ns/1ps
module alu (
    input  [7:0] A,
    input  [7:0] B,
    input  [2:0] select,
    output reg [7:0] result,
    output zero
);

always @(*) begin
    case (select)
        3'b000: result = A + B;
        3'b001: result = A - B;
        3'b010: result = A & B;
        3'b011: result = A | B;
        3'b100: result = A ^ B;
        3'b101: result = A << 1;
        3'b110: result = A >> 1;
        3'b111: result = (A < B) ? 8'd1 : 8'd0;
        default: result = 8'd0;
    endcase
end

assign zero = (result == 8'd0);

endmodule
