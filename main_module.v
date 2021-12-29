`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.12.2021 18:53:21
// Design Name: 
// Module Name: main_module
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module main_module(
    input Clk,
    input Rst,
    input P1,
    input P2,
    input P3,
    input Pay,
    output [7:0] Bill
    );  
    
    wire Clk190,P;
    wire [2:0]Item;
    wire [7:0]B;
    wire ClkFSM;
    Clock_Division c1(Clk,Rst,Clk190);
    assign P=P1|P2|P3;
    Debounce d1(Clk190,P,Rst,ClkFSM); 
    //Item_select i1(P1,P2,P3,Item,ClkFSM); 
    Automatic_Bill A1(ClkFSM,Rst,Pay,P3,P2,P1,B);
    vio_0 v1(Clk,B);
    assign Bill=B;
    
    
    
    
    
endmodule
