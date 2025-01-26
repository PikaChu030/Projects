module HA(
input        a,
input        b,
output       s,
output       c
);

xor #(0.5,0.5) (s,a,b);
and #(0.5,0.5) (c,a,b);


endmodule
