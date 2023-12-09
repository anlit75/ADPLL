`timescale 1ns/1ps
`include "dco.v"

module tb;
  logic         RESET;       // System Reset
  logic [128:0] CODE;        // DCO control code
  logic         DCO_OUT;     // DCO output

  logic [3:0] counter;

  //Instanitate dco module
  dco dut (
    .rst (RESET),
    .code (CODE),
    .dco_out(DCO_OUT)
  );

  //TEST all DCO control codes
  always@(negedge DCO_OUT or negedge RESET) begin
    if(!RESET) begin
      counter <= 4'd0;
      CODE <= 129'd0;
    end
    else if(counter == 4'd3) begin
      CODE <= {CODE[128:0], 1'b1};
      counter <= 4'd0;    // clear counter
    end
    else begin
      counter <= counter + 1'b1;    // increase counter
    end
  end

  initial begin
    //WaveDump all signals
    $fsdbDumpfile("dco.fsdb");
    $fsdbDumpvars;

    RESET <= 1'b1;
    CODE <= 129'd0;
    #5 RESET <= 1'b0;
    #5 RESET <= 1'b1;
    CODE <= 129'd1;

    repeat(129*3) @(negedge DCO_OUT);
    #10 $finish;
  end

endmodule
```