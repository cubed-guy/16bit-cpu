module tb();
reg clock;

cpu c(.i_clock(clock));

always #10 clock =~ clock;
initial begin
    clock = 1'b0;
    c.sp.top.o_data = 16'b0;
    c.ip.o_data     = 16'b0;
    c.registerR.o_data = 16'b0;
    c.registerT.o_data = 16'b0;
end
initial begin $dumpfile("cpu.vcd"); $dumpvars(0,tb); end
initial begin
    $monitor("%d : %h %h %h %h %h", $time, c.w_aluT, c.stack.memory[65535] , c.stack.memory[65534], c.stack.memory[65533], c.stack.memory[65532]);
    // $monitor("%d : %h %h", $time, c.i_clock, clock);
    #240 $finish;
end

endmodule
