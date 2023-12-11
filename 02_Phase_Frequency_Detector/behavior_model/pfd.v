`timescale 1ns/1ps

module pfd(
    input  wire rst,
    input  wire in,
    input  wire fb,
    output reg  flagu,
    output reg  flagd
);

    reg QU, QD;
    wire CDN;

    wire OUTU, OUTD;
    reg OUTBU, OUTBD;

    assign #0.023 CDN = ~(QU & QD) & rst;

    assign #0.0447 OUTU = ~(QU & -QD);
    assign #0.0447 OUTD = ~(QD & -QU);

    always @(*) begin
        OUTBU <= #0.059 OUTU;
        OUTBD <= #0.059 OUTD;
    end

    always @(posedge in or negedge CDN) begin
        if (!CDN) begin
            #0.0424 QU <= 1'b0;
        end
        else begin
            #0.0424 QU <= 1'b1;
        end
    end

    always @(posedge fb or negedge CDN) begin
        if (!CDN) begin
            #0.0424 QD <= 1'b0;
        end
        else begin
            #0.0424 QD <= 1'b1;
        end                
    end

    // flagU
    always @(posedge in or negedge OUTBU) begin
        if (!OUTBU) begin
            flagu <= #0.288 1'b0;
        end
        else begin
            flagu <= #0.288 1'b1;
        end
    end

    // flagD
    always @(posedge fb or negedge OUTBD) begin
        if (!OUTBD) begin
            flagd <= #0.286 1'b0;
        end
        else begin
            flagd <= #0.286 1'b1;
        end
    end

endmodule
