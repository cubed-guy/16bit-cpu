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
wire [0:2]  w_spCtrl; // [select, inc, dec,]
wire [0:15] w_spAddr;

// General Registers
wire        w_RWCtrl;
wire        w_RSCtrl;
wire        w_TWCtrl;
wire [0:15] w_TInData;
wire        w_TIn;
wire [0:15] w_ROut;

// ALU and Carry
wire [0:15] w_aluOut;
wire [0:15] w_aluS;
wire [0:15] w_aluT;
wire [0:4]  w_aluOP;
wire        w_aluCarry;    // input to carry reg
wire        w_currCarry;   // output of carry reg
wire        w_carryWCtrl;  // write control signal to carry reg

// Other
wire        w_cond;
wire        w_instrTypeCtrl;
wire [0:4]  w_instrOP;
wire [0:1]  w_jSelCtrl;  // selects which value gets to be jCondVal
wire [0:15] w_jCondVal;  // value used to determine S and Z signals
wire [0:5]  w_jCtrl;     // from the CU to the 6:1 mux


//* CIRCUITS *//

programrom rom(.i_addr(w_instrAddr), .o_instr(w_progInstruction));
memorystack stack(.i_clock(i_clock), .bus(BUS), .i_addr(w_stkAddr), .i_w(w_stkWCtrl), .i_s(w_stkSCtrl), .o_top(w_aluS));

alu74181 alu(.a(w_aluT), .b(w_aluS), .s(w_aluOP[0:3]), .M(w_aluOP[4]), .y(w_aluOut), .co(w_aluCarry));
incrementer ipIncrementer(.i_in(w_instrAddr), .i_dir(1'b1), .o_out(w_incInstrAddr));
jumpassist the_jumpassist(.i_carry(w_currCarry), .i_jCondVal(w_jCondVal), .i_jCtrl(w_jCtrl), .o_cond(w_jCond));

// Registers
stackpointer sp(.i_clock(i_clock), .bus(BUS), .i_ctrl(w_spCtrl), .o_topAddr(w_spAddr));
bitreg  carryFlag(.i_clock(i_clock), .i_data(w_aluCarry), .i_w(w_carryWCtrl), .o_data(w_currCarry));
wordreg registerR(.i_clock(i_clock), .bus(BUS), .i_data(w_aluOut), .i_w(w_RWCtrl), .i_s(w_RSCtrl), .o_data(w_ROut));
wordreg registerT(.i_clock(i_clock), .bus(BUS), .i_data(w_TInData), .i_w(w_TWCtrl), .i_s(1'b0), .o_data(w_aluT));
wordreg ip(.i_clock(i_clock), .bus(BUS), .i_data(w_nextInstr), .i_w(1'b1), .i_s(1'b0), .o_data(w_instrAddr));

// Multiplexers
wordmux IPMux(.i_sel(w_cond), .i_val0(w_incInstrAddr), .i_val1(w_aluT), .o_val(w_nextInstr));
wordmux SPMux(.i_sel(w_stkAddrSel), .i_val0(w_spAddr), .i_val1(w_ROut), .o_val(w_TInData));
wordmux TInMux(.i_sel(w_TIn), .i_val0(w_progInstruction[2:18]), .i_val1(BUS), .o_val(w_TInData)); // this is the only place outside CU where we permit subscipting the instr
opmux OPMux(.i_sel(w_instrTypeCtrl), .i_val0(w_instrOP), .i_val1(5'b00000), .o_val(w_aluOP));
wordmux4 flagMux(
	.i_sel(w_jSelCtrl),
	.i_val0(w_aluOut), .i_val1(w_aluA),
	.i_val2(w_ROut), .i_val3(w_aluS),
	.o_val(w_jCondVal)
);


//* THE CONTROL UNIT *//

controlunit the_controlunit(
	.i_instruction(w_progInstruction),
    .o_stkAddrSel(w_stkAddrSel),
    .o_stkWCtrl(w_stkWCtrl),
    .o_stkSCtrl(w_stkSCtrl),
    .o_spCtrl(w_spCtrl),
    .o_RWCtrl(w_RWCtrl),
    .o_RSCtrl(w_RSCtrl),
    .o_TIn(w_TIn),
    .o_carryWCtrl(w_carryWCtrl),
    .o_instrTypeCtrl(w_instrTypeCtrl),
    .o_instrOP(w_instrOP),
    .o_jSelCtrl(w_jSelCtrl),
    .o_jCtrl(w_jCtrl)
);

endmodule
