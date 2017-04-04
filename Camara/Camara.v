module Camara(clk,rst,Vsync,Href,Pclk,Xclk,Imagen,Reset,PWDN);

input clk;
input rst;
input Vsync;
input Href;
input Pclk;
input [7:0]Imagen;

output reg Reset=0;
output reg PWDN=0;
output reg Xclk=0;

reg [10:0]SCR_X = 480;
reg [10:0]SCR_V = 640;

reg [7:0]Red =0;
reg [7:0]Green =0;
reg [7:0]Blue =0;

/*
Format			Pixel Data Output		COM7[2] COM7[0] COM15[5] COM15[4]
Raw Bayer RGB	8-bit R or 8-bit G or 8-bit B 				0 1 x 0
Prd_Bay_RGB	8-bit R or 8-bit G or 8-bit B 				1 1 x 0
YUV/YCbCr 	4:2:2 8-bit Y, 8-bit U or 8-bit Y, 8-bit V	 	0 0 x 0
GRB 4:2:2	8-bit G, 8-bit R or 8-bit G, 8-bit B 			1 0 x 0
RGB565		5-bit R, 6-bit G, 5-bit B 				1 0 0 1
RGB555		5-bit R, 5-bit G, 5-bit B 				1 0 1 1


*/


reg [1:0] cont_clk=	0;
reg [23:0]cont_ram=	0;
reg START=	0;


reg [7:0] Memoria [0:(307200-1)]; // 640 x 480	Numero de registros

//--- f_Xclk= 25 Mhz -----------\\

always@(posedge clk)
	begin
	if(rst==1)
	cont_clk=0;
	else
		if(cont_clk==2'b11) //25Mhz
		begin
		Xclk=!Xclk;
		cont_clk=0;
		end
		else
		cont_clk= cont_clk+2'b01;
	end

//-------------------------------\\


always@(posedge Pclk)
	begin
	if(rst==1)
	cont_ram=0;
	else
		if(START==1 && Href==1)
		cont_ram=cont_ram+1'b1;	

	end


//-------------------------------\\


always@(posedge Vsync)
	begin
	START<=!START;	
	end


RAM_imagen ram(.clk_i(clk), .rst_i(Reset), .we_i(START), .adr_i(cont_ram), .dat_i(Imagen));

endmodule


