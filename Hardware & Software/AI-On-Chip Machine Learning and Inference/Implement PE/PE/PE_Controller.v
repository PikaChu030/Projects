module Controller
(
    input clk,
    input rst,
    input ifmap_enable,
    input weight_enable,
    input ipsum_enable, 
    input [3:0] iw_size,
    input [3:0] c,
    input [3:0] f,
    input [3:0] n,
    input [3:0] o,
    input opsum_ready,
    output reg ifmap_ready,
    output reg weight_ready,
    output reg ipsum_ready,
    output reg opsum_enable,
    output reg [5:0] ifmap_addr,
    output reg ifmap_wen,
    output reg [5:0] weight_addr,
    output reg weight_wen,
    output reg [4:0] psum_addr,
    output reg psum_wen,
    output reg psum_ren,
    output reg mux1_sel,
    output reg mux2_sel);

    `define INIT     3'd0
    `define PRELOAD  3'd1
    `define READ     3'd2
    `define MAC      3'd3
    `define ADDPSUM  3'd4
    `define DONE     3'd5
    
    reg [2:0] curState, nextState;
    reg [3:0] counter;
    reg [3:0] curOPixel, curOChannel, curOfmap;
    reg [3:0] situation;
    wire conv_done;
    reg [1:0] both_enable;
    reg noload;
    

    //----------------//
    //      FSM       //
    //----------------//
    always @(posedge clk or posedge rst) begin
        if(rst) curState <= `INIT;
        else curState <= nextState;
    end

    always@(*) begin
        case(curState) 
            `INIT: nextState = (!ifmap_enable) ? `INIT: `PRELOAD;
            `PRELOAD: nextState = (both_enable == 2'd2) ? `READ : `PRELOAD;
            `READ: nextState = `MAC;
            `MAC: begin
                if(conv_done) nextState = `ADDPSUM;
                else begin
                    case(situation)
                        4'd0: nextState = `PRELOAD;
                        4'd1: begin
                            if(counter == 4'd8 || counter < 4'd5) nextState = `READ;
                            else nextState = `PRELOAD;
                        end
                        4'd2: begin
                            if(noload) nextState = `READ; // entering ofmap0 -> cheannel1 -> p1, which is no load
                            else nextState = `PRELOAD;
                        end 
                        4'd3: nextState = `PRELOAD;
                        4'd4: begin
                            if(counter == 4'd8 || counter < 4'd5) nextState = `READ;
                            else nextState = `PRELOAD;
                        end
                        4'd5: nextState = `READ;
                        default: nextState = `READ;
                    endcase
                end
            end
            `ADDPSUM: nextState = (counter == (o+1)*(f+1)*(n+1)-1 && opsum_enable)? `DONE : `ADDPSUM;
            `DONE: nextState = `DONE;
        endcase
    end

    // both_eanble
    always@(posedge clk or posedge rst) begin
        if(rst) both_enable <= 2'd0;
        else begin
            if(curState == `PRELOAD) begin
                if(weight_enable && ifmap_enable) both_enable <= 2'd2;
                else if(weight_enable || ifmap_enable) both_enable <= both_enable + 2'd1;
                else both_enable <= both_enable;
            end
            else both_enable <= 2'd0;
        end
    end 

    //----------------//
    //    counter     //
    //----------------//
    always@(posedge clk or posedge rst) begin
        if(rst) counter <= 4'd0;
        else begin
            if(curState == `MAC) begin
                if(counter == 4'd8) counter <= 4'd0;
                else counter <= counter + 4'd1;
            end 
            else if(curState == `ADDPSUM) begin
                if(ipsum_enable && opsum_ready) counter <= counter + 4'd1;
                else counter <= counter;
            end
            else counter <= counter;
        end
    end

    //----------------//
    //  ifmap_addr    //
    //----------------//
    always@(posedge clk or posedge rst) begin
        if(rst) ifmap_addr <= 6'd0;
        else begin
            if(curState == `MAC) begin
                case(situation)
                    4'd0: ifmap_addr <= ifmap_addr + 6'd1;
                    4'd1: begin
                        if(counter == 4'd8) ifmap_addr <= c + 6'd1;
                        else ifmap_addr <= ifmap_addr + 6'd1;
                    end 
                    4'd2: begin
                        if(counter == 4'd8) ifmap_addr <= 6'd0;
                        else ifmap_addr <= ifmap_addr + 6'd1;
                    end
                    4'd3: ifmap_addr <= ifmap_addr + 6'd1;
                    4'd4: begin
                        if(counter == 4'd8) ifmap_addr <= 6'd11 + (c + 6'd1) + 6'd1;
                        else ifmap_addr <= ifmap_addr + 6'd1;
                    end
                    4'd5: begin
                        if(curOfmap == 4'd0 && curOChannel == 4'd1 && curOPixel == 4'd1) begin
                            if(counter == 4'd8) ifmap_addr <= c + 6'd1;
                            else ifmap_addr <= ifmap_addr + 6'd1;
                        end
                        else if(curOfmap == 4'd1 && curOChannel == 4'd1 && curOPixel == 4'd0) begin
                            if(counter == 4'd8) ifmap_addr <= 6'd11 + 6'd1;
                            else ifmap_addr <= ifmap_addr + 6'd1;
                        end
                        else if(curOfmap == 4'd1 && curOChannel == 4'd1 && curOPixel == 4'd1) begin
                            if(counter == 4'd8) ifmap_addr <= 6'd11 + (c + 6'd1) + 6'd1;
                            else ifmap_addr <= ifmap_addr + 6'd1;
                        end
                    end
                endcase
            end 
            else ifmap_addr <= ifmap_addr; 
        end
    end

    //----------------//
    //  ifmap_ready   //
    //----------------//
    always@(*) begin
        if(curState == `PRELOAD) begin
            case(situation)
                4'd0, 4'd1, 4'd3, 4'd4: begin
                    if(!ifmap_enable) ifmap_ready = 1'b0;
                    else ifmap_ready = 1'b1;
                end
                4'd2: ifmap_ready = 1'b0;
            endcase 
            if(noload) ifmap_ready = 1'b0;
        end 
        else ifmap_ready = 1'b0; 
    end

    //----------------//
    //  ifmap_wen     //
    //----------------//
    always@(*) begin
        if(curState == `PRELOAD) begin
            case(situation)
                4'd0, 4'd1, 4'd3, 4'd4: begin
                    if(ifmap_enable) ifmap_wen = 1'b1;
                    else ifmap_wen = 1'b0;
                end
                4'd2: ifmap_wen = 1'b0;
            endcase
            if(noload) ifmap_wen = 1'b0;
        end
        else ifmap_wen = 1'b0;
    end

    //----------------//
    //  weight_addr   //
    //----------------//
    always@(posedge clk or posedge rst) begin
        if(rst) weight_addr <= 6'd0;
        else begin
            if(curState == `MAC) begin 
                case(situation)
                    4'd0: weight_addr <= weight_addr + 6'd1;
                    4'd1: begin
                        if(counter == 4'd8) weight_addr <= 6'd0;
                        else weight_addr <= weight_addr + 6'd1;
                    end 
                    4'd2: weight_addr <= weight_addr + 6'd1;
                    4'd3: begin
                        if(counter == 4'd8) weight_addr <= 6'd0;
                        else weight_addr <= weight_addr + 6'd1;
                    end 
                    4'd4: begin
                        if(counter == 4'd8) weight_addr <= 6'd0;
                        else weight_addr <= weight_addr + 6'd1;
                    end 
                    4'd5: begin
                        if(counter == 4'd8) weight_addr <= 6'd9;
                        else weight_addr <= weight_addr + 6'd1;
                    end
                endcase
            end 
            else weight_addr <= weight_addr; 
        end
    end

    //----------------//
    //  weight_ready   //
    //----------------//
    always@(*) begin
        if(curState == `PRELOAD) begin
            case(situation)
                4'd0, 4'd2: begin
                    if(!weight_enable) weight_ready = 1'b0; 
                     else weight_ready = 1'b1;
                end
                4'd1, 4'd3, 4'd4: weight_ready = 1'b0; 
            endcase 
            if(noload) weight_ready = 1'b0; 
        end 
        else weight_ready = 1'b0; 
    end

    //----------------//
    //  weight_wen     //
    //----------------//
    always@(*) begin
        if(curState == `PRELOAD) begin
            case(situation)
                4'd0, 4'd2: begin
                    if(weight_enable) weight_wen = 1'b1;
                    else weight_wen = 1'b0;
                end
                4'd1, 4'd3, 4'd4: weight_wen = 1'b0;
            endcase
            if(noload) weight_wen = 1'b0;
        end
        else weight_wen = 1'b0;
    end

    //----------------//
    //  psum_addr    //
    //----------------//
    always@(posedge clk or posedge rst) begin
        if(rst) psum_addr <= 6'd0;
        else begin
            if(curState == `MAC) begin
                if(psum_addr == (o+1)*(f+1)*(n+1)-1 && counter == 4'd8) psum_addr <= 6'd0;
                else if(counter == 4'd8) psum_addr <= psum_addr + 6'd1;
                else psum_addr <= psum_addr;
            end
            else if(curState == `ADDPSUM) begin
                if(ipsum_enable && opsum_ready) psum_addr <= psum_addr + 6'd1;
                else psum_addr <= psum_addr;
            end
            else psum_addr <= psum_addr; 
        end
    end

    //----------------//
    //   psum_wen     //
    //----------------//
    always@(*) begin
        if(curState == `MAC) psum_wen = 1'b1;
        else psum_wen = 1'b0;
    end

    //----------------//
    //   psum_ren     //
    //----------------//
    always@(*) begin
        if(curState == `MAC || curState == `ADDPSUM) psum_ren = 1'b1;
        else psum_ren = 1'b0;
    end

    //----------------//
    //  ipsum_ready   //
    //----------------//
    always@(*) begin
        if(curState == `ADDPSUM) begin
            if(ipsum_enable && opsum_ready) ipsum_ready = 1'b1;
            else ipsum_ready = 1'b0;
        end 
        else ipsum_ready = 1'b0; 
        
    end

    //----------------//
    //    mux1_sel    //
    //----------------//
    always@(*) begin
        if(curState == `ADDPSUM) mux1_sel = 1'b0;
        else mux1_sel = 1'b1;
    end

    // conv_done
    assign conv_done = (curOfmap == (n + 4'd1) && curOChannel == 4'd0 && curOPixel == 4'd0) ? 1'b1 : 1'b0;

    //----------------//
    //    mux2_sel    //
    //----------------//
    always@(*) begin
        if(curState == `ADDPSUM) mux2_sel = 1'b1;
        else begin
            if(counter == 4'd0) mux2_sel = 1'b0; // psum chooses 0
            else mux2_sel = 1'b1;
        end
        
    end

    // curOPixel
    always@(posedge clk or posedge rst) begin
        if(rst) curOPixel <= 4'd0;
        else begin
            if(curState == `READ) begin
                if(curOPixel == o && counter == 4'd8) curOPixel <= 4'd0;
                else if(counter == 4'd8) curOPixel <= curOPixel + 4'd1;
                else curOPixel <= curOPixel;
            end
            else curOPixel <= curOPixel;
        end
    end

    // curOChannel
    always@(posedge clk or posedge rst) begin
        if(rst) curOChannel <= 4'd0;
        else begin
            if(curState == `READ) begin
                if(curOChannel == f && curOPixel == o && counter == 4'd8) curOChannel <= 4'd0;
                else if(curOPixel == o && counter == 4'd8) curOChannel <= curOChannel + 4'd1;
                else curOChannel <= curOChannel;
            end
            else curOChannel <= curOChannel;
        end
    end
    //curOfmap
    always@(posedge clk or posedge rst) begin
        if(rst) curOfmap <= 4'd0;
        else begin
            if(curState == `READ) begin
                if(curOChannel == f && curOPixel == o && counter == 4'd8) curOfmap <= curOfmap + 4'd1;
                else curOfmap <= curOfmap;
            end
            else curOfmap <= curOfmap;
        end
    end

    // situation
    always@(*) begin
        if(curOfmap == 4'd0 && curOChannel == 4'd0 && curOPixel == 4'd0) situation = 4'd0; // 9 (filter and ifmap)
        else if(curOfmap == 4'd0 && curOChannel == 4'd0 && curOPixel > 4'd0) situation = 4'd1; // 3 ifmap
        else if(curOfmap == 4'd0 && curOChannel == 4'd1 && curOPixel == 4'd0) situation = 4'd2; // 9 filter
        else if(curOfmap == 4'd1 && curOChannel == 4'd0 && curOPixel == 4'd0) situation = 4'd3; // 9 ifmap
        else if(curOfmap == 4'd1 && curOChannel == 4'd0 && curOPixel > 4'd0) situation = 4'd4; // 3 ifmap
        else situation = 4'd5; // no load situation
    end

    //----------------//
    //     noload     //
    //----------------//
    always@(*) begin
        if(curOfmap == 4'd0 && curOChannel > 4'd0 && curOPixel > 4'd0 || curOfmap == 4'd1 && curOChannel > 4'd0) noload = 1'b1;
        else noload = 1'b0;
    end
    
    //----------------//
    //  opsum_enable  //
    //----------------//
    always@(*) begin
        if(curState == `ADDPSUM) begin
            if(ipsum_enable && opsum_ready) opsum_enable = 1'b1;
            else opsum_enable = 1'b0;
        end 
        else opsum_enable = 1'b0;
    end
    

endmodule