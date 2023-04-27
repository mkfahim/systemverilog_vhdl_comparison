

// behavioral model shift right logic b is 2:0 for sra
module shift_right_arithmetic_8(s, a, b);
   
   output [7:0] s;
   input [7:0] 	a, b;
   wire [7:0] s1, s2;

   //assign s = $signed(a) >>> b[2:0]; 

//   reg [7:0] s;
//   always@(*)
//   begin
//	if (b[2:0] == 0)
//		s = a;
//	else if (b[2:0] == 1)
//		s = {a[7],a[7:1]};
//	else if (b[2:0] == 2)
//		s = {a[7],a[7],a[7:2]};
//	else if (b[2:0] == 3)
//		s = {a[7],a[7],a[7],a[7:3]};
//	else if (b[2:0] == 4)
//		s = {a[7],a[7],a[7],a[7],a[7:4]};
//	else if (b[2:0] == 5)
//		s = {a[7],a[7],a[7],a[7],a[7],a[7:5]};
//	else if (b[2:0] == 6)
//		s = {a[7],a[7],a[7],a[7],a[7],a[7],a[7:6]};
//	else if (b[2:0] == 7)
//		s = {a[7],a[7],a[7],a[7],a[7],a[7],a[7],a[7]};
//	else 
//		s = 8'hzz;
//   end 
   
   assign s1 = b[0] ? {a[7], a[7:1]}: a;
   assign s2 = b[1] ? {s1[7], s1[7], s1[7:2]}: s1;
   assign s = b[2] ? {s2[7], s2[7], s2[7], s2[7], s2[7:4]}: s2;
//   
endmodule // shift_right_arithmetic_8
