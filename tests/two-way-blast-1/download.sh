#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INPUT_DIR="${SCRIPT_DIR}/input"
DATA_DIR="${INPUT_DIR}/test-data-two-way-blast/data"
ZIP_URL="https://github.com/pegi3s/two-way-blast/raw/master/resources/test-data-two-way-blast.zip"

if [ -d "${DATA_DIR}" ]; then
    echo "${DATA_DIR} already exists, skipping download."
    exit 0
fi

echo "Downloading test data..."
wget -q "${ZIP_URL}" -O "${INPUT_DIR}/test-data-two-way-blast.zip"

echo "Extracting..."
unzip -q -o "${INPUT_DIR}/test-data-two-way-blast.zip" -d "${INPUT_DIR}"

rm -f "${INPUT_DIR}/test-data-two-way-blast.zip"

echo "Done. Test data extracted to ${DATA_DIR}"
