module tb_mux;
reg [0:15] data;

reg [0:15] val0, val1;
wire [0:15] o_val;
reg sel;

initial begin
	$dumpfile("tb_mux.vcd");
	$dumpvars(0,tb_mux);
	$monitor("%b %b %b %b", val0, val1, o_val, sel);
end

wordmux mux0(.i_sel(sel), .i_val0(val0), .i_val1(val1), .o_val(o_val));

initial begin
	#5 val0 <= 16'b100010101; val1 <= 16'b011101010; sel <= 1'b0;
	#5 val0 <= 16'b100010101; val1 <= 16'b011101010; sel <= 1'b1;
	#5 val0 <= 16'b111111111; val1 <= 16'b000010011; sel <= 1'b0;
	#5 val0 <= 16'b111111111; val1 <= 16'b000010011; sel <= 1'b1;
end

endmodule