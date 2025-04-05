

module adder(s, co, a, b, ci);

   	output s, co;
   	input  a, b, ci;
   
//   	wire [1:0] Result;
//   	assign Result = a + b + ci;
//   	assign s = Result[0];
//   	assign co = Result[1];
 
   	assign {co,s} = a + b + ci;  
endmodule // adder

module mux2to1(in0, in1, sel, out);
   
   	output out;
   	input  in0, in1, sel;
   	assign out = sel? in1:in0;
   
endmodule // mux2to1


//structural model carry select adder
module adder_8(s, co, os, a, b, ci);
   
   	output [7:0] s;
   	output 	co, os;
   	input [7:0] 	a, b;
   	input 	ci;
   
   	wire 	c1, c2, c3, c4, c5, c6, c7;
   	wire 	[3:0] s47_0,s47_1,c47_0,c47_1;

   	adder a0(s[0], c1, a[0], b[0], ci);
   	adder a1(s[1], c2, a[1], b[1], c1);
   	adder a2(s[2], c3, a[2], b[2], c2);
   	adder a3(s[3], c4, a[3], b[3], c3);
//	adder a4(s[4], c5, a[4], b[4], c4);
//	adder a5(s[5], c6, a[5], b[5], c5);
//	adder a6(s[6], c7, a[6], b[6], c6);
//	adder a7(s[7], co, a[7], b[7], c7);

   //for carry 0
   	adder a04(s47_0[0], c47_0[0], a[4], b[4], 1'b0);
   	adder a05(s47_0[1], c47_0[1], a[5], b[5], c47_0[0]);
   	adder a06(s47_0[2], c47_0[2], a[6], b[6], c47_0[1]);
   	adder a07(s47_0[3], c47_0[3], a[7], b[7], c47_0[2]);

   //for carry 1
   	adder a14(s47_1[0], c47_1[0], a[4], b[4], 1'b1);
   	adder a15(s47_1[1], c47_1[1], a[5], b[5], c47_1[0]);
   	adder a16(s47_1[2], c47_1[2], a[6], b[6], c47_1[1]);
   	adder a17(s47_1[3], c47_1[3], a[7], b[7], c47_1[2]);
//
   //mux for carry and offset
   	mux2to1 mux_carry(c47_0[3],c47_1[3],c4,co);
   	mux2to1 mux_offset(c47_0[2],c47_1[2],c4,c7);

   //muxes for sum
   	mux2to1 mux_sum0(s47_0[0],s47_1[0],c4,s[4]);
   	mux2to1 mux_sum1(s47_0[1],s47_1[1],c4,s[5]);
   	mux2to1 mux_sum2(s47_0[2],s47_1[2],c4,s[6]);
   	mux2to1 mux_sum3(s47_0[3],s47_1[3],c4,s[7]);

   	xor(os, co, c7);
   
endmodule // csa_8



