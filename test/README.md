# Tiny Tapeout Logic Example

This project is a simple Tiny Tapeout design that demonstrates basic digital logic operations using Verilog.

## Project Description

The module performs the following operations:

| Output Pin | Operation |
|------------|------------|
| `uo_out[0]` | AND operation |
| `uo_out[1]` | OR operation |
| `uo_out[2]` | XOR operation |
| `uo_out[3]` | NOT operation |
| `uo_out[7:4]` | Always 0 |

The design uses:
- `ui_in` as primary input signals
- `uio_in` as secondary input signals
- `uo_out` as output signals

---

## Verilog Module

```verilog
assign uo_out[0] = ui_in[0] & uio_in[0];
assign uo_out[1] = ui_in[1] | uio_in[1];
assign uo_out[2] = ui_in[2] ^ uio_in[2];
assign uo_out[3] = ~ui_in[3];
