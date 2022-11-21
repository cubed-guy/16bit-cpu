module tb();
reg clock;

cpu c(.i_clock(clock));

always #10 clock = ~clock;

initial
    $monitor("%d : %h %h %h %h", $time, c.stack.memory[0] , c.stack.memory[1], c.stack.memory[2], c.stack.memory[3]);

endmodule
