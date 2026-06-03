#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1. Download / prepare input data
echo "=== Preparing input data ==="
bash "${SCRIPT_DIR}/download.sh"

# 2. Create output directory
OUTPUT_DIR="${SCRIPT_DIR}/output"
mkdir -p "${OUTPUT_DIR}"
rm -rf "${OUTPUT_DIR}/*"

# 3. Run the pipeline
INPUT_DIR="${SCRIPT_DIR}/input/test-data-two-way-blast/data/"
REFERENCE="nucleotide.fasta"
BLAST_TYPE="tblastx"
COMPI_NUM_TASKS=8

echo "=== Running two-way-blast pipeline ==="
echo "  Input:   ${INPUT_DIR}"
echo "  Output:  ${OUTPUT_DIR}"
echo "  Ref:     ${REFERENCE}"
echo "  BLAST:   ${BLAST_TYPE}"
echo "  Tasks:   ${COMPI_NUM_TASKS}"

docker run --rm \
    -v "${INPUT_DIR}:/input" \
    -v "${OUTPUT_DIR}:/output" \
    pegi3s/two-way-blast \
    --num-tasks "${COMPI_NUM_TASKS}" -q -- \
    --reference_file "${REFERENCE}" \
    --blast_type "${BLAST_TYPE}"

echo "=== Running assertions ==="
if bash "${SCRIPT_DIR}/assert.sh"; then
    echo "=== Cleaning up output ==="
    rm -f "${OUTPUT_DIR}"/*
    echo "=== Test passed ==="
else
    echo "=== Test failed ==="
    exit 1
fi
