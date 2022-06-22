# Sidekick VCO build notes

## Which chip

The design specifies and assumes the Alfa AS3340A VCO chip, an improvement to the AS3340, although the AS3340 or Curtis CEM3340 probably would work. I have not tested either extensively. The CEM datasheet says the pulse output should have a 10k pulldown, versus 51k for the AS3340(A), though reportedly anything in that range works acceptably for either (see Sam Battle's LMNC 1222 schematic). If using CEM and you want to stick to the datasheet you could try changing R45 from 33k to 6.2k and R47 from 18k to 3.6k.

## Resistor matching

For proper V/oct tuning, certain groups of resistors need to be matched to one another to high precision. You can buy 0.1% precision resistors, but it is much cheaper to buy 100 or so 1% resistors and then measure them, setting aside ones that match at the 0.1% level. The actual value of the resistance is not critical, only that it be the same for resistors in each group. Different groups do not need to match each other.

Resistor groups to be matched are:

* Summing resistors in pitch CV input stage: R8, R9, and R10 (100k). 
* Octave switch resistors: R30 through R33 (10k) and R1, R2 (30k). For the latter choose resistors equal to three times the former, within 0.1%.

*It would not hurt to make a note of the resistance values for each group.* You will want to know this if you ever need to replace one of these resistors.

## Octave switch

Resistors R30 through R33 are not mounted on the PCB; they are soldered directly to the octave switch: R33 from pin 1 to pin 2, R32 from pin 2 to pin 3, R31 from pin 3 to pin 4, and R30 from pin 4 to pin 5. (Nothing is connected to pins 6–12.) These resistors are specified as 1/8 W metal film, solely because they fit nicely between the switch pins. You can use 1/4 watt resistors if that is what you have. They're just more awkward to place.

Three wires are connected to a Molex connector, to attach to header J3 on the circuit board. The wire connecting to the header pin marked +2V connects to rotary switch pin 5. The wire to header pin -2V connects to pin 1. The wire to header pin Octave connects to the center pin.

### Slide switch daughterboard

This daughterboard is secured to the front panel with two each M3x12 screws, 5mm spacers, and M3 nuts. Solder stranded wires to the four pads provided and connect the other ends to the main PCB with a 4 position Molex connector (or solder directly).

## Calibration
The main calibration is the usual procedure with 3340 based oscillators:

* With the octave swich in position -2 adjust the Center freq trimmer to get a fairly low frequency (100 Hz or so)
* Use a calibrated V/oct source such as a CV keyboard or MIDI/CV module to send 0 V and 2 V alternately to the V/oct input. Adjust the Tracking trimmer until the frequency ratio at these two CV values equals 2.000 ± 0.002.
* Turn the octave switch up to position 2. Again alternating 0 V and 2 V on the V/oct input, adjust the Hi freq track trimmer until the frequency ratio at these two CV values equals 2.000 ± 0.002.
* Repeat the last two steps if necessary to get the tracking as accurate as you can.
* Re-adjust the center frequency trimmer to your liking. I recommend setting it so with the fine tune knob centered and the octave switch at the 0 position, it gives the same pitch as the controlling Hero VCO.

(I did the calibration using my new MI Module Tester and it made it so easy it was ridiculous!)

There are still four more trimmers! One is for the PWM upper limit. With no PWM CV, adjust it so when you turn the Pulse width knob up the pulse waveform either never gets so wide it stops, or gets just barely to the stopping point, as you prefer.

The other three trimmers are for the sine waveform. Put the sine waveform on a scope and adjust Sine symmetry to make the top and bottom of the waveform the same; adjust Sine round to make it a good sine shape. Once you're happy with those, adjust Sine amplitude to make the waveform 10 V peak to peak.
