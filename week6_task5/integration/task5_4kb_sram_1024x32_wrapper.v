`timescale 1ns/1ps

// Logical 4-KB SRAM wrapper around the raw OpenRAM macro.
//
// Logical organization:
//   1024 words x 32 bits
//   addr[9:0]
//
// Raw OpenRAM physical interface:
//   addr0[10:0]   : extra bit belongs to spare-row extension
//   din0[32:0]    : bit 32 is spare column
//   dout0[32:0]
//   spare_wen0
//
// Normal operation disables both spare extensions.

module task5_4kb_sram_1024x32_wrapper (
    input  wire        clk,
    input  wire        csb,
    input  wire        web,
    input  wire [3:0]  wmask,
    input  wire [9:0]  addr,
    input  wire [31:0] din,
    output wire [31:0] dout
);

    wire [10:0] macro_addr;
    wire [32:0] macro_din;
    wire [32:0] macro_dout;

    // Proven physical/logical mapping.
    assign macro_addr = {1'b0, addr};
    assign macro_din  = {1'b0, din};
    assign dout       = macro_dout[31:0];

    task5_4kb_sram #(
        .VERBOSE(0)
    ) u_sram (
        .clk0       (clk),
        .csb0       (csb),
        .web0       (web),
        .wmask0     (wmask),
        .spare_wen0 (1'b0),
        .addr0      (macro_addr),
        .din0       (macro_din),
        .dout0      (macro_dout)
    );

endmodule
