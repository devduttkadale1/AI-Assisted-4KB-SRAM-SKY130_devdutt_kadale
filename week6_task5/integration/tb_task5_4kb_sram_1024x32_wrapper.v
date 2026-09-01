`timescale 1ns/1ps

// Apply the timescale to the unmodified generated OpenRAM behavioral model.
// OpenRAM behavioral model is compiled separately from week6_task5/generated/task5_4kb_sram.v

module tb_task5_4kb_sram_1024x32_wrapper;

    reg         clk;
    reg         csb;
    reg         web;
    reg  [3:0]  wmask;
    reg  [9:0]  addr;
    reg  [31:0] din;
    wire [31:0] dout;

    integer pass_count;
    integer fail_count;

    task5_4kb_sram_1024x32_wrapper dut (
        .clk   (clk),
        .csb   (csb),
        .web   (web),
        .wmask (wmask),
        .addr  (addr),
        .din   (din),
        .dout  (dout)
    );

    initial clk = 1'b0;
    always #5 clk = ~clk;

    task check_mapping;
        begin
            if (dut.macro_addr[10] !== 1'b0) begin
                $display("FAIL MAPPING macro_addr[10]=%b", dut.macro_addr[10]);
                fail_count = fail_count + 1;
            end
            else begin
                $display("PASS MAPPING spare-row address bit tied low");
                pass_count = pass_count + 1;
            end

            if (dut.macro_din[32] !== 1'b0) begin
                $display("FAIL MAPPING macro_din[32]=%b", dut.macro_din[32]);
                fail_count = fail_count + 1;
            end
            else begin
                $display("PASS MAPPING spare-column data bit tied low");
                pass_count = pass_count + 1;
            end
        end
    endtask

    task write_word;
        input [9:0]  a;
        input [31:0] d;
        input [3:0]  mask;
        begin
            @(negedge clk);
            addr  = a;
            din   = d;
            wmask = mask;
            csb   = 1'b0;
            web   = 1'b0;

            // OpenRAM captures inputs on posedge,
            // performs write on following negedge.
            @(posedge clk);
            @(negedge clk);
            #1;

            csb   = 1'b1;
            web   = 1'b1;
            wmask = 4'b0000;
        end
    endtask

    task read_check;
        input [9:0]  a;
        input [31:0] expected;
        begin
            @(negedge clk);
            addr  = a;
            csb   = 1'b0;
            web   = 1'b1;
            wmask = 4'b0000;

            @(posedge clk);
            @(negedge clk);

            // Generated behavioral macro uses DELAY=3.
            #4;

            if (dout === expected) begin
                $display(
                    "PASS READ addr=%0d data=%08x",
                    a,
                    dout
                );
                pass_count = pass_count + 1;
            end
            else begin
                $display(
                    "FAIL READ addr=%0d expected=%08x got=%08x",
                    a,
                    expected,
                    dout
                );
                fail_count = fail_count + 1;
            end

            csb = 1'b1;
        end
    endtask

    initial begin
        pass_count = 0;
        fail_count = 0;

        csb   = 1'b1;
        web   = 1'b1;
        wmask = 4'b0000;
        addr  = 10'd0;
        din   = 32'd0;

        #1;
        check_mapping();

        // First / last address.
        write_word(10'd0,    32'h00000000, 4'b1111);
        write_word(10'd1023, 32'hFFFFFFFF, 4'b1111);

        // 8-word column/row boundary.
        write_word(10'd7,    32'hAAAAAAAA, 4'b1111);
        write_word(10'd8,    32'h55555555, 4'b1111);

        // Additional representative boundaries/patterns.
        write_word(10'd127,  32'h00000001, 4'b1111);
        write_word(10'd128,  32'h80000000, 4'b1111);
        write_word(10'd511,  32'hDEADBEEF, 4'b1111);
        write_word(10'd512,  32'h12345678, 4'b1111);

        read_check(10'd0,    32'h00000000);
        read_check(10'd1023, 32'hFFFFFFFF);
        read_check(10'd7,    32'hAAAAAAAA);
        read_check(10'd8,    32'h55555555);
        read_check(10'd127,  32'h00000001);
        read_check(10'd128,  32'h80000000);
        read_check(10'd511,  32'hDEADBEEF);
        read_check(10'd512,  32'h12345678);

        // Explicit byte-write-mask integration test.
        write_word(10'd256, 32'h00000000, 4'b1111);
        write_word(10'd256, 32'hAABBCCDD, 4'b0001);
        read_check (10'd256, 32'h000000DD);

        write_word(10'd256, 32'hAABBCCDD, 4'b0010);
        read_check (10'd256, 32'h0000CCDD);

        write_word(10'd256, 32'hAABBCCDD, 4'b1100);
        read_check (10'd256, 32'hAABBCCDD);

        $display("");
        $display("========================================");
        $display("INTEGRATION_PASS_COUNT=%0d", pass_count);
        $display("INTEGRATION_FAIL_COUNT=%0d", fail_count);

        if (fail_count == 0) begin
            $display("R109_LOGICAL_1024X32_INTEGRATION=PASS");
        end
        else begin
            $display("R109_LOGICAL_1024X32_INTEGRATION=FAIL");
        end

        $display("========================================");

        #5;
        $finish;
    end

endmodule
