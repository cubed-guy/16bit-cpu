`timescale 1 ns / 100 ps
module tb_inc;

reg [0:15] val0;
reg dir;
wire [0:15] o_val;

initial begin
	$dumpfile("tb_inc.vcd");
	$dumpvars(0,tb_inc);
	$monitor("%h %h %b", val0, o_val, dir);
end

incrementer inc(.i_in(val0), .i_dir(dir), .o_out(o_val));

initial begin
	#10 val0 <= 16'b100010101; dir <= 1'b1;
	#10 val0 <= 16'b100010100; dir <= 1'b0;
	#10 val0 <= 16'b111111111; dir <= 1'b1;
	#10 val0 <= 16'b001000001; dir <= 1'b0;
end

endmodule
