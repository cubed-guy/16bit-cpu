module half_adder(input wire a, b, output wire sum, c);
  wire n, o;
  and A1(c, a, b);
  not N1(n, c);
  or  O1(o, a, b);
  and A2(sum, n, o);
endmodule

module full_adder(input wire a, b, cin, output wire sum, cout);
  wire c1, s1, c2;
  half_adder H1(a, b, s2, c1);
  half_adder H2(s2, cin, sum, c2);
  or O1(cout, c1, c2);
endmodule

module full_add16(input wire [15:0] i_a, input wire [15:0] i_b, input wire cin, output wire [15:0] o_out, output wire o_cout );
wire Co[0:14];
full_adder f0(.a(i_a[0]), .b(i_b[0]), .cin(cin), .sum(o_out[0]), .cout(Co[0]));
full_adder f1(.a(i_a[1]), .b(i_b[1]), .cin(Co[0]), .sum(o_out[1]), .cout(Co[1]));
full_adder f2(.a(i_a[2]), .b(i_b[2]), .cin(Co[1]), .sum(o_out[2]), .cout(Co[2]));
full_adder f3(.a(i_a[3]), .b(i_b[3]), .cin(Co[2]), .sum(o_out[3]), .cout(Co[3]));
full_adder f4(.a(i_a[4]), .b(i_b[4]), .cin(Co[3]), .sum(o_out[4]), .cout(Co[4]));
full_adder f5(.a(i_a[5]), .b(i_b[5]), .cin(Co[4]), .sum(o_out[5]), .cout(Co[5]));
full_adder f6(.a(i_a[6]), .b(i_b[6]), .cin(Co[5]), .sum(o_out[6]), .cout(Co[6]));
full_adder f7(.a(i_a[7]), .b(i_b[7]), .cin(Co[6]), .sum(o_out[7]), .cout(Co[7]));
full_adder f8(.a(i_a[8]), .b(i_b[8]), .cin(Co[7]), .sum(o_out[8]), .cout(Co[8]));
full_adder f9(.a(i_a[9]), .b(i_b[9]), .cin(Co[8]), .sum(o_out[9]), .cout(Co[9]));
full_adder f10(.a(i_a[10]), .b(i_b[10]), .cin(Co[9]), .sum(o_out[10]), .cout(Co[10]));
full_adder f11(.a(i_a[11]), .b(i_b[11]), .cin(Co[10]), .sum(o_out[11]), .cout(Co[11]));
full_adder f12(.a(i_a[12]), .b(i_b[12]), .cin(Co[11]), .sum(o_out[12]), .cout(Co[12]));
full_adder f13(.a(i_a[13]), .b(i_b[13]), .cin(Co[12]), .sum(o_out[13]), .cout(Co[13]));
full_adder f14(.a(i_a[14]), .b(i_b[14]), .cin(Co[13]), .sum(o_out[14]), .cout(Co[14]));
full_adder f15(.a(i_a[15]), .b(i_b[15]), .cin(Co[14]), .sum(o_out[15]), .cout(o_cout));

endmodule

module incrementer(input [0:15] i_in, input i_dir, output [0:15] o_out);
  wire Co[0:15];
  wire w_dirInv;
  assign w_dirInv = ~i_dir;
  full_adder F0(i_in[15], w_dirInv, i_dir, o_out[15], Co[15]);
  full_adder F1(i_in[14], w_dirInv, Co[15], o_out[14], Co[14]);
  full_adder F2(i_in[13], w_dirInv, Co[14], o_out[13], Co[13]);
  full_adder F3(i_in[12], w_dirInv, Co[13], o_out[12], Co[12]);
  full_adder F4(i_in[11], w_dirInv, Co[12], o_out[11], Co[11]);
  full_adder F5(i_in[10], w_dirInv, Co[11], o_out[10], Co[10]);
  full_adder F6(i_in[9], w_dirInv, Co[10], o_out[9], Co[9]);
  full_adder F7(i_in[8], w_dirInv, Co[9], o_out[8], Co[8]);
  full_adder F8(i_in[7], w_dirInv, Co[8], o_out[7], Co[7]);
  full_adder F9(i_in[6], w_dirInv, Co[7], o_out[6], Co[6]);
  full_adder F10(i_in[5], w_dirInv, Co[6], o_out[5], Co[5]);
  full_adder F11(i_in[4], w_dirInv, Co[5], o_out[4], Co[4]);
  full_adder F12(i_in[3], w_dirInv, Co[4], o_out[3], Co[3]);
  full_adder F13(i_in[2], w_dirInv, Co[3], o_out[2], Co[2]);
  full_adder F14(i_in[1], w_dirInv, Co[2], o_out[1], Co[1]);
  full_adder F15(i_in[0], w_dirInv, Co[1], o_out[0], Co[0]);
endmodule
