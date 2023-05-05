


//test bench for PC
module testbench;
   wire [7:0] pc, next_pc;
   reg 	power, clk, branch_en, stop_en;
   reg [7:0] 	branch_pc;

P_C uut(pc, power, clk, branch_pc, branch_en, stop_en, next_pc);

initial begin
	clk = 1;
	forever #5 clk = ~clk;
end

initial begin

//	clk = 1;

	power = 0; stop_en = 0; branch_en = 0;
	branch_pc =8'b00000000;
	#10;

	power = 1'b0; stop_en =1'b0 ; branch_en = 1'b1 ;
	branch_pc =8'b00000001;
	#10;

	power = 1'b0; stop_en = 1'b1; branch_en = 1'b0;
	branch_pc =8'b00000010;
	#10;

	power = 1'b0; stop_en = 1'b1; branch_en = 1'b1;
	branch_pc =8'b00000011;
	#10;

	power= 1'b1; stop_en = 1'b0; branch_en = 1'b0;
	branch_pc =8'b00000100;
	#10;

	power= 1'b1; stop_en = 1'b0; branch_en = 1'b1;
	branch_pc =8'b00000101;
	#10;

	power= 1'b1; stop_en = 1'b1; branch_en = 1'b0;
	branch_pc =8'b00001000;
	#10;

	power= 1'b1; stop_en = 1'b1; branch_en = 1'b1;
	branch_pc =8'b10000000;
	#10;

	power= 1'b1; stop_en = 1'b0; branch_en = 1'b1;
	branch_pc =8'b11111111;
	#10;

	power= 1'b1; stop_en = 1'b0; branch_en = 1'b0;
	branch_pc =8'b01000000;
	#10;

end

//always #5 clk = ~clk;

endmodule
