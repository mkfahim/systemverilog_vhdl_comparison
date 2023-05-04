


// PC: program counter
//behavioral model
module P_C(pc, power, clk, branch_pc, branch_en, stop_en, next_pc);

   output [7:0] pc, next_pc;
   input 	power, clk, branch_en, stop_en;
   input [7:0] 	branch_pc;
   
   reg [7:0] pc;  
   wire [7:0] 	inc_pc, temp_pc0, temp_pc1;
    
   always @(posedge clk)
   begin
     pc <= next_pc; //pc must be reg for this non-blocking assignment
   end

//   reg 	 [7:0] next_pc;// for use in below always only
//   always@(power or stop_en or branch_en or pc)
//   //always @(*)
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
  
//   assign next_pc = ~power? 8'b0: 
//		      stop_en? pc: 
//		      branch_en? branch_pc:
//			(pc + 1);

   assign inc_pc = pc + 1; 
   assign temp_pc0 = branch_en? branch_pc:inc_pc;
   assign temp_pc1 = stop_en? pc:temp_pc0;
   assign next_pc = power? temp_pc1: 8'b0;
endmodule // PC

