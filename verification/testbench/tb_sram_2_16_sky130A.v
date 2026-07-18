`timescale 1ns/1ps

module tb_sram_2_16_sky130A;

reg clk0;
reg csb0;
reg web0;
reg [3:0] addr0;
reg [1:0] din0;
wire [1:0] dout0;

// Instantiate DUT
sram_2_16_sky130A dut (
    .clk0(clk0),
    .csb0(csb0),
    .web0(web0),
    .addr0(addr0),
    .din0(din0),
    .dout0(dout0)
);

// Clock generation
initial begin
    clk0 = 0;
    forever #5 clk0 = ~clk0;
end

initial begin

    $display("======================================");
    $display(" OpenRAM SRAM Regression Test Started ");
    $display("======================================");

    csb0 = 1;
    web0 = 1;
    addr0 = 4'b0000;
    din0 = 2'b00;

    #20;

    // -------------------------
    // Write 10 to Address 3
    // -------------------------
    @(posedge clk0);
    csb0 = 0;
    web0 = 0;
    addr0 = 4'd3;
    din0 = 2'b10;

    @(posedge clk0);

    // -------------------------
    // Read Address 3
    // -------------------------
    web0 = 1;

    @(posedge clk0);
    @(posedge clk0);

    if(dout0 == 2'b10)
        $display("PASS : Read Data = %b", dout0);
    else
        $display("FAIL : Expected 10 Got %b", dout0);

    // -------------------------
    // Write 01 to Address 7
    // -------------------------
    web0 = 0;
    addr0 = 4'd7;
    din0 = 2'b01;

    @(posedge clk0);

    // -------------------------
    // Read Address 7
    // -------------------------
    web0 = 1;

    @(posedge clk0);
    @(posedge clk0);

    if(dout0 == 2'b01)
        $display("PASS : Read Data = %b", dout0);
    else
        $display("FAIL : Expected 01 Got %b", dout0);

    $display("======================================");
    $display(" Regression Completed ");
    $display("======================================");

    $finish;

end

endmodule
