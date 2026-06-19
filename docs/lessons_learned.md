# Lessons Learned

## SRAM Fundamentals

* SRAM is a high-speed memory technology used for processor caches and on-chip storage.
* Unlike DRAM, SRAM does not require periodic refresh operations.
* SRAM achieves fast access times at the cost of increased silicon area.

---

## 6T SRAM Cell

* A standard SRAM bitcell consists of six transistors.
* Two cross-coupled inverters store complementary values.
* Two access transistors connect the storage nodes to the bitlines during read and write operations.

---

## Read Operation

* SRAM uses differential bitlines (BL and BLB).
* Bitlines are precharged before each read cycle.
* A small voltage difference is developed and detected by the sense amplifier.
* Read operations should not disturb the stored data.

---

## Write Operation

* The write driver forces BL and BLB to the desired logic values.
* The selected wordline enables access to the target cell.
* The previous stored value is overwritten by the new data.

---

## Precharge Circuit

* Precharge circuits prepare bitlines before every read operation.
* Equalized bitlines improve sensing accuracy.
* Proper precharging reduces read delay and improves reliability.

---

## Sense Amplifier

* Sense amplifiers detect very small voltage differences.
* They convert analog bitline variations into full digital logic levels.
* Sense amplifiers are critical for high-speed SRAM operation.

---

## Row Decoder

* The row decoder converts address bits into one-hot wordline signals.
* Only one row is activated during a memory access.
* Decoder delay contributes directly to memory access time.

---

## Column Multiplexer

* Column multiplexing allows multiple logical words to share the same physical row.
* OpenRAM uses column muxing to reduce array dimensions and improve layout efficiency.
* Column address bits select the required word from the physical array.

---

## OpenRAM Memory Compiler

* OpenRAM converts a high-level memory specification into a complete SRAM macro.
* Configuration files define memory size, technology, and operating conditions.
* OpenRAM automatically generates peripheral circuitry such as decoders, sense amplifiers, and write drivers.

---

## SKY130 Technology Integration

* SKY130 provides transistor models, design rules, and technology-specific information.
* OpenRAM relies on SKY130 technology files during SRAM generation.
* Technology files determine layout rules, timing models, and characterization behavior.

---

## ASIC Output Files

* Verilog models support digital simulation.
* SPICE netlists support circuit-level analysis.
* LEF files support physical design integration.
* LIB files support timing and power analysis.
* GDS files represent the final physical layout.
* Log files provide debugging and flow information.

---

## AI-Assisted Engineering Workflow

* AI tools can accelerate learning and documentation.
* Generated information must always be verified against repository files and technical references.
* Understanding the engineering concepts is more important than copying AI-generated content.
