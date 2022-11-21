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

module stackpointer (i_clock, bus, i_ctrl, o_topAddr);
input i_clock;
inout [0:15] bus;
input [0:2] i_ctrl;
output [0:15] o_topAddr;

wire shouldSet = i_ctrl[1] ^ i_ctrl[2];
wire [0:15] tempInc;

// dir = 1 if i_ctr[2] else 0
incrementer inc(.i_in(o_topAddr), .i_dir(i_ctrl[2]), .o_out(tempInc));

wordreg top(.i_clock(i_clock), .bus(bus), .i_data(tempInc), .i_w(shouldSet), .i_s(i_ctrl[0]), .o_data(o_topAddr));

endmodule


module memorystack (i_clock, bus, i_addr, i_w, i_s, o_top);

input i_clock;
inout [0:15] bus;
input [0:15] i_addr;
input i_w;
input i_s;
output [0:7] o_top;

reg [0:15] memory [0:65535];

always @(posedge clk) begin
    if (i_w) 
        memory[address] <= data_in;
    
    o_top <= memory[address];
end

wordmux m(.i_sel(i_s), .i_val0(memory[address]), .i_val1(16'bz), .o_val(bus));

endmodule

