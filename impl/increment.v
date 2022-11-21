module increment(.i_in, .i_dir, .o_out);
    if (i_dir):
        o_out = i_in + 1;
    else:
        o_out = i_in - 1;
endmodule