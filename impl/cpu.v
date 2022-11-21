module cpu(input wire i_clock);

wire [0:16] w_instrAddr;
wire [0:16] w_incInstrAddr;
wire [0:18] w_progInstruction;
wire [0:16] w_nextInstr;

wire [0:16] BUS;

wire [0:16] w_stkAddr;
wire        w_stk_w;
wire        w_stk_s;
wire        w_R_w;
wire        w_R_s;
wire        w_T_w;

wire [0:3]  w_spCtrl; // [select, inc, dec,]
wire [0:16] w_spAddr;

wire [0:16] w_aluR;
wire [0:16] w_aluS;
wire [0:16] w_aluT;
wire [0:5]  w_aluOP;
wire        w_aluCarry;
wire        w_currCarry;
wire        w_carryWriteCtrl;

wire [0:16] w_TIn;

programrom rom(.i_addr(w_instrAddr), .o_data(w_progInstruction));
memorystack stack(i_clock, .bus(BUS), .i_addr(w_stkAddr), .i_w(w_stk_w), .i_s(w_stk_s), .o_top(w_aluS));

stackpointer sp(i_clock, .bus(BUS), .i_ctrl(w_spCtrl), .o_topAddr(w_spAddr));
bitreg  carryFlag(i_clock, .i_data(w_aluCarry), .i_w(w_carryWriteCtrl), .o_data(w_currCarry));
wordreg registerR(i_clock, .i_data(w_aluOut), .i_w(w_R_w), .i_s(w_R_s), .o_data(BUS));  // TODO: make selection, avoid x
wordreg registerT(i_clock, .i_data(w_TIn), .i_w(w_T_w), .o_data(w_aluT));
wordreg ip(i_clock, .i_data(w_nextInstr), .i_w(1'b1), .o_data(w_instrAddr));

alu74181 alu(.i_T(w_aluT), .i_S(w_aluS), .i_OP(w_aluOP), .o_result(w_aluR), .o_carry(w_aluCarry));

inc the_inc(.i(w_instrAddr), .o(w_incInstrAddr));
wordmux IPMux(.i_val0(w_incInstrAddr), .i_val1(w_aluT), .i_sel(w_cond), .o_val(w_nextInstr));

controlunit the_controlunit(.i_instruction(w_progInstruction)); // TODO: connect to all control wires

endmodule
