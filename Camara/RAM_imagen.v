
module RAM_imagen (
	input             clk_i, 
	input             rst_i,
	//
	input      [23:0] wb_adr_i,
	output reg [7:0] wb_dat_o,
	input      [7:0] wb_dat_i,
);

parameter word_depth = 307200; //640 x480
parameter word_width = 8;

//-----------------------------------------------------------------
// 
//-----------------------------------------------------------------
reg            [7:0] ram [0:word_depth-1];    // actual RAM

always @(posedge clk_i)
begin
	if (wb_we_i) 
		ram[ adr ] <= wb_dat_i;
    
end


