module programrom(input [0:15] i_addr, output [0:17] o_instr);
wire [0:17] program [0:33];

assign program[0] = 18'b000001000000010000; // DT 0x1010
assign program[1] = 18'b111000000000000000; // OP 0x00
assign program[2] = 18'b111000010000000000; // OP 0x01
assign program[3] = 18'b111000100000000000; // OP 0x02
assign program[4] = 18'b111000110000000000; // OP 0x03
assign program[5] = 18'b111001000000000000; // OP 0x04
assign program[6] = 18'b111001010000000000; // OP 0x05
assign program[7] = 18'b111001100000000000; // OP 0x06
assign program[8] = 18'b111001110000000000; // OP 0x07
assign program[9] = 18'b111010000000000000; // OP 0x08
assign program[10] = 18'b111010010000000000; // OP 0x09
assign program[11] = 18'b111010100000000000; // OP 0x0A
assign program[12] = 18'b111010110000000000; // OP 0x0B
assign program[13] = 18'b111011000000000000; // OP 0x0C
assign program[14] = 18'b111011010000000000; // OP 0x0D
assign program[15] = 18'b111011100000000000; // OP 0x0E
assign program[16] = 18'b111011110000000000; // OP 0x0F
assign program[17] = 18'b111100000000000000; // OP 0x10
assign program[18] = 18'b111100010000000000; // OP 0x11
assign program[19] = 18'b111100100000000000; // OP 0x12
assign program[20] = 18'b111100110000000000; // OP 0x13
assign program[21] = 18'b111101000000000000; // OP 0x14
assign program[22] = 18'b111101010000000000; // OP 0x15
assign program[23] = 18'b111101100000000000; // OP 0x16
assign program[24] = 18'b111101110000000000; // OP 0x17
assign program[25] = 18'b111110000000000000; // OP 0x18
assign program[26] = 18'b111110010000000000; // OP 0x19
assign program[27] = 18'b111110100000000000; // OP 0x1A
assign program[28] = 18'b111110110000000000; // OP 0x1B
assign program[29] = 18'b111111000000000000; // OP 0x1C
assign program[30] = 18'b111111010000000000; // OP 0x1D
assign program[31] = 18'b111111100000000000; // OP 0x1E
assign program[32] = 18'b111111110000000000; // OP 0x1F
assign o_instr = program[i_addr];
endmodule
