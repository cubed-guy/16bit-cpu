module controlunit (
    i_instruction,
    o_stkAddrSel,
    o_stkWCtrl,
    o_stkSCtrl,
    o_spCtrl,
    o_RWCtrl,
    o_RSCtrl,
    o_TIn,
    o_carryWCtrl,
    o_instrTypeCtrl,
    o_instrOP,
    o_jSelCtrl,
    o_jCtrl
);

input [0:17] i_instruction;
output   o_stkAddrSel;
output   o_stkWCtrl;
output   o_stkSCtrl;
output [0:2]  o_spCtrl;
output  o_RWCtrl;
output   o_RSCtrl;
output   o_TIn;
output   o_carryWCtrl;
output [0:4] o_instrOP;
output o_instrTypeCtrl;
output o_jSelCtrl;
output [0:5] o_jCtrl;

assign o_TIn = (~i_instruction[0]) & (~i_instruction[1]);

assign o_stkAddrSel = (~i_instruction[3]) & (i_instruction[4]) & o_TIn;
assign o_stkWCtrl = i_instruction[3] & i_instruction[7] & o_TIn;
assign o_stkSCtrl = i_instruction[3] & o_TIn;

assign o_spCtrl[0] = o_stkAddrSel & o_TIn;
assign o_spCtrl[1] = i_instruction[0] & o_TIn;
assign o_spCtrl[2] = i_instruction[1] & o_TIn;

assign o_RWCtrl = i_instruction[6]& o_TIn;
assign o_RSCtrl = (~i_instruction[3]) & (~i_instruction[4]) & o_TIn;

assign o_carryWCtrl = (i_instruction[2]) & o_TIn;

assign o_instrTypeCtrl = o_carryWCtrl & o_TIn;
assign o_instrOP = i_instruction[3:7] & o_TIn;

assign o_jSelCtrl = i_instruction[9:11] & o_TIn;
assign o_jCtrl = i_instruction[12:17]  & o_TIn;

endmodule
