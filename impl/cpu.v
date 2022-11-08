module cpu;

wire [0:16] w_instrAddr;
wire [0:18] w_progInstruction;

wire [0:16] BUS;

wire [0:16] w_stkAddr;
wire        w_stkW;
wire        w_stkS;

wire [0:3]  w_spCtrl; // [select, inc, dec,]
wire [0:16] w_spAddr;

wire [0:16] w_aluA;
wire [0:16] w_aluB;
wire [0:5]  w_aluOP;
wire [0:16] w_aluOut;
wire        w_aluCarry;


programrom rom(.i_addr(w_instrAddr), .o_data(w_progInstruction));
memorystack stack(.bus(BUS), .i_addr(w_stkAddr), .i_w(w_stkW), .i_s(w_stkS), .o_top(w_aluB));
stackpointer sp(.bus(BUS),.i_ctrl(w_spCtrl), .o_topAddr(w_spAddr));
alu74181 alu(.i_A(w_aluA), i_B(w_aluB), .i_OP(w_aluOP), .o_out(w_aluOut), .o_carry(w_aluCarry));


endmodule
