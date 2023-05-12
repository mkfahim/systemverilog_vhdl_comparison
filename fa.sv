


//behavioral model
module adder_8(s, co, of, a, b, ci);
   
   output [7:0] s;
   output 	co, of;
   input [7:0] 	a, b;
   input 	ci;
   
   wire [8:0] Result; 
   //assign {co, s} = a + b + ci;
   //assign s = a + b + ci;
   //assign co = (a[7] & b[7])|(a[7] & ~s[7])|(b[7] & ~s[7]);

   assign Result = a + b + ci;
   assign s = Result[7:0];
   assign co = Result[8]; 

   assign of = (a[7] & b[7] & ~s[7])|(~a[7] & ~b[7] &s[7]);  
endmodule // adder_8



