


module addsub_8(s, co, ofl, a, b, sub);

   output [7:0] s;
   output 	co, ofl;
   input [7:0] 	a, b;
   input  	sub; 
  
   //wire [7:0] 	xb;
   wire [8:0] Result;

//   assign xb[0] = b[0] ^ sub;
//   assign xb[1] = b[1] ^ sub;
//   assign xb[2] = b[2] ^ sub;
//   assign xb[3] = b[3] ^ sub;
//   assign xb[4] = b[4] ^ sub;
//   assign xb[5] = b[5] ^ sub;
//   assign xb[6] = b[6] ^ sub;
//   assign xb[7] = b[7] ^ sub;
//   generate
//   for (genvar i = 0 ; i <= 7 ; i = i + 1) begin
//       assign xb [i] = sub ^ b [i] ;
//   end
//   endgenerate
//   assign xb = {8{sub}} ^ b ;//same as above for loop
//
////   assign {co, s} = a + xb + sub;
//   assign Result = a + xb + sub;
//   assign s = Result [7:0];
//   assign co = Result [8];

   //assign ofl = (a[7] & xb[7] & ~s[7])|(~a[7] & ~xb[7] &s[7]);

////////////////////////////////////
   //assign {Result[8], Result[7:0]} = sub?(a - b):(a + b);
   assign Result = sub?(a - b):(a + b);
   assign s = Result[7:0];
   assign co = Result[8] ^ sub; 
   assign ofl = (a[7] & (b[7]^sub) & ~s[7])|(~a[7] & ~(b[7]^sub) &s[7]);
   
endmodule // addsub_8


