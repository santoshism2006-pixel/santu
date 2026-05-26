# Logic Gate Example - Tiny Tapeout Project

## How it works

This project is a simple Tiny Tapeout digital design written in Verilog.  
It demonstrates four basic logic gate operations:

- AND Gate
- OR Gate
- XOR Gate
- NOT Gate

The project takes inputs from the Tiny Tapeout input pins and produces outputs based on the logic operation.

### Input Pins

| Pin | Function |
|-----|----------|
| `ui_in[0]` | AND input A |
| `uio_in[0]` | AND input B |
| `ui_in[1]` | OR input A |
| `uio_in[1]` | OR input B |
| `ui_in[2]` | XOR input A |
| `uio_in[2]` | XOR input B |
| `ui_in[3]` | NOT input |

### Output Pins

| Pin | Function |
|-----|----------|
| `uo_out[0]` | AND output |
| `uo_out[1]` | OR output |
| `uo_out[2]` | XOR output |
| `uo_out[3]` | NOT output |

### Verilog Logic

```verilog
assign uo_out[0] = ui_in[0] & uio_in[0];
assign uo_out[1] = ui_in[1] | uio_in[1];
assign uo_out[2] = ui_in[2] ^ uio_in[2];
assign uo_out[3] = ~ui_in[3];
