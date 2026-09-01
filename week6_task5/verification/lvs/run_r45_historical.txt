#!/usr/bin/env bash

WS=/home/devdutt/VLSI/Tools/OpenRAM/week6_task5/verification/r45_final_property_clean_netgen_lvs
LAYOUT=/home/devdutt/VLSI/Tools/OpenRAM/week6_task5/verification/r38_corrected_top_ext2spice/task5_4kb_sram.spice
REF=/home/devdutt/VLSI/Tools/OpenRAM/week6_task5/verification/r43_property_corrected_reference_v1/task5_4kb_sram.corrected_pfet.lvs.sp
SETUP=/usr/local/share/pdk/sky130A/libs.tech/netgen/setup.tcl

REPORT="$WS/task5_4kb_sram.final.lvs.out"
LOG="$WS/netgen.log"
STATUS="$WS/status.txt"
SUMMARY="$WS/completion_summary.txt"

cd "$WS"

printf 'STATE=RUNNING\nSTART=%s\n' \
"$(date -Iseconds)" > "$STATUS"

/usr/bin/time -v \
/usr/local/bin/netgen -batch lvs \
"$LAYOUT task5_4kb_sram" \
"$REF task5_4kb_sram" \
"$SETUP" \
"$REPORT" \
> "$LOG" 2>&1

NETGEN_STATUS=$?

printf 'STATE=FINISHED\nNETGEN_STATUS=%s\nEND=%s\n' \
"$NETGEN_STATUS" "$(date -Iseconds)" > "$STATUS"

{
    echo "========== R45 FINAL LVS COMPLETION =========="
    cat "$STATUS"

    echo
    echo "========== FILES =========="
    stat -c 'REPORT_SIZE=%s bytes  MTIME=%y' "$REPORT" 2>/dev/null || true
    stat -c 'LOG_SIZE=%s bytes  MTIME=%y' "$LOG" 2>/dev/null || true

    echo
    echo "========== FINAL VERDICT LOCATORS =========="
    grep -nE \
    'Final result:|Property errors were found|The following cells had property errors|Circuits match uniquely|Netlists match uniquely with property errors|Netlists do not match' \
    "$REPORT" 2>/dev/null | tail -n 160 || true

    echo
    echo "========== FINAL REPORT TAIL =========="
    tail -n 180 "$REPORT" 2>/dev/null || true

    echo
    echo "========== NETGEN LOG TAIL =========="
    tail -n 120 "$LOG" 2>/dev/null || true

    echo
    echo "NETGEN_STATUS=$NETGEN_STATUS"
} > "$SUMMARY" 2>&1
