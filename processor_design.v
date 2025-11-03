`timescale 1ns / 1ps

module processor_design(input rst, input clk, input [31:0]instruction, output [31:0]result);
reg [2:0]state;
wire phi_1, phi_2;
parameter FETCH = 3'b001, DECODE = 3'b010, EXECUTE = 3'b011, MEMORY = 3'b100, OUT =3'b100;

clocks x1(.clk(clk), .rst(rst), .phi_1(phi_1), .phi_2(phi_2));

reg [31:0] inst_mem;

 // GENERAL PURPOSE REGISTERS                                                                  || 
  reg [31:0]gpr[31:0];                                                                       /*||
                                                                                               ||
 [31:0] zero = 32'b0; // corresponds to $zero and used whenever zero is to be used             ||
 [31:0] at; // used by assembler if required immediately                                       ||
 [31:0] v [1:0]; // output values of a function                                                ||
 [31:0] arg [3:0]; //  input values sent to a function                                         ||
 [31:0] temp [9:0]; // for quick calculations                                                  ||
 [31:0] save [7:0]; // stores values between function calls                                    ||
 [31:0] kernal [1:0]; // for OS related tasks, might not be used actually                      ||
 [31:0] gp, sp, fp, ra; // global pointer, stack pointer, frame pointer and return address     ||
 [31:0] A_reg, B_reg, OP_reg[1:0]; // operands and final output registers                      ||
//=================================================================================================||*/


// SPECIAL PURPOSE REGISTER                                                                ||                         
reg [31:0] prog_counter;//                                                                 ||
reg [31:0] HI, LO; // for output of multiplication and division                            ||
reg [31:0] MAR; // for fetching and saving data                                            ||
reg [31:0] MDR; // for reading and writing memory                                          ||
reg [31:0]IF_ID, ID_EX, EX_MEM, MEM_WB; // stores intermediate results of pipeline stages `||
//=========================================================================================||


always@(posedge phi_1 or posedge rst)begin 
case(state)
    FETCH : begin 
        inst_mem <= instruction;
        IF_ID <= instruction;
        state <= DECODE;
    end
    
   /* ID : begin 
    
    end */
    
    EXECUTE : begin 
    
    end
    
    /* MEM : begin 
    
    end */
    
    OUT : begin 
    
    end
    
    default : state <= FETCH;
endcase
end

always@(posedge phi_2 or posedge rst)begin 
case(state) 
    DECODE : begin 
        
    end 
    
    MEMORY : begin 
    
    end 
endcase 
end
endmodule
