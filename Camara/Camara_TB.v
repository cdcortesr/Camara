`timescale 1ns/1ps
`define SIMULATION

module Camara_TB;

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

	Camara Sim(clk,rst,Vsync,Href,Pclk,Xclk,Imagen,Reset,PWDN);
	
	always #5 clk=!clk;

	initial
		begin
		#(tiempo)$finish;
	end
	


	initial begin: TEST_WAVE
		$dumpfile("Camara_TB.vcd");
		$dumpvars(-1, Sim);
	end

endmodule







