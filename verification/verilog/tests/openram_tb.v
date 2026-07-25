`timescale 1ns/1ps

module openram_tb;

parameter DATA_WIDTH = 9;
parameter ADDR_WIDTH = 5;

reg clk0;
reg csb0;
reg web0;
reg [3:0] wmask0;
reg spare_wen0;
reg [ADDR_WIDTH-1:0] addr0;
reg [DATA_WIDTH-1:0] din0;
wire [DATA_WIDTH-1:0] dout0;

integer pass_count;
integer fail_count;

always #5 clk0 = ~clk0;

sky130_sram_0kbytes_1rw_8x16_2 DUT
(
    .clk0(clk0),
    .csb0(csb0),
    .web0(web0),
    .wmask0(wmask0),
    .spare_wen0(spare_wen0),
    .addr0(addr0),
    .din0(din0),
    .dout0(dout0)
);

task write_word;

input [ADDR_WIDTH-1:0] addr;
input [DATA_WIDTH-1:0] data;

begin

    // Drive signals before the clock edge
    addr0 = addr;
    din0 = data;
    csb0 = 0;
    web0 = 0;

    @(posedge clk0);   // Inputs are sampled here
    @(negedge clk0);   // Write happens here

    // Return bus to idle
    csb0 = 1;
    web0 = 1;

end
endtask


task read_word;

input [ADDR_WIDTH-1:0] addr;

begin

    addr0 = addr;
    csb0 = 0;
    web0 = 1;

    @(posedge clk0);   // Address/control sampled
    @(negedge clk0);   // Read performed

    #4;                // DELAY = 3, wait a little longer

    csb0 = 1;

end
endtask

task check_data;

input [DATA_WIDTH-1:0] expected;

begin

#1;

if(dout0 === expected)
begin
    $display("PASS  Time=%0t  Data=%h",$time,dout0);
    pass_count = pass_count + 1;
end
else
begin
    $display("FAIL  Time=%0t  Expected=%h  Got=%h",$time,expected,dout0);
    fail_count = fail_count + 1;
end

end
endtask

always @(posedge clk0)
begin
    $display("[%0t] POSEDGE: csb0=%b web0=%b addr=%0d din=%h wmask=%b spare=%b",
             $time, csb0, web0, addr0, din0, wmask0, spare_wen0);
end

always @(negedge clk0)
begin
    $display("[%0t] NEGEDGE: dout=%h", $time, dout0);
end

initial
begin

$dumpfile("verification/verilog/results/openram_tb.vcd");
$dumpvars(0,openram_tb);

clk0 = 0;

csb0 = 1;
web0 = 1;

wmask0 = 4'b1111;

spare_wen0 = 1;

addr0 = 0;
din0 = 0;

pass_count = 0;
fail_count = 0;

#20;

/************ Test 1 ************/
$display("");
$display("TEST-1 WRITE ZERO");

write_word(0,9'h000);
read_word(0);
check_data(9'h000);


/************ Test 2 ************/
$display("");
$display("TEST-2 WRITE ONE");

write_word(1,9'h1FF);
read_word(1);
check_data(9'h1FF);


/************ Test 3 ************/
$display("");
$display("TEST-3 ALTERNATING");

write_word(2,9'h155);
read_word(2);
check_data(9'h155);


/************ Test 4 ************/
$display("");
$display("TEST-4 ALTERNATING");

write_word(3,9'h0AA);
read_word(3);
check_data(9'h0AA);


$display("");
$display("------------------------------");
$display("PASS = %0d",pass_count);
$display("FAIL = %0d",fail_count);
$display("------------------------------");

#20;

$finish;

end

endmodule
