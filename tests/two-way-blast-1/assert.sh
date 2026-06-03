#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

TMPDIR="$(mktemp -d)"
trap 'rm -rf "${TMPDIR}"' EXIT

cat "${SCRIPT_DIR}/output/NM_152869.4_Homo_sapiens_regucalcin_RGN_transcript_variant_mRNA.orthologs" \
  | grep '>' | sort \
  > "${TMPDIR}/NM_152869.4_Homo_sapiens_regucalcin_RGN_transcript_variant_mRNA.orthologs"

cat "${SCRIPT_DIR}/output/Candidatus_Latescibacteria_bacterium.orthologs" \
  | grep '>' | sort \
  > "${TMPDIR}/Candidatus_Latescibacteria_bacterium.orthologs"

diff "${SCRIPT_DIR}/expected/NM_152869.4_Homo_sapiens_regucalcin_RGN_transcript_variant_mRNA.orthologs" \
     "${TMPDIR}/NM_152869.4_Homo_sapiens_regucalcin_RGN_transcript_variant_mRNA.orthologs"

diff "${SCRIPT_DIR}/expected/Candidatus_Latescibacteria_bacterium.orthologs" \
     "${TMPDIR}/Candidatus_Latescibacteria_bacterium.orthologs"

echo "=== All assertions passed ==="
