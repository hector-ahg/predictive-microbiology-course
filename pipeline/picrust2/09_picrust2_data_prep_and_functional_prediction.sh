#This script prepares the data from DADA2 to PICRUSt2 and runs the functional prediction.

# Paths


BASE_DIR=$(pwd)
RESULTS_DIR="$BASE_DIR/raw_results"
DADA2_RESULTS_DIR="$RESULTS_DIR/dada2_0_trunc" # your path (change!)
DATA_DIR="$BASE_DIR/dataset"
METADATA_DIR="$DATA_DIR/ibdmdb_hmp2/metadata"


# Activate env (if using conda)
# conda activate picrust2

# You MUST have:
# feature-table.biom
# dna-sequences.fasta

# Convert BIOM table to HDF5 format (required by PICRUSt2)

biom convert \
  -i "$DADA2_RESULTS_DIR/table_export/feature-table.biom" \
  -o "$DADA2_RESULTS_DIR/table_export/table.biom" \
  --to-hdf5


# Run PICRUSt2

picrust2_pipeline.py \
  -s "$DADA2_RESULTS_DIR/seqs_export/dna-sequences.fasta" \
  -i "$DADA2_RESULTS_DIR/table_export/table.biom" \
  -o "$RESULTS_DIR/picrust2_out2" \
  -p 2 \
  --stratified

echo "PICRUSt2 completed!"

