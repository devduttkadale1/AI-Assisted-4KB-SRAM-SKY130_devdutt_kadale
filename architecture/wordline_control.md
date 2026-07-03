# Wordline Control

- WL driven by row decoder output
- WL HIGH = access transistors ON (read/write enabled)
- WL must be asserted only after precharge is complete
- WL pulse width determines access time
- Must be deasserted before next precharge cycle