`timescale 1ns/1ps
`define SIMULATION

module Camera_TB;

	reg clk=0;
	reg rst=0;
	reg Vsync=0;
	reg Href=0;
	reg Pclk=0;
	reg [7:0]Imagen=0;
	
	wire Reset;
	wire PWDN;
	wire Xclk;

	parameter tiempo = 500;

	Camera Sim(clk,rst,Vsync,Href,Pclk,Xclk,Imagen,Reset,PWDN);
	
	always #5 clk=!clk;
	always #10 Pclk=!Pclk;
	always #43 Href=!Href;


	initial
		begin
		Vsync=1;
		#2
		Vsync=0;
		Imagen=8'b10101010;
		#10
		Imagen=8'b11111111;
		#10
		Imagen=8'b00000000;
		#10
		Imagen=8'b01010101;
		#10
		Imagen=8'b10101010;
		#10
		Imagen=8'b11111111;
		#10
		Imagen=8'b00000000;
		#10
		Imagen=8'b01010101;
		#10
		Imagen=8'b10101010;
		#10
		Imagen=8'b11111111;
		#10
		Imagen=8'b00000000;
		#10
		Imagen=8'b01010101;
		#10

		
		#(tiempo)$finish;
	end
	


	initial begin: TEST_WAVE
		$dumpfile("Camara_TB.vcd");
		$dumpvars(-1, Sim);
	end

endmodule







