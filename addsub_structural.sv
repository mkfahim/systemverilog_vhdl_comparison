
module xor_1(s, a, b);
   
   output s;
   input a,b;
   
   assign s = a ^ b;
   
endmodule // xor_1

module adder_8(s, co, ofl, a, b, ci);
   
   output [7:0] s;
   output 	co, ofl;
   input [7:0] 	a, b;
   input 	ci;
   
   assign s = a + b + ci;
   assign co = (a[7] & b[7])|(a[7] & ~s[7])|(b[7] & ~s[7]);
   assign ofl = (a[7] & b[7] & ~s[7])|(~a[7] & ~b[7] &s[7]);  
endmodule // adder_8

module addsub_8(s, co, ofl, a, b, sub);

   output [7:0] s;
   output 	co, ofl;
   input [7:0] 	a, b;
   input  	sub; 
  
   wire [7:0] 	xb;
   //assign xb = {8{sub}} ^ b ;//same as above for loop
   generate
   for (genvar i = 0 ; i <= 7 ; i = i + 1) begin
       	//assign xb [i] = sub ^ b [i] ;
	xor_1 myxor(xb[i], b[i], sub);
   end
   endgenerate

   //assign {co, s} = a + xb + sub;
   //assign ofl = (a[7] & xb[7] & ~s[7])|(~a[7] & ~xb[7] &s[7]);
   adder_8 myadder(s, co, ofl, a, xb, sub);
endmodule // addsub_8


