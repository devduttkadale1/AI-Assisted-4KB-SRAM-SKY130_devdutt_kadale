# 4 KB SKY130 SRAM — Post-Layout Datasheet

## Post-Layout Specifications

| Parameter | Result |
|---|---:|
| Technology | SKY130 |
| Organization | 1024 × 32 |
| Capacity | 4 KB |
| Port | Single-port 1RW |
| Supply | 1.8 V |
| Address width | 10 bits |
| Data width | 32 bits |
| Macro size | 808.845 µm × 351.29 µm |
| Macro area | 284,139.16 µm² |
| Extraction | C-extracted |
| Magic DRC | **0 violations** |
| Netgen LVS | **Unique match** |
| Functional regression | **144 PASS / 0 FAIL** |

## Post-Layout Characterization

| Parameter | TT | SS | FF | Unit |
|---|---:|---:|---:|---|
| Worst write time | 77.9407 | 117.096 | 60.6197 | ps |
| Read access SEN50→DOUT50 | 40.8805 | 71.8089 | N/A* | ps |
| Leakage power | 3.8723 | 7.0853 | 8.2157 | µW |
| Read energy | 31.3736 | 42.3984 | 42.0730 | fJ |
| Write energy | 95.0453 | 177.7866 | 101.2986 | fJ |

\* FF WL50→DOUT50 = **392.222 ps** because DOUT crosses before SEN50.

## Timing Model

| Parameter | Result |
|---|---:|
| SS minimum period | 2.241 ns |
| Liberty-model boundary | 446.229362 MHz |
| OpenSTA setup slack | +2.138 ns |
| OpenSTA hold slack | +0.056 ns |
| OpenSTA result | **PASS** |

[Download the formatted PDF datasheet](Task5_4KB_SRAM_PostLayout_Datasheet.pdf)
