# Week 1 Journal

## Day 1 – SRAM Architecture and 6T Cell

### Activities
- Studied SRAM memory hierarchy.
- Learned why SRAM is used in processor caches.
- Studied SRAM macro architecture.
- Reviewed Row Decoder, Wordline Driver, Bitcell Array, Precharge Circuit, Sense Amplifier, Write Driver, and Control Logic.
- Studied the transistor-level structure of a 6T SRAM cell.

### Key Learnings
- SRAM uses cross-coupled inverters to store data.
- SRAM provides high-speed access without refresh.
- Wordline controls cell access.
- BL and BLB are differential bitlines used for read and write operations.

---

## Day 2 – Read and Write Operations

### Activities
- Studied SRAM read operation.
- Studied SRAM write operation.
- Understood the role of precharge circuits.
- Learned how sense amplifiers detect small voltage differences.
- Learned how write drivers overwrite existing cell data.

### Key Learnings
- Read operation uses differential sensing.
- Write operation forces BL and BLB to desired values.
- Precharge improves read reliability.
- Sense amplifiers are critical for high-speed SRAM reads.

### Next Steps
- Study OpenRAM architecture and flow.
- Understand SKY130 technology integration.
- Analyze OpenRAM configuration files.