

module xor_1(s, a, b);
   
   output s;
   input a,b;
   
   assign s = a ^ b;
   
endmodule // xor_1


// structural model of half_adder
module half_adder(s, c, a, b);

   output s, c;
   input  a, b;

   assign s = a ^ b;
   assign c = a & b;   
endmodule // half_adder


//behavioral model of level 1 cla
module l1_adder_cla_4(s, co, a, b, ci, c3);  

   output [3:0] s;
   output	co, c3;
   input  [3:0] a, b;
   input 	ci;
   
   wire   [3:1] c;
   wire  [3:0] g, p;
   
   //assign g[3:0] = a[3:0] & b[3:0];//gi = ai & bi
   //assign p[3:0] = a[3:0] ^ b[3:0];// pi = ai xor bi
   half_adder a0[3:0](p, g, a, b);

   assign c[1] = g[0] | (p[0] & ci);//c1 = g0 + p0c0
   assign c[2] = g[1] | (g[0] & p[1]) | (p[1] & p[0] & ci);//c2 = g1 + p1c1
   assign c[3] = g[2] | (g[1] & p[2]) | (g[0] & p[2] & p[1]) |
	(p[2] & p[1] & p[0] & ci);// c3 = g2 + p2c2
   assign co = g[3] | (g[2] & p[3]) | (g[1] & p[3] & p[2]) | 
	(g[0] & p[3] & p[2] & p[1]) | (p[3] & p[2] & p[1] & p[0] & ci);// c4 = g3 + p3c3
   assign s[0] = p[0] ^ ci;// si = pi xor ci
   //assign s[3:1] = p[3:1] ^ c[3:1];
   generate
   for (genvar i = 1;i <= 3; i = i + 1)
   begin
	xor_1 myaxor2(s[i],p[i],c[i]);//works too
   end
   endgenerate
   assign c3 = c[3];

endmodule


//structral model carry look ahead adder
module adder_8(s, co, of, a, b, ci);
   
   output [7:0] s;
   output 	co, of;
   input [7:0] 	a, b;
   input 	ci;
 
   wire   c3, c4, c7;

   l1_adder_cla_4 a0(s[3:0], c4, a[3:0], b[3:0], ci, c3 ); 
   l1_adder_cla_4 a1(s[7:4], co, a[7:4], b[7:4], c4, c7);

   assign of = co ^ c7;
endmodule // adder_8

