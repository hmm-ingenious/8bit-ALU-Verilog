`timescale 1ns/1ps

module alu_tb;

reg [7:0] A;
reg [7:0] B;
reg [2:0] opcode;

wire [7:0] result;
wire Carry;
wire Overflow;
wire Zero;

alu uut(
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result),
    .Carry(Carry),
    .Overflow(Overflow),
    .Zero(Zero)
);

initial
begin
    $dumpfile("alu.vcd");
    $dumpvars(0, alu_tb);
    $display("Starting ALU Testbench...");

    // Addition
    A = 8'd10;
    B = 8'd20;
    opcode = 3'b000;
    #10;

    // Addition Overflow
    A = 8'd127;
    B = 8'd1;
    opcode = 3'b000;
    #10;

    // Addition Carry
    A = 8'd255;
    B = 8'd1;
    opcode = 3'b000;
    #10;

    // Subtraction
    A = 8'd20;
    B = 8'd10;
    opcode = 3'b001;
    #10;

    // Subtraction Negative
    A = 8'd0;
    B = 8'd1;
    opcode = 3'b001;
    #10;

    // AND
    A = 8'b10101010;
    B = 8'b11001100;
    opcode = 3'b010;
    #10;

    // OR
    opcode = 3'b011;
    #10;

    // XOR
    opcode = 3'b100;
    #10;

    // NOT
    opcode = 3'b101;
    #10;

    // Left Shift
    A = 8'b10010110;
    opcode = 3'b110;
    #10;

    // Right Shift
    opcode = 3'b111;
    #10;

    // Zero Flag
    A = 8'b00000000;
    B = 8'b00000000;
    opcode = 3'b010;
    #10;

    $stop;

end

endmodule