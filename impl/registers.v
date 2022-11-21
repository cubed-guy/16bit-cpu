module bitreg(i_clock, i_data, i_w, o_data);

input i_clock;
input i_data;
input i_w;
output reg o_data;

always @(posedge i_clock)
begin
    if (i_w)
        o_data <= i_data;
end
endmodule

module wordreg (i_clock, bus, i_data, i_w, i_s, o_data);

input i_clock;
inout [0:15] bus;
input [0:15] i_data;
input i_w;
input i_s;
output reg [0:15] o_data;

always @(posedge i_clock)
begin
    if (i_w)
        o_data <= i_data;
end

wordmux m(.i_sel(i_s), .i_val1(o_data), .i_val0(16'bz), .o_val(bus));

endmodule
