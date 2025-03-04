
`timescale 1ns / 1ns // to run system verilog simulation in quartus


/// classify testbench
module test_project;

reg clk;
reg [10:0] pc; 
wire alu_logic, load_logic, store_logic, branch_logic;

project uut( clk , pc , alu_logic, load_logic, 
	store_logic, branch_logic);
            
initial
begin
    clk = 0;
    forever #10 clk = ~clk;
end
 
initial
begin 

   pc = 11'b00000000001;//assuming 'j' at invalid pc address value=1 
   #40;
           
   pc = 11'b00000000100;//assuming 'and' is at pc address value=4
   #40;

   pc = 11'b00000001000;//assuming 'addi' is at pc address value=8
   #40;

   pc = 11'b01000000000;//'lw' is at pc address value=512
   #40;

   pc = 11'b01010000000;//assuming 'sw' is at pc address value=640
   #40;

   pc = 11'b01011000000;//assuming 'br' is at pc address value=704
   #40;

end
endmodule