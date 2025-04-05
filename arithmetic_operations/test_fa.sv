


// test bench of adder 8 bit
module testbench;  
    	// 1. Declare testbench variables  
   	reg [7:0] a;  
   	reg [7:0] b;  
   	reg ci;  
   	wire [7:0] s;  
   	wire co;
   	integer i;  
  
    	// 2. Instantiate the design and connect to testbench variables  
adder_8  fa0 (s, co, of, a, b, ci); 
  
    	// 3. Provide stimulus to test the design  
initial begin  
      	a <= 0;  
      	b <= 0;  
      	ci <= 0;    
  	#10;
      	// Use a for loop to apply random values to the input  
      	for (i = 0; i < 5; i = i+1) begin  
         	a <= $random;  
             	b <= $random;  
             	ci <= $random;  
		#10;
      	end  
	a <= 8'haa;  
      	b <= 8'h55;  
      	ci <= 0;
end  
endmodule



