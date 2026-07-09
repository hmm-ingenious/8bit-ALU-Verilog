module alu(
    input [7:0] A,
    input [7:0] B,
    input [2:0] opcode,

    output reg [7:0] result,
    output reg Carry,
    output reg Overflow,
    output Zero
);

always @(*) begin

    Carry = 0;
    Overflow = 0;

    case(opcode)

        // Addition
        3'b000:
        begin
            {Carry,result} = A + B;
            Overflow = (A[7] == B[7]) && (result[7] != A[7]);
        end

        // Subtraction
        3'b001:
        begin
            {Carry,result} = A - B;
            Overflow = (A[7] != B[7]) && (result[7] != A[7]);
        end

        // AND
        3'b010:
        begin
            result = A & B;
        end

        // OR
        3'b011:
        begin
            result = A | B;
        end

        // XOR
        3'b100:
        begin
            result = A ^ B;
        end

        // NOT
        3'b101:
        begin
            result = ~A;
        end

        // Left Shift
        3'b110:
        begin
            Carry = A[7];
            result = A << 1;
        end

        // Right Shift
        3'b111:
        begin
            Carry = A[0];
            result = A >> 1;
        end

        default:
        begin
            result = 8'b0;
            Carry = 0;
            Overflow = 0;
        end

    endcase

end

assign Zero = (result == 8'b00000000);

endmodule