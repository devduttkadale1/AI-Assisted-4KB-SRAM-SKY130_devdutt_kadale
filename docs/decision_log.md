# Engineering Decision Log

## Decision 01 – Use SRAM_SKY130 as Reference Repository

### Decision

Use the SRAM_SKY130 repository as a learning reference rather than directly copying its implementation.

### Reason

The objective of the internship is to understand SRAM design and OpenRAM workflows rather than reproduce an existing project.

### Outcome

Created independent documentation and learning notes based on repository analysis.

---

## Decision 02 – Focus on Architecture Before Tool Execution

### Decision

Study SRAM architecture and OpenRAM flow before attempting OpenRAM installation and execution.

### Reason

Understanding the underlying concepts reduces debugging effort and improves interpretation of generated outputs.

### Outcome

Completed documentation for SRAM architecture, 6T cell operation, read/write operations, precharge circuits, sense amplifiers, row decoders, and column multiplexers.

---

## Decision 03 – Document AI-Assisted Workflow

### Decision

Maintain a dedicated AI workflow log documenting prompts, findings, and verification steps.

### Reason

The internship emphasizes responsible and verifiable use of AI-assisted engineering workflows.

### Outcome

Created the ai_workflow/prompts.md document.

---

## Decision 04 – Use 1024 × 32 SRAM as Reference Architecture

### Decision

Use the 1024 × 32 SRAM macro as the primary reference throughout Week 1.

### Reason

This organization represents a practical 4 KB SRAM and matches the reference OpenRAM configuration.

### Outcome

Improved understanding of logical memory organization, physical organization, address decoding, and column multiplexing.

---

## Decision 05 – Prioritize Understanding Over Output Generation

### Decision

Focus on understanding architecture, OpenRAM flow, SKY130 integration, and generated views before running the complete SRAM generation flow.

### Reason

Week 1 requirements emphasize investigation, documentation, and understanding rather than tool execution.

### Outcome

Established a strong foundation for future OpenRAM setup, compilation, characterization, and verification activities.
