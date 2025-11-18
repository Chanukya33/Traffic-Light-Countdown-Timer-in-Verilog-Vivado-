`timescale 1ns / 1ps
module tb;
    reg [2:0] sel;
    reg [3:0] tens, ones;
    wire [6:0] seg_tens, seg_ones;
    traffic_display DUT(sel, tens, ones, seg_tens, seg_ones);
    integer i;
    initial begin
        sel = 3'b001;
        for(i = 35; i >= 0; i = i - 1) begin
            tens = i / 10;
            ones = i % 10;
            #10;
        end
        sel = 3'b010;  
        for(i = 5; i >= 0; i = i - 1) begin
            tens = i / 10;
            ones = i % 10;
            #10;
        end
        sel = 3'b100;
        for(i = 30; i >= 0; i = i - 1) begin
            tens = i / 10;
            ones = i % 10;
            #10;
        end
        $finish;
    end
endmodule