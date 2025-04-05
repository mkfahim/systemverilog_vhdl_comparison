

// test bench of addsub_8
module test_bench;  
    	// 1. Declare testbench variables  
   	reg [7:0] a;  
   	reg [7:0] b;  
   	reg sub;  
   	wire [7:0] s;  
   	wire co, ofl;
   	integer i;  
  
    	// 2. Instantiate the design and connect to testbench variables  
addsub_8  fa0 (s, co, ofl, a, b, sub); 
  
    	// 3. Provide stimulus to test the design  
initial begin  
      	a <= 0;  
      	b <= 4;  
      	sub <= 0;    
      	  
      	// Use a for loop to apply random values to the input  
      	for (i = 0; i < 5; i = i+1) begin  
         	#10 a <= $random;  
             	b <= $random;  
             	sub <= $random;  
      	end 
	#10;
	a = 8'hF6;
      	b = 8'h0A; 
	sub <= 0;
end  
endmodule


