module incrementer(i_in, i_dir, o_out);
input i_dir;
input i_in;
output o_out;
always @(*) begin
    if (i_dir) begin
        assign o_out = i_in + 1;
    end
    else begin
        assign o_out = i_in - 1;
    end
end
endmodule
