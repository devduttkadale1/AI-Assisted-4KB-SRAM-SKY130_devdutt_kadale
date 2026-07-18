`timescale 1ns/1ps

module tb_sram_2_16_sky130A;

reg clk0;
reg csb0;
reg web0;
reg [3:0] addr0;
reg [1:0] din0;
wire [1:0] dout0;

integer pass_count;
integer fail_count;

// DUT
sram_2_16_sky130A dut (
    .clk0(clk0),
    .csb0(csb0),
    .web0(web0),
    .addr0(addr0),
    .din0(din0),
    .dout0(dout0)
);

// Clock
initial begin
    clk0 = 0;
    forever #5 clk0 = ~clk0;
end

task write_mem;
input [3:0] addr;
input [1:0] data;
begin
    @(posedge clk0);
    csb0 = 0;
    web0 = 0;
    addr0 = addr;
    din0  = data;
    @(posedge clk0);
end
endtask

task read_mem;
input [3:0] addr;
begin
    @(posedge clk0);
    web0 = 1;
    csb0 = 0;
    addr0 = addr;
    @(posedge clk0);
end
endtask

initial begin

pass_count = 0;
fail_count = 0;

csb0 = 1;
web0 = 1;
addr0 = 0;
din0 = 0;

#20;

$display("\n==============================");
$display(" OpenRAM SRAM Regression");
$display("==============================");

// Test 1
$display("\nTEST1 : Write 00");
write_mem(4'd0,2'b00);
read_mem(4'd0);

if(dout0===2'b00) begin
    $display("PASS");
    pass_count=pass_count+1;
end
else begin
    $display("FAIL Expected=00 Got=%b",dout0);
    fail_count=fail_count+1;
end

// Test2
$display("\nTEST2 : Write 11");
write_mem(4'd1,2'b11);
read_mem(4'd1);

if(dout0===2'b11) begin
    $display("PASS");
    pass_count++;
end
else begin
    $display("FAIL Expected=11 Got=%b",dout0);
    fail_count++;
end

// Test3
$display("\nTEST3 : Alternating Pattern");
write_mem(4'd2,2'b10);
write_mem(4'd3,2'b01);

read_mem(4'd2);
read_mem(4'd3);

$display("Alternating pattern executed");

// Test4
$display("\nTEST4 : Back-to-back operations");
write_mem(4'd4,2'b01);
write_mem(4'd5,2'b10);

read_mem(4'd4);
read_mem(4'd5);

// Test5
$display("\nTEST5 : Disabled Cycle");

@(posedge clk0);
csb0=1;
web0=1;

@(posedge clk0);

$display("Disabled cycle completed");

// Test6
$display("\nTEST6 : Data Retention");

write_mem(4'd6,2'b11);

repeat(5)
@(posedge clk0);

read_mem(4'd6);

$display("Retention test executed");

$display("\n==============================");
$display("PASS = %0d",pass_count);
$display("FAIL = %0d",fail_count);
$display("==============================");

$finish;

end

endmodule
