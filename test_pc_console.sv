

//other test bench for PC
module testbench;
   wire [7:0] pc, next_pc;
   reg 	power, clk, branch_en, stop_en;
   reg [7:0] 	branch_pc;
   
   reg stop;
   reg [15:0] cycles;

P_C uut(pc, power, clk, branch_pc, branch_en, stop_en, next_pc);

initial begin
	clk = 0;
	forever #5 clk = ~clk;
end

initial begin

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

initial begin
      	stop = 1'b0;//
      	cycles = 16'b0;//  
	$timeformat(-9, 2, " ns", 15); // to display ns with time in display 
end

always @(negedge clk) 
begin 
	cycles <= cycles + 1; 
	if (stop)
	begin
	   //$display("Time:%t  Instance: /%m ",$time);// %m to see module name
	   //$display("** Note:%d: pc=%d, stop program",
		    //cycles, pc);
	   $strobe("Time:%t  Instance: /%m ",$time);
	   $strobe("** Note:%d: pc=%d, stop program",
		    cycles, pc);
	   //$write("Time:%t  Instance: /%m \n",$realtime);
	   //$write("** Note:%d: pc=%d, stop program\n",
		    //cycles, pc);
           $finish;//to end simulation
	   //$stop;
	end 
	else
	begin
	   if (~power)
	   begin
		//$display("Time:%t  Instance: /%m ",$time);
		//$display("** Note:%d: pwr=%b, pc=%d, npc=%d",
			 //cycles, power, pc, next_pc);
		$strobe("Time:%t  Instance: /%m ",$time);
		$strobe("** Note:%d: pwr=%b, pc=%d, npc=%d",
			cycles, power, pc, next_pc);
		//$write("Time:%t  Instance: /%m \n",$realtime);
		//$write("** Note:%d: pwr=%b, pc=%d, npc=%d\n",
			 //cycles, power, pc, next_pc);
	   end
	   else
	   begin
		if (stop_en)
		begin
		    //$display("Time:%t  Instance: /%m ",$time);
		    //$display("** Note:%d: pwr=%b, pc=%d, npc=%d, stop",
			      //cycles, power, pc, next_pc);
		    $strobe("Time:%t  Instance: /%m ",$time);
		    $strobe("** Note:%d: pwr=%b, pc=%d, npc=%d, stop",
			     cycles, power, pc, next_pc);
		    //$write("Time:%t  Instance: /%m \n",$realtime);
		    //$write("** Note:%d: pwr=%b, pc=%d, npc=%d, stop\n",
			      //cycles, power, pc, next_pc);
		    stop = 1;
		end
		else
		begin
		   if (branch_en)
		   begin
		       	//$display("Time:%t  Instance: /%m",$time);
		       	//$display("** Note:%d: pwr=%b, pc=%d, npc=%d, branch to %d",
				//cycles, power, pc, next_pc, branch_pc);
			$strobe("Time:%t  Instance: /%m ",$time);
		       	$strobe("** Note:%d: pwr=%b, pc=%d, npc=%d branch to %d",
				cycles, power, pc, next_pc, branch_pc);
			//$write("Time:%t  Instance: /%m \n",$realtime);
			//$write("** Note:%d: pwr=%b, pc=%d, npc=%d, branch to %d\n",
				//cycles, power, pc, next_pc, branch_pc);
		   end
		   else
		   begin
			//$display("Time:%t  Instance: /%m ",$time);
		       	//$display("** Note:%d: pwr=%b, pc=%d, npc=%d, inc_pc %d",
				//cycles, power, pc, next_pc, pc + 1);
			$strobe("Time:%t  Instance: /%m ",$time);
			$strobe("** Note:%d: pwr=%b, pc=%d, npc=%d, inc_pc %d",
				cycles, power, pc, next_pc, pc + 1);
			//$write("Time:%t  Instance: /%m \n",$realtime);
			//$write("** Note:%d: pwr=%b, pc=%d, npc=%d, inc_pc %d\n",
				//cycles, power, pc, next_pc, pc + 1);
		     end
		 end // else: !if(branch_en)
	     end // else: !if(power)
	end // else: !if(stop)
end // always @ (negedge clk)

endmodule

