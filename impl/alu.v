module alu74181(
    input [3:0]s,
    input M,
    input [0:15] a, b,
    output  [0:15] y,
    output  co
);

wire [0:15] added;
wire [0:15] negated;
wire [0:15] aOrNotA;

negate16 n(.i_a(a), .o_data(negated));
wordmux w1 (.i_sel(M), .i_val0(negated), .i_val1(a), .o_val(aOrNotA));
full_add16 f(.i_a(aOrNotA), .i_b(b), .cin(1'b0), .o_out(added), .o_cout(co));

wordmux w(.i_sel(s[3]), .i_val0(a), .i_val1(added), .o_val(y));
endmodule

module negate16(input wire [0:15] i_a, output reg [0:15] o_data);
o_data[0] = ~i_a[0];
o_data[1] = ~i_a[1];
o_data[2] = ~i_a[2];
o_data[3] = ~i_a[3];
o_data[4] = ~i_a[4];
o_data[5] = ~i_a[5];
o_data[6] = ~i_a[6];
o_data[7] = ~i_a[7];
o_data[8] = ~i_a[8];
o_data[9] = ~i_a[9];
o_data[10] = ~i_a[10];
o_data[11] = ~i_a[11];
o_data[12] = ~i_a[12];
o_data[13] = ~i_a[13];
o_data[14] = ~i_a[14];
o_data[15] = ~i_a[15];

endmodule
