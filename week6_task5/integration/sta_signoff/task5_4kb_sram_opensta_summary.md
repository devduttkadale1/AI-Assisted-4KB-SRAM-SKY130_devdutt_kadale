# OpenSTA SS-Corner Sign-Off Summary

- OpenSTA: 3.1.0
- OpenSTA source commit: `737b52f33b66e4c2ccc3e3ef22c3adfe9aec8d09`
- Liberty corner: SS, 1.8 V, 25 C
- Clock period analyzed: 2.241 ns
- Maximum characterized model frequency: 446.229362 MHz
- Setup slack with zero external input delay: +2.138 ns (MET)
- Hold slack with zero external input delay: +0.056 ns (MET)
- High pulse-width slack: 0.000 ns (MET at characterized boundary)
- Low pulse-width slack: 0.000 ns (MET at characterized boundary)
- Minimum-period slack: 0.000 ns (MET at characterized boundary)
- OpenSTA warnings/errors: 0 / 0
- Reported violations: 0

## Clock-to-DOUT characterized-point validation

| Output load | Liberty delay | OpenSTA delay | Result |
| --- | ---: | ---: | --- |
| 0.0017225 pF | 0.446 ns | 0.446 ns | PASS |
| 0.0068900 pF | 0.478 ns | 0.478 ns | PASS |
| 0.0275600 pF | 0.606 ns | 0.606 ns | PASS |

`report_clock_min_period` reports `fmax=inf` for this hard-macro abstraction
because OpenSTA cannot see internal register-to-register paths inside the SRAM.
That value is not used for SRAM frequency sign-off. The applicable limit is
the Liberty `minimum_period` check on `clk0`, which OpenSTA evaluated at
2.241 ns with zero slack.

446.229362 MHz is the maximum characterized timing-model boundary, not a
guard-banded operating recommendation.
