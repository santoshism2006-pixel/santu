/*
 * Testbench for tt_um_logic_example
 */

`timescale 1ns/1ps

module tb_tt_um_logic_example;

    // Testbench signals
    reg  [7:0] ui_in;
    reg  [7:0] uio_in;
    reg        ena;
    reg        clk;
    reg        rst_n;

    wire [7:0] uo_out;
    wire [7:0] uio_out;
    wire [7:0] uio_oe;

    // Instantiate the DUT (Device Under Test)
    tt_um_logic_example dut (
        .ui_in(ui_in),
        .uo_out(uo_out),
        .uio_in(uio_in),
        .uio_out(uio_out),
        .uio_oe(uio_oe),
        .ena(ena),
        .clk(clk),
        .rst_n(rst_n)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;   // 10ns clock period
    end

    // Test sequence
    initial begin

        // Initialize signals
        ui_in  = 8'b00000000;
        uio_in = 8'b00000000;
        ena    = 1'b1;
        rst_n  = 1'b0;

        // Apply reset
        #10;
        rst_n = 1'b1;

        // -------------------------------
        // Test Case 1
        // AND = 1, OR = 1, XOR = 0, NOT = 1
        // -------------------------------
        ui_in[0]  = 1'b1;
        uio_in[0] = 1'b1;

        ui_in[1]  = 1'b0;
        uio_in[1] = 1'b1;

        ui_in[2]  = 1'b1;
        uio_in[2] = 1'b1;

        ui_in[3]  = 1'b0;

        #10;

        $display("Test Case 1");
        $display("uo_out = %b", uo_out);

        // -------------------------------
        // Test Case 2
        // AND = 0, OR = 0, XOR = 1, NOT = 0
        // -------------------------------
        ui_in[0]  = 1'b1;
        uio_in[0] = 1'b0;

        ui_in[1]  = 1'b0;
        uio_in[1] = 1'b0;

        ui_in[2]  = 1'b1;
        uio_in[2] = 1'b0;

        ui_in[3]  = 1'b1;

        #10;

        $display("Test Case 2");
        $display("uo_out = %b", uo_out);

        // -------------------------------
        // Test Case 3
        // Random values
        // -------------------------------
        ui_in  = 8'b10101010;
        uio_in = 8'b11001100;

        #10;

        $display("Test Case 3");
        $display("ui_in   = %b", ui_in);
        $display("uio_in  = %b", uio_in);
        $display("uo_out  = %b", uo_out);

        // Finish simulation
        #20;
        $finish;

    end

endmodule
