`include "PE_Controller.v"
`include "Spad.v"
`include "Mux.v"
`include "PSpad.v"

`timescale 1ns/10ps
module PE(
    input clk,
    input rst,
    input [7:0] ifmap_noc,
    input ifmap_enable,
    input [7:0] weight_noc,
    input weight_enable,
    input [23:0] ipsum_noc,
    input ipsum_enable, 
    input [3:0] iw_size,
    input [3:0] c,
    input [3:0] f,
    input [3:0] n,
    input [3:0] o,
    input opsum_ready,
    output ifmap_ready,
    output weight_ready,
    output ipsum_ready,
    output opsum_enable,
    output [23:0] opsum_noc
);

    wire [5:0] ifmap_addr, weight_addr;
    wire [4:0] psum_addr;
    wire ifmap_wen, weight_wen, psum_wen, psum_ren;
    wire signed [7:0] ifmSpad_dout, weiSpad_dout;
    wire [23:0] psumSpad_dout, mux1_out, mux2_out, psum_wrdata;
    wire signed [23:0] mult;
    wire mux1_sel, mux2_sel;

    Controller controller(
        .clk(clk),
        .rst(rst),
        .ifmap_enable(ifmap_enable),
        .weight_enable(weight_enable),
        .ipsum_enable(ipsum_enable),
        .iw_size(iw_size),
        .c(c),
        .f(f),
        .n(n),
        .o(o),
        .opsum_ready(opsum_ready),
        .ifmap_ready(ifmap_ready),
        .weight_ready(weight_ready),
        .ipsum_ready(ipsum_ready),
        .opsum_enable(opsum_enable),
        .ifmap_addr(ifmap_addr),
        .ifmap_wen(ifmap_wen),
        .weight_addr(weight_addr),
        .weight_wen(weight_wen),
        .psum_addr(psum_addr),
        .psum_wen(psum_wen),
        .psum_ren(psum_ren),
        .mux1_sel(mux1_sel),
        .mux2_sel(mux2_sel)
    );

    Spad ifmapSpad(
        .clk(clk),
        .wen(ifmap_wen),
        .wrdata(ifmap_noc),
        .addr(ifmap_addr),
        .rdata(ifmSpad_dout)
    );

    Spad weightSpad(
        .clk(clk),
        .wen(weight_wen),
        .wrdata(weight_noc),
        .addr(weight_addr),
        .rdata(weiSpad_dout)
    );

    PSpad #(.WIDTH(24), .ADDR(5), .SIZE(32)) psumSpad
    (
        .clk(clk),
        .wen(psum_wen),
        .ren(psum_ren),
        .wrdata(psum_wrdata),
        .addr(psum_addr),
        .rdata(psumSpad_dout)
    );

    assign mult = weiSpad_dout * ifmSpad_dout;

    Mux mux1(
        .sel(mux1_sel),
        .a(mult),
        .b(ipsum_noc),
        .c(mux1_out)
    );

    Mux mux2(
        .sel(mux2_sel),
        .a(psumSpad_dout),
        .b(24'd0),
        .c(mux2_out)
    );
    
    assign psum_wrdata = mux1_out + mux2_out;
    assign opsum_noc = psum_wrdata;

endmodule