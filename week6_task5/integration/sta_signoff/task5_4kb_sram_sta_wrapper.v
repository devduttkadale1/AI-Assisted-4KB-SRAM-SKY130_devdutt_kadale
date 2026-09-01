`timescale 1ns/1ps

// OpenSTA structural timing abstraction for the logical 1024x32 SRAM.
//
// IMPORTANT:
// - The physical/raw OpenRAM Verilog and LEF expose a 33rd spare data bit
//   and spare_wen0.
// - The generated Liberty model characterizes only din0[31:0],
//   dout0[31:0], addr0[10:0], wmask0[3:0], csb0, web0, and clk0.
// - Therefore this file deliberately represents the characterized Liberty
//   timing interface, not the complete physical spare-repair interface.
// - addr0[10] is tied low so the logical 1024-word address space uses
//   addr0[9:0] only.

module task5_4kb_sram_sta_wrapper (
    input  wire        clk,
    input  wire        csb,
    input  wire        web,
    input  wire [3:0]  wmask,
    input  wire [9:0]  addr,
    input  wire [31:0] din,
    output wire [31:0] dout
);

    wire [10:0] macro_addr;

    assign macro_addr = {1'b0, addr};

    task5_4kb_sram u_sram (
        .clk0   (clk),
        .csb0   (csb),
        .web0   (web),
        .wmask0 (wmask),
        .addr0  (macro_addr),
        .din0   (din),
        .dout0  (dout)
    );

endmodule
