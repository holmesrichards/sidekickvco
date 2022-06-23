# How the Sidekick VCO works

## Control voltages

The linear FM control voltage from the front panel jack is AC coupled by C4, then R12 converts the voltage to current. The FM CV from the link header is handled the same way. The summed current is input to the 3340 chip.

The octave switch voltage output is buffered by U1A. RV5 supplies an adjustable offset voltage for fine tuning. RV2 attenuates the high frequency tracking voltage from the 3340, and RV3 creates an adjustable offset voltage to set the center frequency. All these voltages go to summing resistors and from there to the 3340 CV node. To make sure the octave switch and V/oct CVs remain accurately 1 V/oct the summing resistors must be matched.

The sync input is sent via switch SW2 to either the hard or soft sync circuit, or neither. For hard sync the level is divided by R20 and R22, the pulse width is set by those in combination with C7, and D1 causes only negative going pulses to be sent. For soft sync, R21 combined with C7 establishes the pulse width. If neither is selected, C11 is connected to the soft sync pin as recommended in the 3340 datasheet.

The pulse width modulation CVs from the front panel jack and the link header are summed and inverted by R25, R26, R27, and U1B. R28, R29, and RV4 scale and offset the resulting voltage to correspond to the 3340's PWM range (about 0 to 4 V with 12 V supply).

## 3340

The 3340 connections are mostly as in the datasheet. VEE is connected directly to -5 V, rather than via a resistor to -12 V, to improve performance and eliminate the pulse width frequency shift. R3 between pins 4 and 5 eliminates ringing oscillations on the falling edge of the pulse waveform.

## ±5 V references

Two LM4040 shunt voltage references, U4 and U5, are used with current limiting resistors R23 and R24 to create accurate ±5 V references, used by the fine tune control, center frequency trimmer, and octave switch.

## -5 V regulator

U5 is a voltage regulator to supply negative power to the 3340. D2 and C12 are per the L79L05 datasheet.

## Octave switch

Matched 10k resistors along with 30k resistors R1 and R2 form a precision voltage divider between ±5 V whose output is +2, +1, 0, -1, -2 V.

## Output conditioning

The 3340's waveform outputs are about 0 to 10.5 V for pulse, 0 to 8 V for ramp/saw, and 0 to 4 V for triangle. The triangle waveform is rescaled and offset to ±5 V by R48, R51, R54, and U6C. R48 and R51 divide +12 V down to the desired offset and the ratio of R54 to these resistors sets the gain. R57 limits current to the waveform output jack.

The same rescaling and offset circuit is used on the ramp and pulse waveforms as well, after a voltage divider (R44 and R46 for ramp, R45 and R47 for pulse) scales these outputs down to 0 to 4 V. R45 and R47 also serve as a 51k pulldown as called for in the AS3340 datasheet.

Using the +12 V rail for the offset means it is sensitive to power supply fluctuations, but this is not likely to be a concern.

## Sine shaping

The sine shaping circuit is based on a differential transistor pair, Q1 and Q2. This is a standard tri to sine design. The amount of rounding depends on the input signal level so attenuator RV6 gives control over that. RV7 adjusts the balance between the two transistors' bias to control the symmetry of the rounding. U6D with R41 and R42 is a differential current amplifier, turning the difference in the collector currents into an output voltage. R43 and RV8 attenuate the output down to ±5 V.
