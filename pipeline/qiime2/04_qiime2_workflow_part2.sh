
# Paths setup

BASE_DIR=$(pwd)
DATA_DIR="$BASE_DIR/dataset"
RESULTS_DIR="$BASE_DIR/raw_results"
QC_DIR="$RESULTS_DIR/quality_control"

# DADA2 truncation sweep

INPUT="$QC_DIR/demux.qza"   # use original (no need for trimmed)
THREADS=2

# Include 0 as diagnostic (no truncation)
TRUNCS=(0)

for T in "${TRUNCS[@]}"; do
  OUTDIR="$RESULTS_DIR/dada2_${T}_trunc"

  echo "Running denoise-single with trunc-len=${T}"
  mkdir -p "$OUTDIR"

  qiime dada2 denoise-single \
  --i-demultiplexed-seqs "$INPUT" \
  --p-trunc-len "$T" \
  --p-max-ee 5 \
  --p-trunc-q 2 \
  --p-n-threads "$THREADS" \
  --o-table "${OUTDIR}/table.qza" \
  --o-representative-sequences "${OUTDIR}/rep-seqs.qza" \
  --o-denoising-stats "${OUTDIR}/stats.qza" \
  --o-base-transition-stats "${OUTDIR}/base-stats.qza" \
  --verbose

  echo "Finished truncation length: $T"

  # 6. Visualize denoising stats
  qiime metadata tabulate \
    --m-input-file "${OUTDIR}/stats.qza" \
    --o-visualization "${OUTDIR}/stats.qzv"

  qiime metadata tabulate \
  --m-input-file "${OUTDIR}/base-stats.qza" \
  --o-visualization "${OUTDIR}/base-stats.qzv"

done

echo "All DADA2 runs completed!"