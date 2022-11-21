module jumpassist(input wire i_carry, 
    input wire [0:15] i_jCondVal,
    input wire [0:5] i_jCtrl, 
    output wire o_cond);

wire [0:2] w_SZC;

assign w_SZC[0] = i_jCondVal[0];

assign w_SZC[1] = ~(
	 i_jCondVal[0]
	&i_jCondVal[1]
	&i_jCondVal[2]
	&i_jCondVal[3]
	&i_jCondVal[4]
	&i_jCondVal[5]
	&i_jCondVal[6]
	&i_jCondVal[7]
	&i_jCondVal[8]
	&i_jCondVal[9]
	&i_jCondVal[10]
	&i_jCondVal[11]
	&i_jCondVal[12]
	&i_jCondVal[13]
	&i_jCondVal[14]
	&i_jCondVal[15]
);

assign w_SZC[2] = i_carry;

mux8 jMux(.i_sel(w_SZC), .i_val({2'b11, i_jCtrl}), .o_val(o_cond));
endmodule
