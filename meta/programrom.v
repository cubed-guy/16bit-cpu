module programrom(input [0:15] i_addr, output [0:17] o_instr);
wire [0:17] program [0:12];

assign program[0] = 18'b000000000000001110; // DT 14
assign program[1] = 18'b110010100000000000; // MV Stack R
assign program[2] = 18'b110001000000000000; // MV R Stack
assign program[3] = 18'b000000000000010010; // DT 18
assign program[4] = 18'b111010010000000000; // OP 9
assign program[5] = 18'b010001000000000000; // MV+ R Stack
assign program[6] = 18'b010001000000000000; // MV+ R Stack
assign program[7] = 18'b110001000000000000; // MV R Stack
assign program[8] = 18'b110010010000000000; // MV Stack T
assign program[9] = 18'b011010010000000000; // OP+ 9
assign program[10] = 18'b110001000000000000; // MV R Stack
assign o_instr = program[i_addr];
endmodule
