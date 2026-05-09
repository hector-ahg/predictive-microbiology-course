
# Paths

BASE_DIR=$(pwd)
RESULTS_DIR="$BASE_DIR/raw_results"
DADA2_RESULTS_DIR="$RESULTS_DIR/dada2_0_trunc" # your path (change!)
DATA_DIR="$BASE_DIR/dataset"
METADATA_DIR="$DATA_DIR/ibdmdb_hmp2/metadata"


# Boxplots

qiime taxa barplot \
  --i-table $DADA2_RESULTS_DIR/table-filtered-final.qza \
  --i-taxonomy $DADA2_RESULTS_DIR/taxa.qza \
  --m-metadata-file $METADATA_DIR/metadata.tsv \
  --o-visualization $DADA2_RESULTS_DIR/taxa_barplot.qzv






