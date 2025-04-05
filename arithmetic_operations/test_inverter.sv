
module test;
	reg i;
	wire o;
inverter uut(i,o);
	initial
	begin
		#0 i=0;
		#10 i=1;
	end
endmodule