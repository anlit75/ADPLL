`timescale 1ns/1ps
`include "pfd.v"

module tb;
    // ports
    logic rst;   // reset signal
    logic in;    // input signal
    logic fb;    // feedback signal
    logic flagu; // up-edge flag
    logic flagd; // down-edge flag

    // instance of the pfd module
    pfd dut (
        .rst(rst),
        .in(in),
        .fb(fb),
        .flagu(flagu),
        .flagd(flagd)
    );

    initial begin
        // enable wave dumping
        $fsdbDumpfile("pfd.fsdb");
        $fsdbDumpvars;

        // reset the circuit
        reset();

        // generate 10 input pulses
        repeat(10) inlead();

        // set input and feedback signals to zero
        in = 1'b0;
        fb = 1'b0;

        // generate 10 feedback pulses
        repeat(10) fblead();

        // disable the circuit
        rst = 1'b0;

        // wait for 10 cycles
        #10 $finish;
    end

    // task to reset the circuit
    task reset();
        // set the reset signal high
        rst = 1'b1;
        #5 rst = 1'b0;
        #5 rst = 1'b1;

        // set the input and feedback signals to zero
        in = 1'b0;
        fb = 1'b0;
    endtask: reset

    // task to generate one input pulse
    task inlead();
        #5 in = ~in;
        #0.06 fb = ~fb;
    endtask: inlead

    // task to generate one feedback pulse
    task fblead();
        #5 fb = ~fb;
        #0.06 in = ~in;
    endtask: fblead

endmodule
