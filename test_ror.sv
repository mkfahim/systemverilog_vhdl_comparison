
// test bench for rotate right logic
module testbench;

wire [7:0] s;
reg [7:0] 	a, b;
integer i;
rotate_right_8 ror(s, a, b);

initial begin
     	#0 a = 8'h00;b = 8'h00;
	#10;
      	for (i = 1;i <= 7;i = i + 1)
      	begin
       		a = a + 8'h04;
		b = b + 8'h01;
     		#10;
      	end; 
	a = 8'hF6;
      	b = 8'h0A;
	#10;
end
endmodule