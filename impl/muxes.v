module mux(input wire i_sel, i_val0, i_val1, output wire o_val);
assign o_val = i_sel?i_val1:i_val0;
endmodule

module opmux(input wire i_sel, input wire [0:4] i_val0, i_val1, output wire [0:4] o_val);
mux mux_bit0(.i_sel(i_sel), .i_val0(i_val0[0]), .i_val1(i_val1[0]), .o_val(o_val[0]));
mux mux_bit1(.i_sel(i_sel), .i_val0(i_val0[1]), .i_val1(i_val1[1]), .o_val(o_val[1]));
mux mux_bit2(.i_sel(i_sel), .i_val0(i_val0[2]), .i_val1(i_val1[2]), .o_val(o_val[2]));
mux mux_bit3(.i_sel(i_sel), .i_val0(i_val0[3]), .i_val1(i_val1[3]), .o_val(o_val[3]));
mux mux_bit4(.i_sel(i_sel), .i_val0(i_val0[4]), .i_val1(i_val1[4]), .o_val(o_val[4]));
endmodule

module wordmux(input wire i_sel, input wire [0:15] i_val0, i_val1, output wire [0:15] o_val);
mux mux_bit0(.i_sel(i_sel), .i_val0(i_val0[0]), .i_val1(i_val1[0]), .o_val(o_val[0]));
mux mux_bit1(.i_sel(i_sel), .i_val0(i_val0[1]), .i_val1(i_val1[1]), .o_val(o_val[1]));
mux mux_bit2(.i_sel(i_sel), .i_val0(i_val0[2]), .i_val1(i_val1[2]), .o_val(o_val[2]));
mux mux_bit3(.i_sel(i_sel), .i_val0(i_val0[3]), .i_val1(i_val1[3]), .o_val(o_val[3]));
mux mux_bit4(.i_sel(i_sel), .i_val0(i_val0[4]), .i_val1(i_val1[4]), .o_val(o_val[4]));
mux mux_bit5(.i_sel(i_sel), .i_val0(i_val0[5]), .i_val1(i_val1[5]), .o_val(o_val[5]));
mux mux_bit6(.i_sel(i_sel), .i_val0(i_val0[6]), .i_val1(i_val1[6]), .o_val(o_val[6]));
mux mux_bit7(.i_sel(i_sel), .i_val0(i_val0[7]), .i_val1(i_val1[7]), .o_val(o_val[7]));
mux mux_bit8(.i_sel(i_sel), .i_val0(i_val0[8]), .i_val1(i_val1[8]), .o_val(o_val[8]));
mux mux_bit9(.i_sel(i_sel), .i_val0(i_val0[9]), .i_val1(i_val1[9]), .o_val(o_val[9]));
mux mux_bit10(.i_sel(i_sel), .i_val0(i_val0[10]), .i_val1(i_val1[10]), .o_val(o_val[10]));
mux mux_bit11(.i_sel(i_sel), .i_val0(i_val0[11]), .i_val1(i_val1[11]), .o_val(o_val[11]));
mux mux_bit12(.i_sel(i_sel), .i_val0(i_val0[12]), .i_val1(i_val1[12]), .o_val(o_val[12]));
mux mux_bit13(.i_sel(i_sel), .i_val0(i_val0[13]), .i_val1(i_val1[13]), .o_val(o_val[13]));
mux mux_bit14(.i_sel(i_sel), .i_val0(i_val0[14]), .i_val1(i_val1[14]), .o_val(o_val[14]));
mux mux_bit15(.i_sel(i_sel), .i_val0(i_val0[15]), .i_val1(i_val1[15]), .o_val(o_val[15]));
endmodule

module wordmux4(input wire [0:1] i_sel, input wire [0:15] i_val0, i_val1, i_val2, i_val3, output wire [0:15] o_val);
wire [0:15] w_0, w_1;
wordmux mux1(.i_sel(i_sel[1]), .i_val0(i_val0), .i_val1(i_val1), .o_val(w_0));
wordmux mux2(.i_sel(i_sel[1]), .i_val0(i_val2), .i_val1(i_val3), .o_val(w_1));
wordmux mux3(.i_sel(i_sel[0]), .i_val0(w_0), .i_val1(w_1), .o_val(o_val));
endmodule

module mux4 (input wire [0:1] i_sel, input wire [0:3] i_val, output wire o_val);
    wire w_0, w_1;
    mux mux2_0 (i_sel[1], i_val[0], i_val[1], w_0);
    mux mux2_1 (i_sel[1], i_val[2], i_val[3], w_1);
    mux mux2_2 (i_sel[0], w_0, w_1, o_val);
endmodule

module mux8 (input wire [0:2] i_sel, input wire [0:7] i_val, output wire o_val);
    wire w_0, w_1;
    mux4 mux4_0 (i_sel[1:2], i_val[0:3], w_0);
    mux4 mux4_1 (i_sel[1:2], i_val[4:7], w_1);
    mux  mux2_2 (i_sel[0], w_0, w_1, o_val);
endmodule
