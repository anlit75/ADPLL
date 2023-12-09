`timescale 1ns/1ps

module dco (
    input  wire rst,
    input  wire [128:0] code,
    output reg  dco out
);

    parameter dco to = 0.634;        // DCO Min. Delay is 0.634ns
    parameter dco_step = 0.324;    // DCO Resolution is 0.324ns

    real period;

    always @(*) begin             
        case (code)
            129'h000000000000000000000000000000000: period = 5.8541;
            129'h000000000000000000000000000000001: period = 5.4634;
            129'h000000000000000000000000000000003: period = 5.0209;
            129'h000000000000000000000000000000007: period = 4.7541;
            129'h00000000000000000000000000000000f: period = 4.4081;
            129'h00000000000000000000000000000001f: period = 4.0888;
            129'h00000000000000000000000000000003f: period = 3.7369;
            129'h00000000000000000000000000000007f: period = 3.6290;
            129'h0000000000000000000000000000000ff: period = 3.4012;
            129'h0000000000000000000000000000001ff: period = 3.1890;
            129'h0000000000000000000000000000003ff: period = 3.0317;
            129'h0000000000000000000000000000007ff: period = 2.8793;
            129'h000000000000000000000000000000fff: period = 2.7355;
            129'h000000000000000000000000000001fff: period = 2.6191;
            129'h000000000000000000000000000003fff: period = 2.5066;
            129'h000000000000000000000000000007fff: period = 2.4044;
            129'h00000000000000000000000000000ffff: period = 2.3138;
            129'h00000000000000000000000000001ffff: period = 2.2274; 
            129'h00000000000000000000000000003ffff: period = 2.1472;
            129'h00000000000000000000000000007ffff: period = 2.0832;
            129'h0000000000000000000000000000fffff: period = 2.0136;
            129'h0000000000000000000000000001fffff: period = 1.9481; 
            129'h0000000000000000000000000003fffff: period = 1.8951;
            129'h0000000000000000000000000007fffff: period = 1.8357; 
            129'h000000000000000000000000000ffffff: period = 1.7898; 
            129'h000000000000000000000000001ffffff: period = 1.7431;
            129'h000000000000000000000000003ffffff: period = 1.6999; 
            129'h000000000000000000000000007ffffff: period = 1.6522;
            129'h00000000000000000000000000fffffff: period = 1.6199;
            129'h00000000000000000000000001fffffff: period = 1.5863;
            129'h00000000000000000000000003fffffff: period = 1.5500;
            129'h00000000000000000000000007fffffff: period = 1.5195;
            129'h0000000000000000000000000ffffffff: period = 1.4842;
            129'h0000000000000000000000001ffffffff: period = 1.4523;
            129'h0000000000000000000000003ffffffff: period = 1.4268;
            129'h0000000000000000000000007ffffffff: period = 1.3977;
            129'h000000000000000000000000fffffffff: period = 1.3757;
            129'h000000000000000000000001fffffffff: period = 1.3510;
            129'h000000000000000000000003fffffffff: period = 1.3295;
            129'h000000000000000000000007fffffffff: period = 1.3050;
            129'he0000000000000000000000ffffffffff: period = 1.2808;
            129'h00000000000000000000001ffffffffff: period = 1.2645;
            129'h00000000000000000000003ffffffffff: period = 1.2435;
            129'h00000000000000000000007ffffffffff: period = 1.2261;
            129'he000000000000000000000fffffffffff: period = 1.2043;
            129'he000000000000000000001fffffffffff: period = 1.1894;
            129'h0000000000000000000003fffffffffff: period = 1.1716;
            129'h0000000000000000000007fffffffffff: period = 1.1581;
            129'he00000000000000000000ffffffffffff: period = 1.1401;
            129'he00000000000000000001ffffffffffff: period = 1.1244; 
            129'h000000000000000000003ffffffffffff: period = 1.1110; 
            129'h000000000000000000007ffffffffffff: period = 1.0948; 
            129'h00000000000000000000fffffffffffff: period = 1.0849;
            129'h00000000000000000001fffffffffffff: period = 1.0691; 
            129'h00000000000000000003fffffffffffff: period = 1.0557;
            129'h00000000000000000007fffffffffffff: period = 1.0444;
            129'h0000000000000000000ffffffffffffff: period = 1.0320;
            129'h0000000000000000001ffffffffffffff: period = 1.0237;
            129'h0000000000000000003ffffffffffffff: period = 1.0085;
            129'h0000000000000000007ffffffffffffff: period = 0.9996;
            129'h000000000000000000fffffffffffffff: period = 0.9872;
            129'h000000000000000001fffffffffffffff: period = 0.9802;
            129'h000000000000000003fffffffffffffff: period = 0.9725;
            129'h000000000000000007fffffffffffffff: period = 0.9604;
            129'h00000000000000000ffffffffffffffff: period = 0.9515;
            129'h00000000000000001ffffffffffffffff: period = 0.9406;
            129'h00000000000000003ffffffffffffffff: period = 0.9349;
            129'h00000000000000007ffffffffffffffff: period = 0.9266;
            129'h0000000000000000fffffffffffffffff: period = 0.9156;
            129'h0000000000000001fffffffffffffffff: period = 0.9112;
            129'h0000000000000003fffffffffffffffff: period = 0.9015;
            129'h0000000000000007fffffffffffffffff: period = 0.8929;
            129'h000000000000000ffffffffffffffffff: period = 0.8832;
            129'h000000000000001ffffffffffffffffff: period = 0.8777;
            129'h000000000000003ffffffffffffffffff: period = 0.8693;
            129'h000000000000007ffffffffffffffffff: period = 0.8657;
            129'h00000000000000fffffffffffffffffff: period = 0.8572;
            129'h00000000000001fffffffffffffffffff: period = 0.8507;
            129'h00000000000003fffffffffffffffffff: period = 0.8442;
            129'h00000000000007fffffffffffffffffff: period = 0.8374;
            129'h0000000000000ffffffffffffffffffff: period = 0.8306;
            129'h0000000000001ffffffffffffffffffff: period = 0.8242;
            129'h0000000000003ffffffffffffffffffff: period = 0.8175;
            129'h0000000000007ffffffffffffffffffff: period = 0.8145;
            129'h000000000000fffffffffffffffffffff: period = 0.8055;
            129'h000000000001fffffffffffffffffffff: period = 0.8034;
            129'h000000000003fffffffffffffffffffff: period = 0.7974;
            129'h000000000007fffffffffffffffffffff: period = 0.7921;
            129'h00000000000ffffffffffffffffffffff: period = 0.7864;
            129'h00000000001ffffffffffffffffffffff: period = 0.7807;
            129'h00000000003ffffffffffffffffffffff: period = 0.7757;
            129'h00000000007ffffffffffffffffffffff: period = 0.7730;
            129'h0000000000fffffffffffffffffffffff: period = 0.7663;
            129'h0000000001fffffffffffffffffffffff: period = 0.7618;
            129'h0000000003fffffffffffffffffffffff: period = 0.7557;
            129'h0000000007fffffffffffffffffffffff: period = 0.7519;
            129'h000000000ffffffffffffffffffffffff: period = 0.7477;
            129'h000000001ffffffffffffffffffffffff: period = 0.7426;
            129'h000000003ffffffffffffffffffffffff: period = 0.7419;
            129'h000000007ffffffffffffffffffffffff: period = 0.7378;
            129'h00000000fffffffffffffffffffffffff: period = 0.7307;
            129'h00000001fffffffffffffffffffffffff: period = 0.7287;
            129'h00000003fffffffffffffffffffffffff: period = 0.7232;
            129'h00000007fffffffffffffffffffffffff: period = 0.7191;
            129'h0000000ffffffffffffffffffffffffff: period = 0.7157;
            129'h0000001ffffffffffffffffffffffffff: period = 0.7152;
            129'h0000003ffffffffffffffffffffffffff: period = 0.7100;
            129'h0000007ffffffffffffffffffffffffff: period = 0.7044;
            129'h000000fffffffffffffffffffffffffff: period = 0.7015;
            129'h000001fffffffffffffffffffffffffff: period = 0.6983;
            129'h000003fffffffffffffffffffffffffff: period = 0.6955;
            129'h000007fffffffffffffffffffffffffff: period = 0.6920;
            129'h00000ffffffffffffffffffffffffffff: period = 0.6886;
            129'h00001ffffffffffffffffffffffffffff: period = 0.6865;
            129'h00003ffffffffffffffffffffffffffff: period = 0.6832;
            129'h00007ffffffffffffffffffffffffffff: period = 0.6794;
            129'h0000fffffffffffffffffffffffffffff: period = 0.6768;
            129'h0001fffffffffffffffffffffffffffff: period = 0.6735;
            129'h0003fffffffffffffffffffffffffffff: period = 0.6697;
            129'h0007fffffffffffffffffffffffffffff: period = 0.6668;
            129'h000ffffffffffffffffffffffffffffff: period = 0.6622;
            129'h001ffffffffffffffffffffffffffffff: period = 0.6621;
            129'h003ffffffffffffffffffffffffffffff: period = 0.6590;
            129'h007ffffffffffffffffffffffffffffff: period = 0.6556;
            129'h00fffffffffffffffffffffffffffffff: period = 0.6531;
            129'h01fffffffffffffffffffffffffffffff: period = 0.6513;
            129'h03fffffffffffffffffffffffffffffff: period = 0.6460;
            129'h07fffffffffffffffffffffffffffffff: period = 0.6449;
            129'h0ffffffffffffffffffffffffffffffff: period = 0.6423;
            129'h1ffffffffffffffffffffffffffffffff: period = 0.6394;
        endcase
    end

    always @(posedge rst) begin: dco_run
        forever begin
            dco_out = ~dco_out;
            #(period / 2.0);
        end
    end

    always @(negedge rst) begin
        dco_out = 0;
        disable dco_run;  // turn off the dco_run process when rst is low
    end

endmodule