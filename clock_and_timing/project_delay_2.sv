`timescale 1ns / 1ns // to run system verilog simulation in quartus

////  to implement timings with reset
module project(clk, pc, rst, alu_logic, load_logic, 
		store_logic, branch_logic);
   	input [10:0] pc;
   	input 	clk, rst;
	output reg alu_logic, load_logic, 
		store_logic, branch_logic;

//always @(posedge clk)// wont work
always @(posedge clk or posedge rst)// wont work too
//always @(*)//  only this works
begin
int int_;
int_ = pc;
	if (rst)
	begin
		alu_logic <= 0;
		load_logic <= 0;
		store_logic <= 0;
		branch_logic <= 0; 
	end
	else
	begin
	if (int_ >= 0 && int_ <= 500)begin  // alu/j
		//alu_logic <= 1; 
		//alu_logic <= #20 1; 
		//#20 alu_logic <= 1;	
		//alu_logic <= repeat (1) @(posedge clk) 1;
		repeat (1) @(posedge clk) alu_logic <= 1;
		//repeat (1) @(posedge clk); alu_logic <= 1; 
		//repeat (1) @(clk); alu_logic <= 1;
		load_logic <= 0;
		store_logic <= 0;
		branch_logic <= 0; end

	else if (int_ >= 504 && int_ <= 600)begin // --load
		//load_logic <= 1;
		//load_logic <= #40 1;	
		//#40 load_logic <= 1;
		//load_logic <= repeat (2) @(posedge clk) 1;	
		repeat (2) @(posedge clk) load_logic <= 1;	
		//repeat (2) @(posedge clk);load_logic <= 1; 
		//repeat (2) @(clk);load_logic <= 1;	
		alu_logic <= 0;
		store_logic <= 0;
		branch_logic <= 0;end 


	else if (int_ >= 604 && int_ <= 700)begin//store
   		//store_logic <= 1;
		//store_logic <= #60 1;		
		//#60 store_logic <= 1;
		//store_logic <= repeat (3) @(posedge clk) 1;
		repeat (3) @(posedge clk) store_logic <= 1;
		//repeat (3) @(posedge clk);store_logic <= 1; 
		//repeat (3) @(clk);store_logic <= 1; 
		alu_logic <= 0;
		load_logic <= 0;
		branch_logic <= 0; end

	else begin //--- br;
		//branch_logic <= 1;
    		//branch_logic <= #80 1;
		//#80 branch_logic <= 1;				
		//branch_logic <= repeat (4) @(posedge clk) 1;	
		repeat (4) @(posedge clk) branch_logic <= 1;
		//repeat (4) @(posedge clk);branch_logic <= 1; 
		//repeat (4) @(clk);branch_logic <= 1;
		alu_logic <= 0;
		load_logic <= 0;
		store_logic <= 0;end

	end
end //(always)  
endmodule





