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

module inc16(input [0:15] i_in, input i_dir, output [0:15] o_out);
  wire Co[0:15];
  wire w_dirInv;
  assign w_dirInv = ~i_dir;
  full_adder F0(i_in[0], i_dirInv, i_dir, o_out[0], Co[0]);
  full_adder F1(i_in[1], i_dirInv, Co[0], o_out[1], Co[1]);
  full_adder F2(i_in[2], i_dirInv, Co[1], o_out[2], Co[2]);
  full_adder F3(i_in[3], i_dirInv, Co[2], o_out[3], Co[3]);
  full_adder F4(i_in[4], i_dirInv, Co[3], o_out[4], Co[4]);
  full_adder F5(i_in[5], i_dirInv, Co[4], o_out[5], Co[5]);
  full_adder F6(i_in[6], i_dirInv, Co[5], o_out[6], Co[6]);
  full_adder F7(i_in[7], i_dirInv, Co[6], o_out[7], Co[7]);
  full_adder F8(i_in[8], i_dirInv, Co[7], o_out[8], Co[8]);
  full_adder F9(i_in[9], i_dirInv, Co[8], o_out[9], Co[9]);
  full_adder F10(i_in[10], i_dirInv, Co[9], o_out[10], Co[10]);
  full_adder F11(i_in[11], i_dirInv, Co[10], o_out[11], Co[11]);
  full_adder F12(i_in[12], i_dirInv, Co[11], o_out[12], Co[12]);
  full_adder F13(i_in[13], i_dirInv, Co[12], o_out[13], Co[13]);
  full_adder F14(i_in[14], i_dirInv, Co[13], o_out[14], Co[14]);
  full_adder F15(i_in[15], i_dirInv, Co[14], o_out[15], Co[15]);
endmodule

