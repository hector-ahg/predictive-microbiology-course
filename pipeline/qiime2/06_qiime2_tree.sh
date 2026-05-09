# Paths setup

BASE_DIR=$(pwd)
RESULTS_DIR="$BASE_DIR/raw_results"
DADA2_RESULTS_DIR="$RESULTS_DIR/dada2_0_trunc" # your path (change!)


# Build phylogenetic tree

qiime phylogeny align-to-tree-mafft-fasttree \
    --i-sequences $DADA2_RESULTS_DIR/rep-seqs.qza \
    --output-dir $DADA2_RESULTS_DIR/tree

