`timescale 1ns/1ps

module task5_4kb_regression_tb;

    reg         clk0;
    reg         csb0;
    reg         web0;
    reg  [3:0]  wmask0;
    reg         spare_wen0;
    reg  [10:0] addr0;
    reg  [32:0] din0;
    wire [32:0] dout0;

    integer pass_count;
    integer fail_count;
    integer i;
    integer j;

    reg [31:0] expected;
    reg [31:0] pattern;
    reg [31:0] lfsr;

    task5_4kb_sram #(
        .VERBOSE(0)
    ) dut (
        .clk0(clk0),
        .csb0(csb0),
        .web0(web0),
        .wmask0(wmask0),
        .spare_wen0(spare_wen0),
        .addr0(addr0),
        .din0(din0),
        .dout0(dout0)
    );

    always #5 clk0 = ~clk0;

    task automatic write_word;
        input [9:0] logical_addr;
        input [31:0] data;
        begin
            @(negedge clk0);

            addr0       = {1'b0, logical_addr};
            din0        = {1'b0, data};
            csb0        = 1'b0;
            web0        = 1'b0;
            wmask0      = 4'b1111;
            spare_wen0  = 1'b0;

            @(posedge clk0);
            @(negedge clk0);

            csb0 = 1'b1;
        end
    endtask

    task automatic read_check;
        input [9:0] logical_addr;
        input [31:0] expected_data;
        begin
            @(negedge clk0);

            addr0       = {1'b0, logical_addr};
            csb0        = 1'b0;
            web0        = 1'b1;
            wmask0      = 4'b0000;
            spare_wen0  = 1'b0;
            din0        = 33'b0;

            @(posedge clk0);
            @(negedge clk0);

            #4;

            if (dout0[31:0] === expected_data) begin
                pass_count = pass_count + 1;
                $display(
                    "PASS addr=%0d expected=%08h actual=%08h",
                    logical_addr,
                    expected_data,
                    dout0[31:0]
                );
            end
            else begin
                fail_count = fail_count + 1;
                $display(
                    "FAIL addr=%0d expected=%08h actual=%08h",
                    logical_addr,
                    expected_data,
                    dout0[31:0]
                );
            end

            csb0 = 1'b1;
        end
    endtask

    task automatic write_read_check;
        input [9:0] logical_addr;
        input [31:0] data;
        begin
            write_word(logical_addr, data);
            read_check(logical_addr, data);
        end
    endtask

    initial begin
        clk0        = 1'b0;
        csb0        = 1'b1;
        web0        = 1'b1;
        wmask0      = 4'b0000;
        spare_wen0  = 1'b0;
        addr0       = 11'b0;
        din0        = 33'b0;

        pass_count = 0;
        fail_count = 0;

        repeat (2) @(posedge clk0);

        $display("===== TASK 5 4KB SRAM FUNCTIONAL REGRESSION =====");

        // ------------------------------------------------------------
        // First / last / representative boundary addresses
        // ------------------------------------------------------------

        $display("----- ADDRESS BOUNDARY TESTS -----");

        write_read_check(10'd0,    32'h00000000);
        write_read_check(10'd1,    32'hFFFFFFFF);

        write_read_check(10'd7,    32'hAAAAAAAA);
        write_read_check(10'd8,    32'h55555555);

        write_read_check(10'd127,  32'h12345678);
        write_read_check(10'd128,  32'h87654321);

        write_read_check(10'd255,  32'h0F0F0F0F);
        write_read_check(10'd256,  32'hF0F0F0F0);

        write_read_check(10'd511,  32'hA5A5A5A5);
        write_read_check(10'd512,  32'h5A5A5A5A);

        write_read_check(10'd1022, 32'hCAFEBABE);
        write_read_check(10'd1023, 32'hDEADBEEF);

        // ------------------------------------------------------------
        // Required fixed patterns
        // ------------------------------------------------------------

        $display("----- FIXED PATTERN TESTS -----");

        write_read_check(10'd32, 32'h00000000);
        write_read_check(10'd33, 32'hFFFFFFFF);
        write_read_check(10'd34, 32'hAAAAAAAA);
        write_read_check(10'd35, 32'h55555555);

        // ------------------------------------------------------------
        // Walking-1
        // ------------------------------------------------------------

        $display("----- WALKING-1 TESTS -----");

        for (i = 0; i < 32; i = i + 1) begin
            pattern = 32'b1 << i;
            write_read_check(10'd100 + i, pattern);
        end

        // ------------------------------------------------------------
        // Walking-0
        // ------------------------------------------------------------

        $display("----- WALKING-0 TESTS -----");

        for (i = 0; i < 32; i = i + 1) begin
            pattern = ~(32'b1 << i);
            write_read_check(10'd200 + i, pattern);
        end

        // ------------------------------------------------------------
        // Deterministic pseudorandom regression
        // ------------------------------------------------------------

        $display("----- PSEUDORANDOM TESTS -----");

        lfsr = 32'h1ACEB00C;

        for (j = 0; j < 64; j = j + 1) begin
            lfsr = {
                lfsr[30:0],
                lfsr[31] ^ lfsr[21] ^ lfsr[1] ^ lfsr[0]
            };

            write_read_check(10'd600 + j, lfsr);
        end

        // ------------------------------------------------------------
        // Final result
        // ------------------------------------------------------------

        $display("==============================================");
        $display("TOTAL_PASS = %0d", pass_count);
        $display("TOTAL_FAIL = %0d", fail_count);

        if (fail_count == 0) begin
            $display("TASK5_FUNCTIONAL_REGRESSION = PASS");
        end
        else begin
            $display("TASK5_FUNCTIONAL_REGRESSION = FAIL");
        end

        $display("==============================================");

        $finish;
    end

endmodule
