# R109 targeted C-extracted vs OpenRAM Liberty comparison

The two data sets are intentionally different in scope. R109 models one extracted bitcell/read/write path with ideal wordline/control stimulus; OpenRAM Liberty represents analytical full-macro clock-to-data and cycle constraints.

| Corner | Target read metric | Target read | Liberty macro read max | Target / Liberty | Target leakage | Liberty leakage | Liberty min period | Liberty fmax |
|---|---|---:|---:|---:|---:|---:|---:|---:|
| TT | SEN50_to_DOUT50_transition | 0.040881 ns | 0.551 ns | 7.42% | 3.872 uW | 33.871 uW | 2.037 ns | 490.918 MHz |
| SS | SEN50_to_DOUT50_transition | 0.071809 ns | 0.606 ns | 11.85% | 7.085 uW | 33.871 uW | 2.241 ns | 446.229 MHz |
| FF | WL50_to_DOUT50 | 0.392222 ns | 0.496 ns | 79.08% | 8.216 uW | 33.871 uW | 1.834 ns | 545.256 MHz |

## Interpretation

- TT and SS targeted read delays are much smaller than Liberty clock-to-data delays because the targeted bench omits the full address decoder, wordline distribution, full bitline-array capacitance, macro routing, and full output loading.

- SS is the slowest corner in both data sets. The targeted SS bench additionally demonstrated that the B read needed a minimum tested WL-to-SEN separation of 1.00 ns; 0.75 ns failed while 1.00, 1.25, and 1.50 ns passed.

- FF DOUT reached its 50% threshold before SEN reached 50%, so a positive SEN-to-DOUT delay is undefined. The reported FF targeted read metric is therefore WL50-to-DOUT50 and must not be treated as an apples-to-apples Liberty clock-to-data measurement.

- Liberty leakage is 33.871 uW at TT, SS, and FF in the generated files, indicating the analytical leakage value is corner-invariant here. R109 leakage covers only the tiny targeted path and therefore is substantially smaller.

- Targeted read/write energy is raw VDD energy integrated over the validated 4 ns operation windows. The Liberty internal_power scalar values are not converted to event energy here because the generated files do not provide a clearly usable power-unit/event-energy interpretation for those very large scalar values.

- The Liberty minimum-period constraint, not the tiny-path transistor delay, is the correct starting point for macro-level STA frequency.
