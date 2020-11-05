module mux_2_1 (
input x1 ,
input x2 ,
input s,
output f
);
assign f = (s & x2) | ((~ s) & x1);
endmodule
module mux_2_1_ternary
(
input x1 ,
input x2 ,
input s,
output f
);
assign f = s==1 ? x2 : x1;
endmodule
module b1_mux_2_1_if
(
input x1 ,
input x2 ,
input s,
output reg f
);
always@ (*)
begin
if(s ==1)
f = x2;
else if (s ==0)
f = x1;
end
endmodule
module b1_mux_2_1_case (
input x1 ,
input x2 ,
input s,
output reg f
);
always@ (*)
begin
case (s)
0: f = x1;
1: f = x2;
endcase
end
endmodule