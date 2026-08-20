# Seven Segment Display Decoder

A Verilog implementation of a 7-segment display decoder that converts 4-bit BCD (Binary Coded Decimal) inputs into the corresponding 7-segment display outputs.

## Project Structure

```
sevensegdisplay/
├── rtl/
│   └── sevsegdis.v          # RTL module for seven segment display decoder
├── tb/
│   └── sevenseg_tb.v        # Testbench for seven segment display
├── seven_segment.vcd        # Waveform dump file (generated after simulation)
└── README.md                # This file
```

## Files Description

### RTL Module (`rtl/sevsegdis.v`)
The main module that implements a combinational circuit to decode BCD input to 7-segment display outputs.

**Ports:**
- `input [3:0] bcd_in` - 4-bit BCD input (0-9, with values 10-15 showing blank)
- `output reg [6:0] seg_out` - 7-bit output for segments a-g (MSB to LSB)

**Segment Mapping:**
```
      a
    -----
   |     |
 f |     | b
   |  g  |
    -----
   |     |
 e |     | c
   |  d  |
    -----
```

Output format: `{g, f, e, d, c, b, a}`

### Testbench (`tb/sevenseg_tb.v`)
Generates BCD inputs from 0 to 11 and displays the corresponding 7-segment outputs. It also generates a VCD waveform dump file for simulation analysis.

## Compilation and Simulation

### Prerequisites
- Install Icarus Verilog: `brew install icarus-verilog` (macOS)

### Compile
```bash
iverilog -o simulation rtl/sevsegdis.v tb/sevenseg_tb.v
```

### Run Simulation
```bash
vvp simulation
```

### Combined Command
```bash
iverilog -o simulation rtl/sevsegdis.v tb/sevenseg_tb.v && vvp simulation
```

## Output
The simulation will display:
```
--------7segment display--------
Time    BCD     gfedcba
10      0       1111110
20      1       0110000
...
```

## Waveform Viewing

A VCD (Value Change Dump) file `seven_segment.vcd` is generated during simulation. View it with:

### GTKWave (macOS)
```bash
brew install gtkwave
gtkwave seven_segment.vcd
```

### Surfer or other waveform viewers
Open `seven_segment.vcd` with your preferred simulator waveform viewer.

## Truth Table

| BCD Input | Decimal | Segments (gfedcba) | Display |
|-----------|---------|-------------------|---------|
| 0000      | 0       | 1111110           | 0       |
| 0001      | 1       | 0110000           | 1       |
| 0010      | 2       | 1101101           | 2       |
| 0011      | 3       | 1111001           | 3       |
| 0100      | 4       | 0110011           | 4       |
| 0101      | 5       | 1011011           | 5       |
| 0110      | 6       | 1011111           | 6       |
| 0111      | 7       | 1110000           | 7       |
| 1000      | 8       | 1111111           | 8       |
| 1001      | 9       | 1111011           | 9       |
| 1010+     | 10+     | 0000000           | Blank   |

## Notes
- The design uses combinational logic (no clocking)
- Inputs 10-15 are decoded to blank (all segments off)
- Common anode/cathode configuration can be modified by inverting the output bits

