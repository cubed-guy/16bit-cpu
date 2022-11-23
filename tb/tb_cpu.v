module tb();
reg clock;

cpu c(.i_clock(clock));

always #10 clock =~ clock;
initial begin
    clock = 1'b0;
    c.sp.top.o_data = 16'b0;
    c.ip.o_data     = -16'b1;
    c.registerR.o_data = 16'b0;
    c.registerT.o_data = 16'b0;
   
end
initial begin $dumpfile("cpu.vcd"); $dumpvars(0,tb); end
initial begin
    $monitor("%t : (T:%h) (Stack[0:4]: %h %h %h %h)", $time, c.w_aluT, c.stack.memory[0] , c.stack.memory[1], c.stack.memory[2], c.stack.memory[3]);
    // $monitor("%d : %h %h", $time, c.i_clock, clock);
    #240 $finish;
end

endmodule
