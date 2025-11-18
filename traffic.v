module seven_seg_decoder(input  [3:0] digit,output reg [6:0] seg);
    always @(*) begin
        case(digit)
            0: seg = 7'b0000001;
            1: seg = 7'b1001111;
            2: seg = 7'b0010010;
            3: seg = 7'b0000110;
            4: seg = 7'b1001100;
            5: seg = 7'b0100100;
            6: seg = 7'b0100000;
            7: seg = 7'b0001111;
            8: seg = 7'b0000000;
            9: seg = 7'b0000100;
            default: seg = 7'b0000000;
        endcase
    end
endmodule


module traffic_display(input  [2:0] sel,input  [3:0] tens,ones,output reg [6:0] seg_tens,seg_ones);
    wire [6:0] r_t, r_o, y_t, y_o,g_t, g_o;
    seven_seg_decoder RED_T(tens, r_t);
    seven_seg_decoder RED_O(ones, r_o);
    seven_seg_decoder YEL_T(tens, y_t);
    seven_seg_decoder YEL_O(ones, y_o);
    seven_seg_decoder GRE_T(tens, g_t);
    seven_seg_decoder GRE_O(ones, g_o);
    always @(*) begin
        case(sel)
            3'b001: begin   
                seg_tens = r_t;
                seg_ones = r_o;
            end
            3'b010: begin   
                seg_tens = y_t;
                seg_ones = y_o;
            end
            3'b100: begin
                seg_tens = g_t;
                seg_ones = g_o;
            end
            default: begin
                seg_tens = 7'b0000000;
                seg_ones = 7'b0000000;
            end
        endcase
    end
endmodule