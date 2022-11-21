module programrom(input i_addr [0:15], output [0:17] o_instr);
wire [0:17] program [0:6];

assign program[0] = 18'b000000000000111000;
assign program[1] = 18'b110010100000000000;
assign program[2] = 18'b110001000000000000;
assign program[3] = 18'b000000000000011000;
assign program[4] = 18'b101010010000000000;
assign program[5] = 18'b110001000000000000;
endmodule
