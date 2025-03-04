`timescale 1ns / 1ns // to run system verilog simulation in quartus







////  Classify
module project(clk, pc, alu_logic, load_logic, 
		store_logic, branch_logic);
   	input [10:0] pc;
   	input 	clk;
	output reg alu_logic, load_logic, 
		store_logic, branch_logic;

/////  function to classify instruction type
function reg [1:0] classify (input [10:0] pc_addr);
//function [1:0] classify (input [10:0] pc_addr);
reg [1:0] f;
//integer int_;
int int_;
begin
int_ = pc_addr;
	if (int_ >= 0 && int_ <= 500)  // alu/j
		assign f = 2'b00;
		//f = 2'b00;
	else if (int_ >= 504 && int_ <= 600)// --load
		assign f = 2'b01; 
		//f = 2'b01;  
	else if (int_ >= 604 && int_ <= 700)//store
   		assign f = 2'b10;
		//f = 2'b10;
	else //--- br;
    		assign f = 2'b11;
		//f = 2'b11;
	//return f;
	classify = f;
end
endfunction:classify

always @(posedge clk)
begin
reg [1:0] f;
int int_;
int_ = pc;

//	if (int_ >= 0 && int_ <= 500)  // alu/j
//		alu_logic <= 1;
//	else if (int_ >= 504 && int_ <= 600)// --load
//		load_logic <= 1; 
//	else if (int_ >= 604 && int_ <= 700)//store
//   		store_logic <= 1;
//	else //--- br;
//    		branch_logic <= 1;

//	if (int_ >= 0 && int_ <= 500)  // alu/j
//		//assign f = 2'b00;
//		f = 2'b00;
//	else if (int_ >= 504 && int_ <= 600)// --load
//		//assign f = 2'b01; 
//		f = 2'b01; 
//	else if (int_ >= 604 && int_ <= 700)//store
//   		//assign f = 2'b10;
//		f = 2'b10;
//	else //--- br;
//    		//assign f = 2'b11;
//		f = 2'b11;;

//		assign f = classify(pc); 
		f = classify(pc);
//
		if (f == 2'b00)
			alu_logic <= 1;
		else if(f == 2'b01)
			load_logic <= 1;
		else if (f == 2'b10)
			store_logic <= 1;
		else
			branch_logic <= 1;
end //(always)  
endmodule



