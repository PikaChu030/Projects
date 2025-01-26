`include "./HA.v"
module FA(
input        x,
input        y,
input        cin,
output       s,
output       cout
);

wire         s1, c1, c2;

HA HA_1(.s(s1), .c(c1), .a(x), .b(y));
HA HA_2(.s(s), .c(c2), .a(cin), .b(s1));
or #(0.5,0.5) (cout, c1, c2);
  
endmodule
