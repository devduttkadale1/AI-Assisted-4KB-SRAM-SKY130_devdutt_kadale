s

## Week 6 — Task 5: 4 KB OpenRAM SRAM

Target: 1024 words × 32 bits, single-port 1RW SRAM using OpenRAM on SKY130.

### Completed

- [x] Establish 1024 × 32 SRAM configuration
- [x] Generate production GDS
- [x] Generate LEF
- [x] Generate Verilog
- [x] Generate SPICE
- [x] Generate TT Liberty
- [x] Generate SS Liberty
- [x] Generate FF Liberty
- [x] Validate interface and generated hierarchy
- [x] Build automated functional regression
- [x] Test first, last, and representative boundary addresses
- [x] Test all-zero pattern
- [x] Test all-one pattern
- [x] Test alternating patterns
- [x] Test walking-1 pattern
- [x] Test walking-0 pattern
- [x] Test deterministic pseudorandom patterns
- [x] Functional regression: 144 PASS / 0 FAIL
- [x] Magic DRC: 0 errors
- [x] Complete corrected Magic extraction
- [x] Generate extracted top-level SPICE
- [x] Netgen LVS connectivity match
- [x] Resolve LVS device-property mismatch without waivers
- [x] Final Netgen LVS: clean unique match
- [x] Package sign-off evidence in repository
- [x] Generate SHA-256 evidence manifest

### Remaining

- [ ] Characterize TT operating corner
- [ ] Characterize SS operating corner
- [ ] Characterize FF operating corner
- [ ] Report read access timing
- [ ] Report write timing
- [ ] Report leakage power
- [ ] Report read energy
- [ ] Report write energy
- [ ] Compare characterization results against Liberty timing
- [ ] Complete SRAM integration / STA workflow
- [ ] Determine maximum safe operating frequency
- [ ] Complete clean-clone reproducibility verification
- [ ] Complete final Task-5 AI/error-fix documentation
- [ ] Complete final repository audit
- [ ] Create final Task-5 repository commit
- [ ] Push validated checkpoint
