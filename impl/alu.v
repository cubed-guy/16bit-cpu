module alu74181(
    input [0:3]s,
    input ci, M,
    input [0:15] a, b,
    output reg [0:15] y,
    output reg co
);

reg [0:15] p, g;

always @(*) begin

    p[0] <= ~(a[0] | (s[0] & b[0]) | (s[1] & ~b[0]));
    p[1] <= ~(a[1] | (s[0] & b[1]) | (s[1] & ~b[1]));
    p[2] <= ~(a[2] | (s[0] & b[2]) | (s[1] & ~b[2]));
    p[3] <= ~(a[3] | (s[0] & b[3]) | (s[1] & ~b[3]));
    p[4] <= ~(a[4] | (s[0] & b[4]) | (s[1] & ~b[4]));
    p[5] <= ~(a[5] | (s[0] & b[5]) | (s[1] & ~b[5]));
    p[6] <= ~(a[6] | (s[0] & b[6]) | (s[1] & ~b[6]));
    p[7] <= ~(a[7] | (s[0] & b[7]) | (s[1] & ~b[7]));
    p[8] <= ~(a[8] | (s[0] & b[8]) | (s[1] & ~b[8]));
    p[9] <= ~(a[9] | (s[0] & b[9]) | (s[1] & ~b[9]));
    p[10] <= ~(a[10] | (s[0] & b[10]) | (s[1] & ~b[10]));
    p[11] <= ~(a[11] | (s[0] & b[11]) | (s[1] & ~b[11]));
    p[12] <= ~(a[12] | (s[0] & b[12]) | (s[1] & ~b[12]));
    p[13] <= ~(a[13] | (s[0] & b[13]) | (s[1] & ~b[13]));
    p[14] <= ~(a[14] | (s[0] & b[14]) | (s[1] & ~b[14]));
    p[15] <= ~(a[15] | (s[0] & b[15]) | (s[1] & ~b[15]));

    g[0] <= ~((a[0] & ~b[0] & s[2]) | (a[0] & b[0] & s[3]));
    g[1] <= ~((a[1] & ~b[1] & s[2]) | (a[1] & b[1] & s[3]));
    g[2] <= ~((a[2] & ~b[2] & s[2]) | (a[2] & b[2] & s[3]));
    g[3] <= ~((a[3] & ~b[3] & s[2]) | (a[3] & b[3] & s[3]));
    g[4] <= ~((a[4] & ~b[4] & s[2]) | (a[4] & b[4] & s[3]));
    g[5] <= ~((a[5] & ~b[5] & s[2]) | (a[5] & b[5] & s[3]));
    g[6] <= ~((a[6] & ~b[6] & s[2]) | (a[6] & b[6] & s[3]));
    g[7] <= ~((a[7] & ~b[7] & s[2]) | (a[7] & b[7] & s[3]));
    g[8] <= ~((a[8] & ~b[8] & s[2]) | (a[8] & b[8] & s[3]));
    g[9] <= ~((a[9] & ~b[9] & s[2]) | (a[9] & b[9] & s[3]));
    g[10] <= ~((a[10] & ~b[10] & s[2]) | (a[10] & b[10] & s[3]));
    g[11] <= ~((a[11] & ~b[11] & s[2]) | (a[11] & b[11] & s[3]));
    g[12] <= ~((a[12] & ~b[12] & s[2]) | (a[12] & b[12] & s[3]));
    g[13] <= ~((a[13] & ~b[13] & s[2]) | (a[13] & b[13] & s[3]));
    g[14] <= ~((a[14] & ~b[14] & s[2]) | (a[14] & b[14] & s[3]));
    g[15] <= ~((a[15] & ~b[15] & s[2]) | (a[15] & b[15] & s[3]));
    g[16] <= ~((a[16] & ~b[16] & s[2]) | (a[16] & b[16] & s[3]));

    y[1]  = (p[1]  ^ g[1] ) | (~M & p[0]);
    y[2]  = (p[2]  ^ g[2] ) | (~M & p[1]) | (~M & p[0] & g[1]);
    y[3]  = (p[3]  ^ g[3] ) | (~M & p[2]) | (~M & p[1] & g[2]) | (~M & p[0] & g[1] & g[2]);
    y[4]  = (p[4]  ^ g[4] ) | (~M & p[3]) | (~M & p[2] & g[3]) | (~M & p[1] & g[2] & g[3]) | (~M & p[0] & g[1] & g[2] & g[3]);
    y[5]  = (p[5]  ^ g[5] ) | (~M & p[4]) | (~M & p[3] & g[4]) | (~M & p[2] & g[3] & g[4]) | (~M & p[1] & g[2] & g[3] & g[4]) | (~M & p[0] & g[1] & g[2] & g[3] & g[4]);
    y[6]  = (p[6]  ^ g[6] ) | (~M & p[5]) | (~M & p[4] & g[5]) | (~M & p[3] & g[4] & g[5]) | (~M & p[2] & g[3] & g[4] & g[5]) | (~M & p[1] & g[2] & g[3] & g[4] & g[5]) | (~M & p[0] & g[1] & g[2] & g[3] & g[4] & g[5]);
    y[7]  = (p[7]  ^ g[7] ) | (~M & p[6]) | (~M & p[5] & g[6]) | (~M & p[4] & g[5] & g[6]) | (~M & p[3] & g[4] & g[5] & g[6]) | (~M & p[2] & g[3] & g[4] & g[5] & g[6]) | (~M & p[1] & g[2] & g[3] & g[4] & g[5] & g[6]) | (~M & p[0] & g[1] & g[2] & g[3] & g[4] & g[5] & g[6]);
    y[8]  = (p[8]  ^ g[8] ) | (~M & p[7]) | (~M & p[6] & g[7]) | (~M & p[5] & g[6] & g[7]) | (~M & p[4] & g[5] & g[6] & g[7]) | (~M & p[3] & g[4] & g[5] & g[6] & g[7]) | (~M & p[2] & g[3] & g[4] & g[5] & g[6] & g[7]) | (~M & p[1] & g[2] & g[3] & g[4] & g[5] & g[6] & g[7]) | (~M & p[0] & g[1] & g[2] & g[3] & g[4] & g[5] & g[6] & g[7]);
    y[9]  = (p[9]  ^ g[9] ) | (~M & p[8]) | (~M & p[7] & g[8]) | (~M & p[6] & g[7] & g[8]) | (~M & p[5] & g[6] & g[7] & g[8]) | (~M & p[4] & g[5] & g[6] & g[7] & g[8]) | (~M & p[3] & g[4] & g[5] & g[6] & g[7] & g[8]) | (~M & p[2] & g[3] & g[4] & g[5] & g[6] & g[7] & g[8]) | (~M & p[1] & g[2] & g[3] & g[4] & g[5] & g[6] & g[7] & g[8]) | (~M & p[0] & g[1] & g[2] & g[3] & g[4] & g[5] & g[6] & g[7] & g[8]);
    y[10] = (p[10] ^ g[10]) | (~M & p[9]) | (~M & p[8] & g[9]) | (~M & p[7] & g[8] & g[9]) | (~M & p[6] & g[7] & g[8] & g[9]) | (~M & p[5] & g[6] & g[7] & g[8] & g[9]) | (~M & p[4] & g[5] & g[6] & g[7] & g[8] & g[9]) | (~M & p[3] & g[4] & g[5] & g[6] & g[7] & g[8] & g[9]) | (~M & p[2] & g[3] & g[4] & g[5] & g[6] & g[7] & g[8] & g[9]) | (~M & p[1] & g[2] & g[3] & g[4] & g[5] & g[6] & g[7] & g[8] & g[9]) | (~M & p[0] & g[1] & g[2] & g[3] & g[4] & g[5] & g[6] & g[7] & g[8] & g[9]);
    y[11] = (p[11] ^ g[11]) | (~M & p[10]) | (~M & p[9] & g[10]) | (~M & p[8] & g[9] & g[10]) | (~M & p[7] & g[8] & g[9] & g[10]) | (~M & p[6] & g[7] & g[8] & g[9] & g[10]) | (~M & p[5] & g[6] & g[7] & g[8] & g[9] & g[10]) | (~M & p[4] & g[5] & g[6] & g[7] & g[8] & g[9] & g[10]) | (~M & p[3] & g[4] & g[5] & g[6] & g[7] & g[8] & g[9] & g[10]) | (~M & p[2] & g[3] & g[4] & g[5] & g[6] & g[7] & g[8] & g[9] & g[10]) | (~M & p[1] & g[2] & g[3] & g[4] & g[5] & g[6] & g[7] & g[8] & g[9] & g[10]) | (~M & p[0] & g[1] & g[2] & g[3] & g[4] & g[5] & g[6] & g[7] & g[8] & g[9] & g[10]);
    y[12] = (p[12] ^ g[12]) | (~M & p[11]) | (~M & p[10] & g[11]) | (~M & p[9] & g[10] & g[11]) | (~M & p[8] & g[9] & g[10] & g[11]) | (~M & p[7] & g[8] & g[9] & g[10] & g[11]) | (~M & p[6] & g[7] & g[8] & g[9] & g[10] & g[11]) | (~M & p[5] & g[6] & g[7] & g[8] & g[9] & g[10] & g[11]) | (~M & p[4] & g[5] & g[6] & g[7] & g[8] & g[9] & g[10] & g[11]) | (~M & p[3] & g[4] & g[5] & g[6] & g[7] & g[8] & g[9] & g[10] & g[11]) | (~M & p[2] & g[3] & g[4] & g[5] & g[6] & g[7] & g[8] & g[9] & g[10] & g[11]) | (~M & p[1] & g[2] & g[3] & g[4] & g[5] & g[6] & g[7] & g[8] & g[9] & g[10] & g[11]) | (~M & p[0] & g[1] & g[2] & g[3] & g[4] & g[5] & g[6] & g[7] & g[8] & g[9] & g[10] & g[11]);
    y[13] = (p[13] ^ g[13]) | (~M & p[12]) | (~M & p[11] & g[12]) | (~M & p[10] & g[11] & g[12]) | (~M & p[9] & g[10] & g[11] & g[12]) | (~M & p[8] & g[9] & g[10] & g[11] & g[12]) | (~M & p[7] & g[8] & g[9] & g[10] & g[11] & g[12]) | (~M & p[6] & g[7] & g[8] & g[9] & g[10] & g[11] & g[12]) | (~M & p[5] & g[6] & g[7] & g[8] & g[9] & g[10] & g[11] & g[12]) | (~M & p[4] & g[5] & g[6] & g[7] & g[8] & g[9] & g[10] & g[11] & g[12]) | (~M & p[3] & g[4] & g[5] & g[6] & g[7] & g[8] & g[9] & g[10] & g[11] & g[12]) | (~M & p[2] & g[3] & g[4] & g[5] & g[6] & g[7] & g[8] & g[9] & g[10] & g[11] & g[12]) | (~M & p[1] & g[2] & g[3] & g[4] & g[5] & g[6] & g[7] & g[8] & g[9] & g[10] & g[11] & g[12]) | (~M & p[0] & g[1] & g[2] & g[3] & g[4] & g[5] & g[6] & g[7] & g[8] & g[9] & g[10] & g[11] & g[12]);
    y[14] = (p[14] ^ g[14]) | (~M & p[13]) | (~M & p[12] & g[13]) | (~M & p[11] & g[12] & g[13]) | (~M & p[10] & g[11] & g[12] & g[13]) | (~M & p[9] & g[10] & g[11] & g[12] & g[13]) | (~M & p[8] & g[9] & g[10] & g[11] & g[12] & g[13]) | (~M & p[7] & g[8] & g[9] & g[10] & g[11] & g[12] & g[13]) | (~M & p[6] & g[7] & g[8] & g[9] & g[10] & g[11] & g[12] & g[13]) | (~M & p[5] & g[6] & g[7] & g[8] & g[9] & g[10] & g[11] & g[12] & g[13]) | (~M & p[4] & g[5] & g[6] & g[7] & g[8] & g[9] & g[10] & g[11] & g[12] & g[13]) | (~M & p[3] & g[4] & g[5] & g[6] & g[7] & g[8] & g[9] & g[10] & g[11] & g[12] & g[13]) | (~M & p[2] & g[3] & g[4] & g[5] & g[6] & g[7] & g[8] & g[9] & g[10] & g[11] & g[12] & g[13]) | (~M & p[1] & g[2] & g[3] & g[4] & g[5] & g[6] & g[7] & g[8] & g[9] & g[10] & g[11] & g[12] & g[13]) | (~M & p[0] & g[1] & g[2] & g[3] & g[4] & g[5] & g[6] & g[7] & g[8] & g[9] & g[10] & g[11] & g[12] & g[13]);
    y[15] = (p[15] ^ g[15]) | (~M & p[14]) | (~M & p[13] & g[14]) | (~M & p[12] & g[13] & g[14]) | (~M & p[11] & g[12] & g[13] & g[14]) | (~M & p[10] & g[11] & g[12] & g[13] & g[14]) | (~M & p[9] & g[10] & g[11] & g[12] & g[13] & g[14]) | (~M & p[8] & g[9] & g[10] & g[11] & g[12] & g[13] & g[14]) | (~M & p[7] & g[8] & g[9] & g[10] & g[11] & g[12] & g[13] & g[14]) | (~M & p[6] & g[7] & g[8] & g[9] & g[10] & g[11] & g[12] & g[13] & g[14]) | (~M & p[5] & g[6] & g[7] & g[8] & g[9] & g[10] & g[11] & g[12] & g[13] & g[14]) | (~M & p[4] & g[5] & g[6] & g[7] & g[8] & g[9] & g[10] & g[11] & g[12] & g[13] & g[14]) | (~M & p[3] & g[4] & g[5] & g[6] & g[7] & g[8] & g[9] & g[10] & g[11] & g[12] & g[13] & g[14]) | (~M & p[2] & g[3] & g[4] & g[5] & g[6] & g[7] & g[8] & g[9] & g[10] & g[11] & g[12] & g[13] & g[14]) | (~M & p[1] & g[2] & g[3] & g[4] & g[5] & g[6] & g[7] & g[8] & g[9] & g[10] & g[11] & g[12] & g[13] & g[14]) | (~M & p[0] & g[1] & g[2] & g[3] & g[4] & g[5] & g[6] & g[7] & g[8] & g[9] & g[10] & g[11] & g[12] & g[13] & g[14]);
    co = (~M & p[15]) | (~M & p[14] & g[15]) | (~M & p[13] & g[14] & g[15]) | (~M & p[12] & g[13] & g[14] & g[15]) | (~M & p[11] & g[12] & g[13] & g[14] & g[15]) | (~M & p[10] & g[11] & g[12] & g[13] & g[14] & g[15]) | (~M & p[9] & g[10] & g[11] & g[12] & g[13] & g[14] & g[15]) | (~M & p[8] & g[9] & g[10] & g[11] & g[12] & g[13] & g[14] & g[15]) | (~M & p[7] & g[8] & g[9] & g[10] & g[11] & g[12] & g[13] & g[14] & g[15]) | (~M & p[6] & g[7] & g[8] & g[9] & g[10] & g[11] & g[12] & g[13] & g[14] & g[15]) | (~M & p[5] & g[6] & g[7] & g[8] & g[9] & g[10] & g[11] & g[12] & g[13] & g[14] & g[15]) | (~M & p[4] & g[5] & g[6] & g[7] & g[8] & g[9] & g[10] & g[11] & g[12] & g[13] & g[14] & g[15]) | (~M & p[3] & g[4] & g[5] & g[6] & g[7] & g[8] & g[9] & g[10] & g[11] & g[12] & g[13] & g[14] & g[15]) | (~M & p[2] & g[3] & g[4] & g[5] & g[6] & g[7] & g[8] & g[9] & g[10] & g[11] & g[12] & g[13] & g[14] & g[15]) | (~M & p[1] & g[2] & g[3] & g[4] & g[5] & g[6] & g[7] & g[8] & g[9] & g[10] & g[11] & g[12] & g[13] & g[14] & g[15]) | (~M & p[0] & g[1] & g[2] & g[3] & g[4] & g[5] & g[6] & g[7] & g[8] & g[9] & g[10] & g[11] & g[12] & g[13] & g[14] & g[15]);
end
endmodule // alu74181
