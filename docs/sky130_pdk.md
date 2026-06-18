# SKY130 PDK and Its Role in OpenRAM

## Introduction

The SKY130 Process Design Kit (PDK) provides the technology information required by OpenRAM to generate manufacturable SRAM macros. A memory compiler such as OpenRAM cannot create layouts or perform characterization without understanding the fabrication process being targeted.

In the SRAM_SKY130 project, OpenRAM uses the SKY130A technology package to generate a 1024 × 32 SRAM macro operating at 1.8 V.

---

## What is a PDK?

A Process Design Kit (PDK) is a collection of files provided by a semiconductor foundry that describe how integrated circuits must be designed for a specific manufacturing process.

A PDK contains:

* Design rules
* Device models
* Technology layers
* SPICE models
* Layer mapping information
* Verification rules

The PDK acts as the interface between IC design tools and the semiconductor fabrication process.

---

## Why OpenRAM Requires a PDK

OpenRAM generates:

* SRAM bitcell arrays
* Row decoders
* Wordline drivers
* Column multiplexers
* Sense amplifiers
* Write drivers
* Control logic
* Physical layouts

To generate these structures correctly, OpenRAM must understand the technology in which the SRAM will be fabricated.

Without a PDK, OpenRAM cannot:

* Create valid layouts
* Simulate transistor behavior
* Perform characterization
* Generate technology-specific outputs

---

## SKY130 Technology Overview

SKY130 is an open-source 130 nm CMOS technology developed by SkyWater Technology.

Key characteristics:

| Parameter              | Value                  |
| ---------------------- | ---------------------- |
| Technology Node        | 130 nm                 |
| Nominal Supply Voltage | 1.8 V                  |
| Process Type           | CMOS                   |
| Application            | ASIC and Memory Design |

The open-source nature of SKY130 makes it widely used for research, education, and ASIC prototyping.

---

## Information Provided by SKY130

### Device Models

The PDK provides models for:

* NMOS transistors
* PMOS transistors
* Standard devices
* Specialized devices

These models describe the electrical behavior of transistors used inside SRAM cells and peripheral circuits.

---

### Design Rules

Design rules define manufacturing constraints such as:

* Minimum width
* Minimum spacing
* Minimum enclosure
* Via placement requirements

These rules ensure that generated layouts can be fabricated reliably.

---

### Technology Layers

SKY130 defines multiple fabrication layers including:

* Diffusion
* Polysilicon
* Contact
* Local Interconnect
* Metal1
* Metal2
* Metal3
* Metal4
* Metal5

These layers are used by OpenRAM when generating SRAM layouts.

---

## SKY130 Files Used by OpenRAM

The SRAM_SKY130 repository contains a SKY130 technology directory:

```text
OpenRAM/
└── sky130A/
```

Important subdirectories include:

```text
gds_lib/
mag_lib/
models/
tech/
sp_lib/
lef_lib/
```

### gds_lib

Contains physical layout views of custom SRAM cells.

Examples:

* cell_1rw.gds
* sense_amp.gds
* write_driver.gds

---

### models

Contains transistor models used for simulation and characterization.

Examples:

* TT corner
* FF corner
* SS corner

These models determine timing and power behavior.

---

### tech

Contains technology-specific definitions including:

* Layer information
* Routing rules
* Design constraints

OpenRAM references these files while generating layouts.

---

## How OpenRAM Uses SKY130

The OpenRAM generation flow can be summarized as:

```text
Memory Specification
        ↓
OpenRAM Configuration
        ↓
SKY130 Technology Files
        ↓
Custom Cells
        ↓
OpenRAM Compiler
        ↓
Generated Outputs
```

Insert:

![OpenRAM SKY130 Flow](../assets/images/sky130_openram_flow.png)

*Figure 1: Relationship between SKY130 PDK and OpenRAM SRAM generation.*

---

## Impact on Timing

The technology directly affects SRAM performance.

Factors include:

* Transistor drive strength
* Wire resistance
* Wire capacitance
* Process corner variation

These factors influence:

* Read access time
* Write delay
* Setup time
* Hold time

---

## Impact on Power

Power consumption depends on:

* Supply voltage
* Switching capacitance
* Leakage current

These characteristics are defined by transistor models contained within the PDK.

---

## Common Integration Issues

Common OpenRAM and SKY130 issues include:

* Missing technology files
* Incorrect OPENRAM_TECH path
* Missing SPICE models
* Technology version mismatches
* Characterization failures

Engineers typically debug these issues by checking technology paths, configuration files, and OpenRAM logs.

---

## Key Takeaways

* SKY130 is the technology foundation used by OpenRAM.
* The PDK provides design rules, device models, and layer definitions.
* OpenRAM uses SKY130 information to generate valid SRAM layouts.
* Timing, power, and area are strongly influenced by technology parameters.
* Understanding the interaction between OpenRAM and SKY130 is essential for SRAM design.

The most important Week 1 insight is that OpenRAM does not create SRAMs independently. It relies on configuration files, technology information, and pre-designed SRAM cells provided through the SKY130 PDK to generate a complete SRAM macro.
