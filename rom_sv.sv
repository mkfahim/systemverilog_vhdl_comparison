
// ROM: we store the program here, without input file
module program_rom(pc, code);

  	output [15:0] code;
  	input [7:0] pc;

	wire [15:0] rom[255:0];
  	//reg [15:0] rom[255:0];
  	
	assign rom[0] = 16'h0000;// with rom as wire
	assign rom[1] = 16'h1111;
	assign rom[2] = 16'h2222;
	assign rom[3] = 16'h3333;
	assign rom[4] = 16'h4444;
	assign rom[5] = 16'h5555;
	assign rom[6] = 16'h6666;
	assign rom[7] = 16'h7777;
	assign rom[8] = 16'h8888;
	assign rom[9] = 16'h9999;
	assign rom[10] = 16'hffff;

//initial
//begin
//	rom[0] = 16'h0000;// with rom as reg
//	rom[1] = 16'h1111;
//	rom[2] = 16'h2222;
//	rom[3] = 16'h3333;
//	rom[4] = 16'h4444;
//	rom[5] = 16'h5555;
//	rom[6] = 16'h6666;
//	rom[7] = 16'h7777;
//	rom[8] = 16'h8888;
//	rom[9] = 16'h9999;
//	rom[10] = 16'hffff;
//end

  	assign code = rom[pc];
endmodule // program_rom