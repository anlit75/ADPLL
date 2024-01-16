`timescale 1ns/1ps

module TEST(
    input  wire LOCK,
    input  wire OUT_CLK,
    output reg  REF_CLK,
    output reg  RESET,
    output reg  M2,
    output reg  M1,
    output reg  M0
);

    parameter MIN_PER = 0.6;
    parameter MAX_PER = 5.0;
    parameter num_pkts = 50;
    parameter num_m = 7;
    parameter delta = (MAX_PER - MIN_PER) / (num_pkts - 1);

    real period = MAX_PER;
    real prev_out_clk_time = 0.0;

    integer pkts_checked = 1;

    always #(period / 2.0) REF_CLK = ~REF_CLK;

    // always @(posedge OUT_CLK) begin
    //     prev_out_clk_time <= $realtime;
    //     if (LOCK)
    //         $write("%04t, ", ($realtime - prev_out_clk_time));
    // end

    // initial begin
    //     $dumpfile("wave.vcd");
    //     $dumpvars;

    //     REF_CLK = 1'b0;

    //     RESET = 1'b0;
    //     #(period / 2.0) RESET = 1'b1;
    //     #(period / 2.0) RESET = 1'b0;

    //     {M2, M1, M0} = 3'd1;
    //     period = 3.7;

    //     #2000 $finish;
    // end

    initial begin
        $fsdbDumpfile("wave.fsdb");
        $fsdbDumpvars;

        REF_CLK = 1'b0;

        RESET = 1'b0;
        #(period / 2.0) RESET = 1'b1;
        #(period / 2.0) RESET = 1'b0;

        {M2, M1, M0} = 3'd1;

        repeat(num_m) begin
            period = MAX_PER;

            repeat(num_pkts) begin
                $display("[NOTE] Time=%09t Packet %03d: period=%f ns, M=%d", 
                    $realtime, pkts_checked, period, {M2, M1, M0}
                );
                #300 pkts_checked = pkts_checked + 1;
                period = period - delta;

                #(period / 2.0) RESET = 1'b1;
                #(period / 2.0) RESET = 1'b0;
            end
            #500 {M2, M1, M0} = {M2, M1, M0} + 1;
        end

        #100 $finish;
    end

endmodule