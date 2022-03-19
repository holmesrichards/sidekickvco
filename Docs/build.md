## Resistor matching

For proper V/oct tuning, certain groups of resistors need to be matched to one another to high precision. You can buy 0.1% precision resistors, but it is much cheaper to buy 100 or so 1% resistors and then measure them, setting aside ones that match at the 0.1% level. The actual value of the resistance is not critical, only that it be the same for resistors in each group. Different groups do not need to match each other.

Resistor groups to be matched are:

* Summing resistors in pitch CV input stage: R8, R9, and R10 (100k). 
* Octave switch resistors: R30 through R33 (10k) and R1, R2 (30k). For the latter choose resistors equal to three times the former, within 0.1%.

*It would not hurt to make a note of the resistance values for each group.* You will want to know this if you ever need to replace one of these resistors.

## Octave switch

Resistors R30 through R33 are not mounted on the PCB; they are soldered directly to the octave switch: R33 from pin 1 to pin 2, R32 from pin 2 to pin 3, R31 from pin 3 to pin 4, and R30 from pin 4 to pin 5. (Nothing is connected to pins 6–12.) These resistors are specified as 1/8 W metal film, solely because they fit nicely between the switch pins. You can use 1/4 watt resistors if that is what you have. They're just more awkward to place.

Three wires are connected to a Molex connector, to attach to header J3 on the circuit board. The wire connecting to the header pin marked +2V connects to rotary switch pin 5. The wire to header pin -2V connects to pin 1. The wire to header pin Octave connects to the center pin.
