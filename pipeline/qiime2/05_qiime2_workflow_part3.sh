# Paths setup

BASE_DIR=$(pwd)
CLASSIFIER_DIR="$BASE_DIR/pipeline/qiime2/classifiers"
RESULTS_DIR="$BASE_DIR/raw_results"
DADA2_RESULTS_DIR="$RESULTS_DIR/dada2_0_trunc" # your path (change!)

# optional. If there are samples with low frequency 

qiime feature-table filter-samples \
  --i-table "$DADA2_RESULTS_DIR/table.qza" \
  --p-min-frequency 1000 \
  --o-filtered-table "$DADA2_RESULTS_DIR/table-filtered-samples.qza"


# Filter low-abundance features 

qiime feature-table filter-features \
  --i-table "$DADA2_RESULTS_DIR/table-filtered-samples.qza" \
  --p-min-frequency 10 \
  --o-filtered-table "$DADA2_RESULTS_DIR/table-filtered-final.qza"

# Summarize
qiime feature-table summarize \
  --i-table "$DADA2_RESULTS_DIR/table-filtered-final.qza" \
  --output-dir "$DADA2_RESULTS_DIR/summary-filtered-final"


# ================================
# 7. Export for PICRUSt2
# ================================
# Feature table
qiime tools export \
  --input-path "$DADA2_RESULTS_DIR/table-filtered-final.qza" \
  --output-path "$DADA2_RESULTS_DIR/table_export"

# Sequences
qiime tools export \
  --input-path "$DADA2_RESULTS_DIR/rep-seqs.qza" \
  --output-path "$DADA2_RESULTS_DIR/seqs_export"


# feature-classifier

qiime feature-classifier classify-sklearn \
    --i-reads $DADA2_RESULTS_DIR/rep-seqs.qza \
    --i-classifier $CLASSIFIER_DIR/silva-138-99-nb-classifier.qza \
    --p-n-jobs 2 \
    --o-classification $DADA2_RESULTS_DIR/taxa.qza

qiime tools export \
    --input-path $DADA2_RESULTS_DIR/taxa.qza \
    --output-path $DADA2_RESULTS_DIR/taxa_export


# Convert BIOM to TSV for easier handling in Python (optional, but recommended)
biom convert \
  -i "$DADA2_RESULTS_DIR/table_export/feature-table.biom" \
  -o "$DADA2_RESULTS_DIR/table_export/feature-table.tsv" \
  --to-tsv


  