
`timescale 1ns / 1ps

module smartdigitallock_tb;

    // Inputs
    reg clk;
    reg reset;
    reg enter;
    reg [3:0] digit;

    // Outputs
    wire unlock;
    wire alarm;

    // Instantiate the Unit Under Test (UUT)
    smartdigitallock uut (
        .clk(clk),
        .reset(reset),
        .enter(enter),
        .digit(digit),
        .unlock(unlock),
        .alarm(alarm)
    );

    // Clock generation: 10 ns period
    always #5 clk = ~clk;

    initial begin

        // Initialize Inputs
        clk = 0;
        reset = 1;
        enter = 0;
        digit = 4'b0000;

        // Apply Reset
        #20;
        reset = 0;

        //-------------------------------
        // Correct Password: 1 2 3 4
        //-------------------------------

        #10 digit = 4'd1; enter = 1;
        #10 enter = 0;

        #10 digit = 4'd2; enter = 1;
        #10 enter = 0;

        #10 digit = 4'd3; enter = 1;
        #10 enter = 0;

        #10 digit = 4'd4; enter = 1;
        #10 enter = 0;

        // Wait and observe unlock signal
        #50;

        //-------------------------------
        // Wrong Password Attempt #1
        //-------------------------------

        #10 digit = 4'd9; enter = 1;
        #10 enter = 0;

        #10 digit = 4'd8; enter = 1;
        #10 enter = 0;

        #10 digit = 4'd7; enter = 1;
        #10 enter = 0;

        #10 digit = 4'd6; enter = 1;
        #10 enter = 0;

        #50;

        //-------------------------------
        // Wrong Password Attempt #2
        //-------------------------------

        #10 digit = 4'd5; enter = 1;
        #10 enter = 0;

        #10 digit = 4'd5; enter = 1;
        #10 enter = 0;

        #10 digit = 4'd5; enter = 1;
        #10 enter = 0;

        #10 digit = 4'd5; enter = 1;
        #10 enter = 0;

        #50;

        //-------------------------------
        // Wrong Password Attempt #3
        // Alarm should become HIGH
        //-------------------------------

        #10 digit = 4'd0; enter = 1;
        #10 enter = 0;

        #10 digit = 4'd0; enter = 1;
        #10 enter = 0;

        #10 digit = 4'd0; enter = 1;
        #10 enter = 0;

        #10 digit = 4'd0; enter = 1;
        #10 enter = 0;

        #100;

        $stop;

    end

endmodule