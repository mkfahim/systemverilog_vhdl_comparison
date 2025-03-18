
`timescale 1ns / 1ns // to run system verilog simulation in quartus



///  testbench to implement timings with reset using  =
module test_project;

reg clk, rst;
reg [10:0] pc; 
wire alu_logic, load_logic, store_logic, branch_logic;

project uut( clk , pc , rst, alu_logic, load_logic, 
	store_logic, branch_logic);

real half_period = 20/2;           
initial
begin
    clk = 1;
    //forever #10 clk = ~clk;
    forever #half_period clk = ~clk;
end
 
initial
begin 

   pc = 11'b00000000100;// for reset 
   rst = 1;
   #100;
           
   pc = 11'b00000000100;//assuming 'and' is at pc address value=4
   rst = 0;
   #100;

   pc = 11'b01000000000;//'lw' is at pc address value=512
   rst = 0;
   #100;

   pc = 11'b01010000000;//assuming 'sw' is at pc address value=640
   rst = 0;
   #100;

   pc = 11'b01011000000;//assuming 'br' is at pc address value=704
   rst = 0;
   #100;

   pc = 11'bxxxxxxxxxxx;//rest
   rst = 1;
   #100;

end
endmodule
