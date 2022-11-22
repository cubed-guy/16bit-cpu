module incrementer(i_clock, i_in, i_dir, o_out);
input i_clock;
input i_dir;
input [0:15] i_in;
output reg [0:15] o_out;
always @(posedge i_clock) begin
    if (i_dir) begin
        o_out <= i_in + 1;
    end
    else begin
        o_out <= i_in - 1;
    end
end
endmodule
