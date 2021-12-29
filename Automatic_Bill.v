`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.12.2021 10:08:48
// Design Name: 
// Module Name: Automatic_Bill
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


module Automatic_Bill(
    input Clk,
    input Reset, 
    
    input Pay,
    input P3,
    input P2,
    input P1,
    //input [2:0] Item,
    output reg [7:0] Cost
    ); 
    parameter S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100;
        reg[2:0] presentstate,nextstate; 
        
        //state register
            always@(posedge Clk, posedge Reset, posedge Pay)
            begin 
            if(Reset==1 || Pay==1)
            begin
            presentstate=S0; 
            Cost=0;
            end
            else
            begin
            presentstate=nextstate;
            case(nextstate)
              
            S1: 
            begin
           Cost<=Cost+2;
            end
            S2: 
            begin
            Cost<=Cost+5;
            end 
            S3: 
                        begin
                        Cost<=Cost+10;
                        end  
           S4: 
            begin 
            Cost<=Cost;
            end             
            
            endcase
            end
            
            end 
            
            //next state logic
                always @(*)
                begin
                case(presentstate)
                S0: 
                begin
                    if({P3,P2,P1}==3'b001)
                    nextstate=S1; 
                    else if({P3,P2,P1}==3'b010)
                    nextstate=S2;
                    else if({P3,P2,P1}==3'b100)
                    nextstate=S3;
                    else
                    nextstate=S0; 
               end 
               
               S1:
               begin
 if({P3,P2,P1}==3'b001)
                                                  nextstate=S1; 
                                       else if({P3,P2,P1}==3'b010)
                                                     nextstate=S2;
                                        else if({P3,P2,P1}==3'b100)
                                                        nextstate=S3; 
                                        else 
                                          nextstate=S1;
               end     
               S2:    
               begin
if({P3,P2,P1}==3'b001)
                                                  nextstate=S1; 
                                       else if({P3,P2,P1}==3'b010)
                                                     nextstate=S2;
                                        else if({P3,P2,P1}==3'b100)
                                                        nextstate=S3; 
                                        else 
                                          nextstate=S2;
               end  
               S3:
               begin
                if({P3,P2,P1}==3'b001)
                                   nextstate=S1; 
                        else if({P3,P2,P1}==3'b010)
                                      nextstate=S2;
                         else if({P3,P2,P1}==3'b100)
                                         nextstate=S3; 
                         else 
                           nextstate=S3;                
               end   
//               S4:
//               begin 
//               if({P3,P2,P1}==3'b001)
//                                   nextstate=S1; 
//                                   else if({P3,P2,P1}==3'b010)
//                                   nextstate=S2;
//                                   else if({P3,P2,P1}==3'b100)
//                                   nextstate=S3;
//                                   else
//                                   nextstate=S4; 
//               end   
               endcase
               end 
    
endmodule
