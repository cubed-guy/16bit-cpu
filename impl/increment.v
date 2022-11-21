module incrementer(i_in, i_dir, o_out);
if (i_dir) begin
        assign o_out = i_in + 1;
end
else begin
        assign o_out = i_in - 1;
end
endmodule
