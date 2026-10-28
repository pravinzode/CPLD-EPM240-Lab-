# Sensor Based Projects 

| SN | Description | Documentation Link |
| :--- | :--- | :--- |
| 1 | How to install the project | [Read Installation Guide](docs/installation.md) |
| 2 | How to use the software | [Read Usage Guide](docs/usage.md) |
| 3 | Latest changes and fixes | [View Patch Notes](patch-notes.md) |






# KY-032 Obstacle Detector Using Verilog HDL

A simple beginner-level project using the **KY-032 infrared obstacle sensor** and an **EPM240T100C5N MAX II CPLD**.

## Project Overview

The KY-032 sensor detects an object in front of it. The CPLD reads the sensor's digital output and controls two LEDs:

- **Red LED ON:** an obstacle is detected.
- **Green LED ON:** the path is clear.

## Hardware Required

- EPM240T100C5N CPLD development board
- KY-032 infrared obstacle sensor module
- Red LED and green LED (or suitable onboard LEDs)
- Current-limiting resistors for external LEDs, typically 330 Ω
- Jumper wires

## Connections

| KY-032 / Circuit Signal | Connect To |
|---|---|
| VCC | Suitable sensor supply, according to the module specification |
| GND | CPLD board GND |
| OUT | CPLD input pin assigned to `sensor_out` |
| Red LED circuit | CPLD output assigned to `red_led` |
| Green LED circuit | CPLD output assigned to `green_led` |
| EN | Set to the enabled state according to the sensor module markings |

Use Quartus II Pin Planner to assign the Verilog ports to the correct physical pins on your particular development board.

> **Electrical safety:** Check the KY-032 output voltage and the CPLD board's I/O specifications before connecting `OUT`. Do not connect a 5 V output directly to a CPLD input unless the board specifications explicitly permit it. Use a suitable level shifter or divider if required. Connect external LEDs through current-limiting resistors.

## Verilog HDL Code

Save the following code as `KY032_Obstacle_Detector.v`.

```verilog
module KY032_Obstacle_Detector (
    input  wire sensor_out,
    output wire red_led,
    output wire green_led
);

    // Assumption: sensor_out is LOW when an obstacle is detected
    assign red_led   = ~sensor_out;
    assign green_led =  sensor_out;

endmodule
```

## How It Works

This is a **combinational logic circuit**, so no clock is required.

| `sensor_out` | `red_led` | `green_led` | Meaning |
|---:|---|---|---|
| 0 (LOW) | ON | OFF | Obstacle detected |
| 1 (HIGH) | OFF | ON | Path clear |

The code assumes that the sensor output is active-LOW when an obstacle is detected and that the LED outputs are active-HIGH. Sensor polarity and onboard LED polarity can vary; verify your hardware. If the sensor output is active-HIGH when an obstacle is detected, swap the two assignments.

## Quartus II Steps

1. Create a new Quartus II project.
2. Select the exact CPLD device fitted to your board.
3. Add `KY032_Obstacle_Detector.v` to the project.
4. Set `KY032_Obstacle_Detector` as the top-level entity.
5. Open **Pin Planner** and assign `sensor_out`, `red_led`, and `green_led` to valid board pins.
6. Compile the design.
7. Program the CPLD and test the sensor with an object at different distances.

## Troubleshooting

- **LEDs operate in reverse:** Check sensor output polarity and LED wiring.
- **No detection:** Check VCC, GND, EN, sensor alignment, and the module's sensitivity adjustment if available.
- **Unexpected behavior:** Verify the pin assignments and ensure the sensor output voltage is compatible with the CPLD input.

**Sensor:** KY-032 IR obstacle avoidance module

