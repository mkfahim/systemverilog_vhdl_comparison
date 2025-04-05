

// behavioral model for shift left (its not a shift  register)
module shift_left_logic_8(s, a, b);
   
   output [7:0] s;
   input [7:0] 	a, b;   
   wire [7:0] s1, s2;

   //assign s = a << b[2:0]; //this is shift left 

//   assign s = (b[2:0] == 0) ? a:// 000
//              (b[2:0] == 1) ? {a[6:0],1'b0}://001
//   	      (b[2:0] == 2) ? {a[5:0],2'b0}://010
//              (b[2:0] == 3) ? {a[4:0],3'b0}://011
//   	      (b[2:0] == 4) ? {a[3:0],4'b0}://100
//              (b[2:0] == 5) ? {a[2:0],5'b0}://101
//   	      (b[2:0] == 6) ? {a[1:0],6'b0}://110
//	      (b[2:0] == 7) ? {a[0],7'b0}://111
//	      8'hzz;

   assign s1 = b[0]? {a[6:0],1'b0}: a; 
   assign s2 = b[1]? {s1[5:0],2'b0}: s1; 
   assign s = b[2] ? {s2[3:0],4'b0}:s2; 

endmodule // shift_left_logic_8