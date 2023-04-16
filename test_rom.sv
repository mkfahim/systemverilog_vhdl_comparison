
//test bench for program_rom
module test_bench;
   	reg [7:0] pc;
   	wire [15:0] code;
   	integer i;
program_rom uut(pc, code);


initial begin

      	pc = 8'h00;
      	//pc = 8'b00000000;
      	#10;
      	for (i = 1;i <= 8;i = i + 1)
      	begin
       		pc = pc + 8'h01;
       		//pc = pc + 8'b00000001;
		//pc = pc + 2;
       		#10;
      	end;   
      	pc = 8'b11111111;
      	#10;
end

endmodule