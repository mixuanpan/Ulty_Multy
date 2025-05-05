# EMG-Driven LED System Using Dual 555 Timers

This project simulates electromyography (EMG) signals and uses a dual 555 timer setup to trigger LED responses based on muscle activity. Designed as a low-cost, analog interface for potential brain-machine integration, the system highlights the timing capabilities of 555 timers in both monostable and astable configurations.

## Project Objectives

- Simulate muscle signals using an op-amp and function generator
- Use monostable 555 timer to generate gated pulses based on EMG-like triggers
- Drive LEDs using an astable 555 timer during active pulse windows
- Visualize signal strength by LED pulse count
- Explore biomedical circuit prototyping for prosthetic interface concepts

## Circuit Overview

- **Op-Amp Preprocessing**: LM324 comparator detects EMG-like pulses
- **Monostable Timer (555 #1)**: Generates a single pulse per trigger (~1.1 sec)
- **Astable Timer (555 #2)**: Produces square waves to blink LEDs during pulse duration
- **LEDs**: Number of blinks corresponds to EMG signal strength

## Experimental Details

### Monostable Mode
- **Timing Equation**: `T = 1.1 * R * C`
- **Values Used**: `R = 100kΩ`, `C = 10µF` → `T ≈ 1.1 sec`
- **Measured Output**: 1.08–1.1 sec pulse width

### Astable Mode
- **Timing Equations**:
  - `f ≈ 1.44 / ((R1 + 2*R2) * C)`
  - `Duty Cycle = (R1 + R2) / (R1 + 2*R2)`
- **Values Used**: `R1 = 10kΩ`, `R2 = 22kΩ`, `C = 10µF`
- **Expected Output**: ~2.91 Hz, 65% duty cycle
- **Measured Output**: ~2.85 Hz, 350 ms pulse width

##  Tools Used

- **Oscilloscope**: For waveform verification and signal timing analysis
- **Function Generator**: Simulated EMG signals with square waves (0–2V, 2–10 Hz)
- **Breadboard Components**: 555 timers, LM324 op-amp, resistors, capacitors, LEDs

## Results Summary

| Condition         | Simulation | Real Output |
|------------------|------------|-------------|
| Weak EMG Signal  | 1 blink    | 1 blink     |
| Strong EMG Signal| 5–6 blinks | 5–6 blinks  |

- Pulse widths, frequency, and LED behavior closely matched theoretical predictions.
- Oscilloscope measurements validated circuit timing and threshold behavior.

## Improvements

- Use precision components to reduce timing drift
- Add low-pass filter for cleaner comparator output
- Integrate real EMG electrodes and ADCs for next-stage testing

## References

- [TI LM555 Datasheet](https://arc.net/l/quote/lfnlvizb)
- [TI LM741 Op-Amp](https://arc.net/l/quote/nkdecbuu)
- [LM324 Comparator Info](https://www.ariat-tech.com/blog/lm324-operational-amplifiers-pinouts,application-examples,size-packages,datasheets.html)

---


