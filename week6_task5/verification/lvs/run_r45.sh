#!/usr/bin/env bash
set -euo pipefail

# Portable R45 LVS reproduction helper.
#
# The final clean LVS result is already preserved in this repository.
# Do not rerun it unless intentionally reproducing physical verification.
#
# The corrected extracted-layout SPICE was generated in the external
# OpenRAM verification workspace and is intentionally not duplicated here.
# Supply it explicitly with TASK5_LVS_LAYOUT.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

WS="${TASK5_LVS_WS:-${TMPDIR:-/tmp}/task5_r45_lvs_repro}"
LAYOUT="${TASK5_LVS_LAYOUT:-}"
REF="${TASK5_LVS_REF:-$SCRIPT_DIR/task5_4kb_sram.corrected_pfet.lvs.sp}"

PDK_ROOT="${PDK_ROOT:-/usr/local/share/pdk}"
SETUP="${TASK5_NETGEN_SETUP:-$PDK_ROOT/sky130A/libs.tech/netgen/setup.tcl}"
NETGEN_BIN="${NETGEN_BIN:-$(command -v netgen || true)}"

if [[ -z "$LAYOUT" ]]; then
    echo "ERROR: TASK5_LVS_LAYOUT is required." >&2
    echo "Point it to the corrected extracted-layout SPICE before reproducing R45." >&2
    exit 2
fi

for f in "$LAYOUT" "$REF" "$SETUP"; do
    if [[ ! -f "$f" ]]; then
        echo "ERROR: required LVS file not found: $f" >&2
        exit 2
    fi
done

if [[ -z "$NETGEN_BIN" || ! -x "$NETGEN_BIN" ]]; then
    echo "ERROR: Netgen executable not found." >&2
    exit 2
fi

mkdir -p "$WS"

REPORT="$WS/task5_4kb_sram.final.lvs.out"
LOG="$WS/netgen.log"
STATUS="$WS/status.txt"

printf 'STATE=RUNNING\nSTART=%s\n' "$(date -Iseconds)" > "$STATUS"

"$NETGEN_BIN" -batch lvs \
    "$LAYOUT task5_4kb_sram" \
    "$REF task5_4kb_sram" \
    "$SETUP" \
    "$REPORT" \
    > "$LOG" 2>&1

NETGEN_STATUS=$?

printf 'STATE=FINISHED\nNETGEN_STATUS=%s\nEND=%s\n' \
    "$NETGEN_STATUS" "$(date -Iseconds)" > "$STATUS"

echo "NETGEN_STATUS=$NETGEN_STATUS"
echo "REPORT=$REPORT"
echo "LOG=$LOG"
