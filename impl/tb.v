module tb();
reg clock;

cpu c(.i_clock(clock));

always #10 clock = ~clock;

initial
    $monitor("%d : %h %h %h %h", $time, c.stack.memory[65535] , c.stack.memory[65534], c.stack.memory[65533], c.stack.memory[65532]);

endmodule
