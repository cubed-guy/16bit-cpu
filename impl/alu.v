module alu74181(
    input [3:0]s,
    input M,
    input [0:15] a, b,
    output  [0:15] y,
    output  co
);

wire [0:15] added;
full_add16 f(.i_a(a), .i_b(b), .cin(1'b0), .o_out(added), .o_cout(co));
wordmux w(.i_sel(s[3]), .i_val0(a), .i_val1(added), .o_val(y));
endmodule
