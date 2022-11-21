module cpu(input wire i_clock);


//* WIRES *//

wire [0:15] BUS;

// Instruction
wire [0:15] w_instrAddr;
wire [0:15] w_incInstrAddr;
wire [0:17] w_progInstruction;
wire [0:15] w_nextInstr;

// Stack
wire        w_IDX;
wire [0:15] w_stkAddr;
wire        w_stkAddrSel;
wire        w_stkWCtrl;
wire        w_stkSCtrl;
wire [0:3]  w_spCtrl; // [select, inc, dec,]
wire [0:15] w_spAddr;

// General Registers
wire        w_RWCtrl;
wire        w_RSCtrl;
wire        w_TWCtrl;
wire [0:15] w_TInData;
wire        w_TIn;

// ALU and Carry
wire [0:15] w_aluOut;
wire [0:15] w_aluS;
wire [0:15] w_aluT;
wire [0:5]  w_aluOP;
wire        w_aluCarry;    // input to carry reg
wire        w_currCarry;   // output of carry reg
wire        w_carryWCtrl;  // write control signal to carry reg

// Other
wire        w_cond;
wire        w_instrTypeCtrl;
wire [0:5]  w_instrOP;
wire [0:1]  w_jSelCtrl;  // selects which value gets to be jCondVal
wire [0:15] w_jCondVal;  // value used to determine S and Z signals


//* CIRCUITS *//

programrom rom(.i_addr(w_instrAddr), .o_data(w_progInstruction));
memorystack stack(.i_clock(i_clock), .bus(BUS), .i_addr(w_stkAddr), .i_w(w_stkWCtrl), .i_s(w_stkSCtrl), .o_top(w_aluS));

alu74181 alu(.i_T(w_aluT), .i_S(w_aluS), .i_OP(w_aluOP), .o_result(w_aluOut), .o_carry(w_aluCarry));
incrementer ipIncrementer(.i_in(w_instrAddr), .i_dir(1'b1), .o_out(w_incInstrAddr));

// Registers
stackpointer sp(.i_clock(i_clock), .bus(BUS), .i_ctrl(w_spCtrl), .o_topAddr(w_spAddr));
bitreg  carryFlag(.i_clock(i_clock), .i_data(w_aluCarry), .i_w(w_carryWCtrl), .o_data(w_currCarry));
wordreg registerR(.i_clock(i_clock), .bus(BUS), .i_data(w_aluOut), .i_w(w_RWCtrl), .i_s(w_RSCtrl), .o_data(w_ROut));
wordreg registerT(.i_clock(i_clock), .bus(BUS), .i_data(w_TInData), .i_w(w_TWCtrl), .i_s(1'b0), .o_data(w_aluT));
wordreg ip(.i_clock(i_clock), .bus(BUS), .i_data(w_nextInstr), .i_w(1'b1), .i_s(1'b0), .o_data(w_instrAddr));

// Multiplexers
wordmux IPMux(.i_sel(w_cond), .i_val0(w_incInstrAddr), .i_val1(w_aluT), .o_val(w_nextInstr));
wordmux SPMux(.i_sel(w_stkAddrSel), .i_val0(w_spAddr), .i_val1(w_ROut), .o_val(w_TInData));
wordmux TInMux(.i_sel(w_TIn), .i_val0(BUS), .i_val1(w_progInstruction[2:18]), .o_val(w_TInData)); // this is the only place outside CU where we permit subscipting the instr
opmux OPMux(.i_sel(w_instrTypeCtrl), .i_val0(w_instrOP), .i_val1(5'b00000), .o_val(w_aluOP));
wordmux4 flagMux(
	.i_sel(w_jSelCtrl),
	.i_val0(w_aluOut), .i_val1(w_aluA),
	.i_val2(w_ROut), .i_val3(w_aluS),
	.o_val(w_jCondVal)
);

(.i_condVal(w_jCondVal), )


//* THE CONTROL UNIT *//

controlunit the_controlunit(
	.i_instruction(w_progInstruction),
	// TODO: connect to all control wires
);

endmodule
