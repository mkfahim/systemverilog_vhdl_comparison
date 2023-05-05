

module dff_8(d, clk, q);
   
   output [7:0] q;
   input [7:0] 	d;
   input 	clk;	
   reg 	 [7:0] q;
   
   always @(posedge clk)
     q <= d;     

endmodule // dff_8

module inc_8(s, a);
   
   output [7:0] s;
   input [7:0] 	a;
   assign s = a + 1;   
endmodule // inc_8

module mux2to1_8(in0, in1, sel, out);

   output [7:0] out;
   input [7:0] 	in0, in1;
   input 	sel;
   assign out = sel? in1:in0;//data flow modeling/continuous assignment
endmodule // mux2to1_8


// PC: program counter
module P_C(pc, power, clk, branch_pc, branch_en, stop_en, next_pc);

   output [7:0] pc, next_pc;
   input 	power, clk, branch_en, stop_en;
   input [7:0] 	branch_pc;
   
   reg [7:0] pc;  
   wire [7:0] 	inc_pc, temp_pc0, temp_pc1;
    
//   always @(posedge clk)
//   begin
//     pc <= next_pc; //pc must be reg for this non-blocking assignment
//   end
   dff_8 d(next_pc, clk, pc);

//   reg 	 [7:0] next_pc;// for use in below always only
//   always@(power or stop_en or branch_en or pc)
//   begin
//	if (power)
//	begin			
//		if (stop_en)
//		begin
//			next_pc = pc;// next_pc must be reg for this
//		end
//		else 
//		begin
//			if (branch_en)
//				next_pc = branch_pc;//blocking
//			else 
//				next_pc = pc + 1;
//		end
//	end
//	else
//		next_pc = 8'b0;
//   end
  
//   assign inc_pc = pc + 1;    
//   assign temp_pc0 = branch_en? branch_pc:inc_pc;
//   assign temp_pc1 = stop_en? pc:temp_pc0;
//   assign next_pc = power? temp_pc1: 8'b0;

   inc_8 myinc(inc_pc, pc);
   mux2to1_8 mux0(inc_pc, branch_pc, branch_en, temp_pc0);
   mux2to1_8 mux1(temp_pc0, pc, stop_en, temp_pc1);
   mux2to1_8 mux2(8'b0, temp_pc1, power, next_pc);
endmodule // PC

