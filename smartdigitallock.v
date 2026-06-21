`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:36:35 06/21/2026 
// Design Name: 
// Module Name:    smartdigitallock 
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
module smartdigitallock(
    input clk,
    input reset,
    input enter,
    input [3:0] digit,

    output reg unlock,
    output reg alarm
);

    reg [2:0] state;
    reg [3:0] d1, d2, d3, d4;
    reg [1:0] wrong_count;

    parameter WAIT1  = 3'd0,
              WAIT2  = 3'd1,
              WAIT3  = 3'd2,
              WAIT4  = 3'd3,
              VERIFY = 3'd4;

    // Password = 1 2 3 4
    parameter P1 = 4'b0001;
    parameter P2 = 4'b0010;
    parameter P3 = 4'b0011;
    parameter P4 = 4'b0100;

    always @(posedge clk or posedge reset) begin

        if (reset) begin
            state <= WAIT1;
            unlock <= 0;
            alarm <= 0;
            wrong_count <= 0;
        end
        else begin

            unlock <= 0;

            case(state)

                WAIT1: begin
                    if (enter) begin
                        d1 <= digit;
                        state <= WAIT2;
                    end
                end

                WAIT2: begin
                    if (enter) begin
                        d2 <= digit;
                        state <= WAIT3;
                    end
                end

                WAIT3: begin
                    if (enter) begin
                        d3 <= digit;
                        state <= WAIT4;
                    end
                end

                WAIT4: begin
                    if (enter) begin
                        d4 <= digit;
                        state <= VERIFY;
                    end
                end

                VERIFY: begin

                    if ((d1 == P1) && (d2 == P2) &&
                        (d3 == P3) && (d4 == P4)) begin

                        unlock <= 1'b1;
                        wrong_count <= 0;
                    end
                    else begin

                        if (wrong_count < 3)
                            wrong_count <= wrong_count + 1;

                        if (wrong_count == 2)
                            alarm <= 1'b1;
                    end

                    state <= WAIT1;
                end

                default:
                    state <= WAIT1;

            endcase
        end
    end

endmodule
