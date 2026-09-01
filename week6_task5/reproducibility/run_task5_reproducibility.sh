#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
OPENRAM_ROOT="${OPENRAM_ROOT:-$HOME/VLSI/Tools/OpenRAM}"
TASK5_REPRO_OUT="${TASK5_REPRO_OUT:-/tmp/task5_4kb_sram_repro_${USER:-user}}"

CONFIG_SRC="$REPO_ROOT/week6_task5/config/task5_4kb_sram.py"
TB_SRC="$REPO_ROOT/week6_task5/regression/tb/task5_4kb_regression_tb.sv"

OUT_DIR="$TASK5_REPRO_OUT/generated"
WORK_DIR="$TASK5_REPRO_OUT/work"
LOG_DIR="$TASK5_REPRO_OUT/logs"

TMP_CONFIG="$WORK_DIR/task5_4kb_sram_repro.py"
GEN_LOG="$LOG_DIR/openram_generation.log"
COMPILE_LOG="$LOG_DIR/regression_compile.log"
REG_LOG="$LOG_DIR/regression_run.log"
MANIFEST="$LOG_DIR/fresh_generated_manifest.tsv"

echo "===== TASK5 CLEAN-CLONE REPRODUCIBILITY ====="
echo "REPO_ROOT=$REPO_ROOT"
echo "OPENRAM_ROOT=$OPENRAM_ROOT"
echo "TASK5_REPRO_OUT=$TASK5_REPRO_OUT"

for f in "$CONFIG_SRC" "$TB_SRC" "$OPENRAM_ROOT/sram_compiler.py"; do
    if [[ ! -f "$f" ]]; then
        echo "ERROR: missing required file: $f" >&2
        exit 2
    fi
done

if [[ ! -f "$OPENRAM_ROOT/venv/bin/activate" ]]; then
    echo "ERROR: OpenRAM virtual environment not found." >&2
    exit 2
fi

for exe in iverilog vvp; do
    if ! command -v "$exe" >/dev/null 2>&1; then
        echo "ERROR: required executable not found: $exe" >&2
        exit 2
    fi
done

rm -rf "$TASK5_REPRO_OUT"
mkdir -p "$OUT_DIR" "$WORK_DIR" "$LOG_DIR"

cp "$CONFIG_SRC" "$TMP_CONFIG"

python3 -c '
from pathlib import Path
import re
import sys

cfg = Path(sys.argv[1])
out = str(Path(sys.argv[2]).resolve()) + "/"

text = cfg.read_text()

text, count = re.subn(
    r"(?m)^[ \t]*output_path[ \t]*=.*$",
    "output_path = " + repr(out),
    text,
)

if count != 1:
    raise SystemExit(
        "Expected exactly one output_path assignment; found %d" % count
    )

cfg.write_text(text)
' "$TMP_CONFIG" "$OUT_DIR"

echo
echo "===== REPRO CONFIG ====="
grep -nE \
'word_size|write_size|num_words|num_banks|words_per_row|num_spare_rows|num_spare_cols|tech_name|process_corners|supply_voltages|temperatures|output_path|output_name|check_lvsdrc' \
"$TMP_CONFIG"

echo
echo "===== OPENRAM GENERATION ====="

cd "$OPENRAM_ROOT"
source venv/bin/activate

export PDK_ROOT="${PDK_ROOT:-/usr/local/share/pdk}"

python sram_compiler.py "$TMP_CONFIG" >"$GEN_LOG" 2>&1

echo "OPENRAM_GENERATION_STATUS=0"

required_views=(
    task5_4kb_sram.gds
    task5_4kb_sram.lef
    task5_4kb_sram.v
    task5_4kb_sram.sp
    task5_4kb_sram_TT_1p8V_25C.lib
    task5_4kb_sram_SS_1p8V_25C.lib
    task5_4kb_sram_FF_1p8V_25C.lib
)

missing=0

echo
echo "===== FRESH GENERATED VIEWS ====="

for name in "${required_views[@]}"; do
    file="$OUT_DIR/$name"

    if [[ -s "$file" ]]; then
        printf 'PASS  %10s  %s\n' "$(stat -c '%s' "$file")" "$name"
    else
        printf 'FAIL              %s\n' "$name"
        missing=$((missing + 1))
    fi
done

if [[ "$missing" -ne 0 ]]; then
    echo "FRESH_GENERATED_VIEW_GATE=FAIL"
    exit 3
fi

echo "FRESH_GENERATED_VIEW_GATE=PASS"

echo
echo "===== FRESH INTERFACE CHECK ====="

grep -q 'parameter DATA_WIDTH = 33' "$OUT_DIR/task5_4kb_sram.v"
grep -q 'parameter ADDR_WIDTH = 11' "$OUT_DIR/task5_4kb_sram.v"
grep -q 'parameter NUM_WMASKS = 4' "$OUT_DIR/task5_4kb_sram.v"
grep -q 'spare_wen0' "$OUT_DIR/task5_4kb_sram.v"

echo "FRESH_INTERFACE_GATE=PASS"

echo
echo "===== FRESH FUNCTIONAL REGRESSION ====="

iverilog \
    -g2012 \
    -s task5_4kb_regression_tb \
    -o "$WORK_DIR/task5_4kb_regression.vvp" \
    "$OUT_DIR/task5_4kb_sram.v" \
    "$TB_SRC" \
    >"$COMPILE_LOG" 2>&1

vvp "$WORK_DIR/task5_4kb_regression.vvp" >"$REG_LOG" 2>&1

pass_count="$(
    awk -F= '/TOTAL_PASS[[:space:]]*=/{gsub(/[[:space:]]/,"",$2); print $2}' \
        "$REG_LOG" | tail -1
)"

fail_count="$(
    awk -F= '/TOTAL_FAIL[[:space:]]*=/{gsub(/[[:space:]]/,"",$2); print $2}' \
        "$REG_LOG" | tail -1
)"

verdict="$(
    awk -F= '/TASK5_FUNCTIONAL_REGRESSION[[:space:]]*=/{gsub(/^[[:space:]]+|[[:space:]]+$/,"",$2); print $2}' \
        "$REG_LOG" | tail -1
)"

echo "TOTAL_PASS=${pass_count:-MISSING}"
echo "TOTAL_FAIL=${fail_count:-MISSING}"
echo "TASK5_FUNCTIONAL_REGRESSION=${verdict:-MISSING}"

if [[ "$pass_count" != "144" || "$fail_count" != "0" || "$verdict" != "PASS" ]]; then
    echo "FRESH_FUNCTIONAL_REGRESSION_GATE=FAIL"
    exit 4
fi

echo "FRESH_FUNCTIONAL_REGRESSION_GATE=PASS"

echo
echo "===== FRESH ARTIFACT MANIFEST ====="

printf 'path\tbytes\tsha256\n' >"$MANIFEST"

for name in "${required_views[@]}"; do
    file="$OUT_DIR/$name"

    printf '%s\t%s\t%s\n' \
        "$name" \
        "$(stat -c '%s' "$file")" \
        "$(sha256sum "$file" | awk '{print $1}')" \
        >>"$MANIFEST"
done

cat "$MANIFEST"

echo
echo "OPENRAM_LOG=$GEN_LOG"
echo "REGRESSION_COMPILE_LOG=$COMPILE_LOG"
echo "REGRESSION_RUN_LOG=$REG_LOG"
echo "FRESH_MANIFEST=$MANIFEST"

echo
echo "TASK5_CLEAN_CLONE_REPRODUCIBILITY=PASS"
