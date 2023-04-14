module adder(s, co, a, b, ci);

   output s, co;
   input  a, b, ci;
   
   assign {co, s} = a + b + ci;
   
endmodule // adder