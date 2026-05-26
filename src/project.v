/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_logic_example (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // Bidirectional inputs
    output wire [7:0] uio_out,  // Bidirectional outputs
    output wire [7:0] uio_oe,   // Output enable
    input  wire       ena,      // Enable signal
    input  wire       clk,      // Clock
    input  wire       rst_n     // Active-low reset
);

    // Example Logic Operations
    // ui_in[0] AND uio_in[0] -> uo_out[0]
    // ui_in[1] OR  uio_in[1] -> uo_out[1]
    // ui_in[2] XOR uio_in[2] -> uo_out[2]
    // ui_in[3] NOT            -> uo_out[3]

    assign uo_out[0] = ui_in[0] & uio_in[0];
    assign uo_out[1] = ui_in[1] | uio_in[1];
    assign uo_out[2] = ui_in[2] ^ uio_in[2];
    assign uo_out[3] = ~ui_in[3];

    // Remaining outputs set to 0
    assign uo_out[7:4] = 4'b0000;

    // No bidirectional output used
    assign uio_out = 8'b00000000;

    // Set all bidirectional pins as inputs
    assign uio_oe = 8'b00000000;

    // Prevent unused signal warnings
    wire _unused = &{ena, clk, rst_n, 1'b0};

endmodule
