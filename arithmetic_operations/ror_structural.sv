

module mux2to1_8(in0, in1, sel, out);

   output [7:0] out;
   input [7:0] 	in0, in1;
   input 	sel;

   assign out = sel? in1:in0;//data flow modeling/continuous assignment
endmodule // mux2to1_8

// behavioral model rotate right b is 2:0 for ror
module rotate_right_8(s, a, b);
   
   output [7:0] s;
   input [7:0] 	a, b;
   wire [7:0] s1, s2;
//
//   reg [7:0] s;
//   //always@(a or b)
//   always@(*)
//   begin
//	if (b[2:0] == 0)
//		s = a;//000
//	else if (b[2:0] == 1)
//		s = {a[0],a[7:1]};//001
//	else if (b[2:0] == 2)
//		s = {a[1:0],a[7:2]};//010
//	else if (b[2:0] == 3)
//		s = {a[2:0],a[7:3]};//011
//	else if (b[2:0] == 4)
//		s = {a[3:0],a[7:4]};//100
//	else if (b[2:0] == 5)
//		s = {a[4:0],a[7:5]};//101
//	else if (b[2:0] == 6)
//		s = {a[5:0],a[7:6]};//110
//	else if (b[2:0] == 7)
//		s = {a[6:0],a[7]};//111
//	else 
//		s = 8'hzz;
//   end 
//
   //assign s1 = b[0] ? {a[0],a[7:1]} : a;
   mux2to1_8 mux1(a, {a[0],a[7:1]}, b[0], s1);
   //assign s2 = b[1] ? {s1[1:0],s1[7:2]} : s1;
   mux2to1_8 mux2(s1, {s1[1:0],s1[7:2]}, b[1], s2);
   //assign s = b[2] ? {s2[3:0],s2[7:4]} : s2;
   mux2to1_8 mux4(s2, {s2[3:0],s2[7:4]}, b[2], s);

endmodule // rotate_right_8
