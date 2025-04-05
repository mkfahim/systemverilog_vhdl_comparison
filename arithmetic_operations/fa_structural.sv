
module xor_1(s, a, b);
   
   output s;
   input a,b;
   
   //assign s = a ^ b);
   assign s = a!=b ? 1'b1:1'b0; 
endmodule // xor
//
module adder(s, co, a, b, ci);

   output s, co;
   input  a, b, ci;
   
   wire [1:0] Result;

   assign Result = a + b + ci;
   assign s = Result[0];
   assign co = Result[1];    
endmodule // adder

//structural model
module adder_8(s, co, of, a, b, ci);
   
   output [7:0] s;
   output 	co, of;
   input [7:0] 	a, b;
   input 	ci;
 
   wire c1, c2, c3, c4, c5, c6, c7;
//   wire [8:0] Result; 
//
//   assign Result = a + b + ci;
//   assign s = Result[7:0];
//   assign co = Result[8]; 
//   assign of = (a[7] & b[7] & ~s[7])|(~a[7] & ~b[7] &s[7]);     
   
   adder a0(s[0], c1, a[0], b[0], ci);
   adder a1(s[1], c2, a[1], b[1], c1);
   adder a2(s[2], c3, a[2], b[2], c2);
   adder a3(s[3], c4, a[3], b[3], c3);
   adder a4(s[4], c5, a[4], b[4], c4);
   adder a5(s[5], c6, a[5], b[5], c5);
   adder a6(s[6], c7, a[6], b[6], c6);
   adder a7(s[7], co, a[7], b[7], c7);  
   //assign of = c7 ^ co;
   xor_1 x1(of, c7, co);
endmodule // adder_8



