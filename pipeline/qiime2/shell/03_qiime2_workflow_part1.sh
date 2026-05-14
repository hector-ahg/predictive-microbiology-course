
# From raw microbiome data to tables of Amplicon Sequence Variants (ASVs)

## Goal
#Transform IBDMDB data into a clean, structured, biologically meaningful data matrix. To do so we will ise QIIME2 (https://qiime2.org/), which is an AI-ready microbiome multi-omics data science platform. 

## The following code will be run from bash. 

# 0. Path setup

BASE_DIR=$(pwd)
DATA_DIR="$BASE_DIR/dataset"
PIPELINE_PATH="$BASE_DIR/pipeline"

PATH_sequences="$DATA_DIR/ibdmdb_hmp2/raw_sequences"
PATH_manifest="$PIPELINE_PATH/qiime2/manifest"
PATH_results="$BASE_DIR/raw_results"

QC_DIR="$PATH_results/quality_control"

mkdir -p "$PATH_results" "$QC_DIR"

# Check manifest file exists
if [ ! -f "$PATH_manifest/manifest.tsv" ]; then
  echo "Manifest file not found!"
  exit 1
fi

# Define Sequencing Mode

sequencing_mode="SINGLE-END"


# 1. Import data

if [ "$sequencing_mode" == "SINGLE-END" ]; then
  echo "Importing single-end data..."
  qiime tools import \
    --type 'SampleData[SequencesWithQuality]' \
    --input-path "$PATH_manifest/manifest.tsv" \
    --output-path "$QC_DIR/demux.qza" \
    --input-format SingleEndFastqManifestPhred33V2
elif [ "$sequencing_mode" == "PAIRED-END" ]; then
  echo "Importing paired-end data..."
  qiime tools import \
    --type 'SampleData[PairedEndSequencesWithQuality]' \
    --input-path "$PATH_manifest/manifest.tsv" \
    --output-path "$QC_DIR/demux.qza" \
    --input-format PairedEndFastqManifestPhred33V2
else
  echo "Invalid sequencing mode. Please set sequencing_mode to either 'SINGLE-END' or 'PAIRED-END'."
fi # This code checks the value of the variable sequencing_mode and runs the appropriate QIIME2 import command based on whether the data is single-end or paired-end. Make sure to set the sequencing_mode variable correctly before running this code.


# 2. Quality summary BEFORE trimming

qiime demux summarize \
  --i-data "$QC_DIR/demux.qza" \
  --o-visualization "$QC_DIR/demux_raw_summary.qzv"


# 3. Trim primers

qiime cutadapt trim-single \
  --i-demultiplexed-sequences "$QC_DIR/demux.qza" \
  --p-front GTGCCAGCMGCCGCGGTAA \
  --p-error-rate 0.1 \
  --o-trimmed-sequences "$QC_DIR/demux_trimmed.qza" \
  --verbose


# 4. Quality summary AFTER trimming

qiime demux summarize \
  --i-data "$QC_DIR/demux_trimmed.qza" \
  --o-visualization "$QC_DIR/demux_trimmed_summary.qzv"

echo "Check visualizations of sequence quality (.qzv files): https://view.qiime2.org/"

