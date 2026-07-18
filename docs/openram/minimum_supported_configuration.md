# OpenRAM Minimum Supported Configuration

## Requested Task

Generate a **2-word × 16-bit** single-port SRAM.

## Observation

During OpenRAM compilation, the tool successfully reached the SRAM configuration stage. However, the OpenRAM version used in this project enforces a minimum row constraint during memory generation.

As a result, the requested 2-word × 16-bit SRAM cannot be generated directly without modifying the OpenRAM compiler source code.

## OpenRAM Limitation

The OpenRAM compiler automatically selects the minimum supported memory organization based on its internal architectural constraints.

For the OpenRAM version used in this project, the generated reference macro is:

- Words: 16
- Word Size: 2 bits
- Banks: 1
- Address Width: 4 bits

This represents the minimum supported specification without modifying the compiler.

## Decision

Following the project guidance, the **minimum specification supported by the OpenRAM version** was selected as the target for generation and verification.

The standard OpenRAM flow was preserved without modifying the compiler source code.

All generated artifacts (GDS, LEF, Liberty, Verilog, SPICE), configuration files, and compilation logs are included in this repository together with documentation of this limitation.
