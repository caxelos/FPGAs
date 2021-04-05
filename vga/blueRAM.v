


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:11:29 11/26/2016 
// Design Name: 
// Module Name:    VRAM 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module blueRAM(
   input CLK,
	input SSR,//reset here
	input EN,
	input WE,
	input [13:0] ADDR_IN,
	input DATA_IN,
	output DATA_OUT
);


		
/*
 - 16Kx1 VRAM memory(single-port) 

 - I create 3 instances of that module, one for each color
 to make the 128x96MEM
 - I need the 3/4 of this memory

*/ 

   RAMB16_S1 #(
      .INIT(1'b0),  // Value of output RAM registers at startup
      .SRVAL(1'b0), // Output value upon SSR assertion
      .WRITE_MODE("READ_FIRST"), // WRITE_FIRST, READ_FIRST or NO_CHANGE

      // The following INIT_xx declarations specify the initial contents of the RAM
      
		/*
*************************   1st shape   ****************************************
      */		
		// Address 0 to 4095
      .INIT_00(256'h00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),//kokkino
      .INIT_01(256'h00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),//aspro
      .INIT_02(256'h00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),//kokkino
      .INIT_03(256'h00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),//aspro
      .INIT_04(256'h00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),//...
      .INIT_05(256'h00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_06(256'h00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_07(256'h00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_08(256'h00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_09(256'h00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_0A(256'h00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_0B(256'h00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
		/*
*************************		2nd shape   ***************************************************
		*/
      .INIT_0C(256'h00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_0D(256'h00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_0E(256'h00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),//...
      .INIT_0F(256'h00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),//aspro
                         // Address 4096 to 8191
      .INIT_10(256'h00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),//prasino
      .INIT_11(256'h00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),//aspro
      .INIT_12(256'h00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),//prasino
      .INIT_13(256'h00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),//aspro
      .INIT_14(256'h00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),//...
      .INIT_15(256'h00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_16(256'h00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_17(256'h00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      /*
*************************   3rd shape   *****************************************************		
		*/
		.INIT_18(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_19(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_1A(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_1B(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_1C(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_1D(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_1E(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_1F(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),//ASPRO
      // Address 8192 to 12287
      .INIT_20(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),//mple
      .INIT_21(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),//aspro
      .INIT_22(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_23(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
        /*
*********************   apo dw kai pera i mnimi den xrhsimopoieitai
      (prasino-mple-aspro-aspro-aspro-kokkino)*
		       3           F          C
		*/           	
		     
		.INIT_24(256'h00000000000000000000000000000000_3FC3FC3FC3FC3FC3FC3FC3FC3FC3FC3F),
      .INIT_25(256'h3FC3FC3FC3FC3FC3FC3FC3FC3FC3FC3F_3FC3FC3FC3FC3FC3FC3FC3FC3FC3FC3F),
      .INIT_26(256'h3FC3FC3FC3FC3FC3FC3FC3FC3FC3FC3F_3FC3FC3FC3FC3FC3FC3FC3FC3FC3FC3F),
      .INIT_27(256'h3FC3FC3FC3FC3FC3FC3FC3FC3FC3FC3F_3FC3FC3FC3FC3FC3FC3FC3FC3FC3FC3F),
      .INIT_28(256'h3FC3FC3FC3FC3FC3FC3FC3FC3FC3FC3F_3FC3FC3FC3FC3FC3FC3FC3FC3FC3FC3F),
      .INIT_29(256'h3FC3FC3FC3FC3FC3FC3FC3FC3FC3FC3F_3FC3FC3FC3FC3FC3FC3FC3FC3FC3FC3F),
      .INIT_2A(256'h3FC3FC3FC3FC3FC3FC3FC3FC3FC3FC3F_3FC3FC3FC3FC3FC3FC3FC3FC3FC3FC3F),
      .INIT_2B(256'h3FC3FC3FC3FC3FC3FC3FC3FC3FC3FC3F_3FC3FC3FC3FC3FC3FC3FC3FC3FC3FC3F),
      .INIT_2C(256'h3FC3FC3FC3FC3FC3FC3FC3FC3FC3FC3F_3FC3FC3FC3FC3FC3FC3FC3FC3FC3FC3F),
      .INIT_2D(256'h3FC3FC3FC3FC3FC3FC3FC3FC3FC3FC3F_3FC3FC3FC3FC3FC3FC3FC3FC3FC3FC3F),
      .INIT_2E(256'h3FC3FC3FC3FC3FC3FC3FC3FC3FC3FC3F_3FC3FC3FC3FC3FC3FC3FC3FC3FC3FC3F),
      .INIT_2F(256'h3FC3FC3FC3FC3FC3FC3FC3FC3FC3FC3F_00000000000000000000000000000000),
      /*
*********************   NO MORE MEMORY
      
		*/
      .INIT_30(256'h000000000000000000000000000000003FC3FC3FC3FC3FC3FC3FC3FC3FC3FC3F)
      .INIT_31(256'h3FC3FC3FC3FC3FC3FC3FC3FC3FC3FC3F3FC3FC3FC3FC3FC3FC3FC3FC3FC3FC3F),
      .INIT_32(256'hF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF00FFFF0FFF),
      .INIT_33(256'hF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF00FFFF0FFF),
      .INIT_34(256'hF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF00FFFF0FFF),
      .INIT_35(256'hF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF00FFFF0FFF),
      .INIT_36(256'hF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF00FFFF0FFF),
      .INIT_37(256'hF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF00FFFF0FFF),
      .INIT_38(256'hF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF00FFFF0FFF),
      .INIT_39(256'hF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF00FFFF0FFF),
      .INIT_3A(256'hF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF00FFFF0FFF),
      .INIT_3B(256'hF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF00FFFF0FFF),
      .INIT_3C(256'hF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF00FFFF0FFF),
      .INIT_3D(256'hF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF00FFFF0FFF),
      .INIT_3E(256'hF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF00FFFF0FFF),
      .INIT_3F(256'hF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF00FFFF0FFF)
   ) RAMB16 (
      .DO(DATA_OUT),      // 1-bit Data Output
      .ADDR(ADDR_IN),  // 14-bit Address Input
      .CLK(CLK),    // Clock
      .DI(DATA_IN),      // 1-bit Data Input
      .EN(EN),      // RAM Enable Input
      .SSR(SSR),    // Synchronous Set/Reset Input
      .WE(WE)       // Write Enable Input   );
   );


endmodule