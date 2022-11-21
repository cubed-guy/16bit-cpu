module incrementer(i_in, i_dir, o_out);
input i_dir;
input [0:15] i_in;
output reg [0:15] o_out;
always @(*) begin
    if (i_dir) begin
        assign o_out = i_in + 1;
    end
    else begin
        assign o_out = i_in - 1;
    end
end
endmodule
