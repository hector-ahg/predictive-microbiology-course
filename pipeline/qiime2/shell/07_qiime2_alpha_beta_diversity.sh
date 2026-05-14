# Paths setup

BASE_DIR=$(pwd)
RESULTS_DIR="$BASE_DIR/raw_results"
DADA2_RESULTS_DIR="$RESULTS_DIR/dada2_0_trunc" # your path (change!)
DATA_DIR="$BASE_DIR/dataset"
METADATA_DIR="$DATA_DIR/ibdmdb_hmp2/metadata"


qiime diversity core-metrics-phylogenetic \
    --i-table $DADA2_RESULTS_DIR/table.qza \
    --i-phylogeny $DADA2_RESULTS_DIR/tree/rooted_tree.qza \
    --p-sampling-depth 10000 \
    --m-metadata-file $METADATA_DIR/metadata.tsv \
    --output-dir $DADA2_RESULTS_DIR/diversity # this command make most of the alpha and beta diversity analyses, but you can also do them separately (see below)


# Alpha diversity (explicit)

#qiime diversity alpha-correlation \
#    --i-alpha-diversity $DADA2_RESULTS_DIR/diversity/shannon_vector.qza \
#    --o-visualization $DADA2_RESULTS_DIR/diversity/alpha_correlation.qzv
#    --m-metadata-file $METADATA_DIR/metadata.tsv \

#qiime diversity alpha-group-significance \
#    --i-alpha-diversity $DADA2_RESULTS_DIR/diversity/shannon_vector.qza \
#    --m-metadata-file $METADATA_DIR/metadata.tsv \
#    --o-visualization $DADA2_RESULTS_DIR/diversity/alpha_groups.qzv

#qiime diversity alpha-phylogenetic \
#    --i-table $DADA2_RESULTS_DIR/table.qza \
#    --i-phylogeny $DADA2_RESULTS_DIR/tree/rooted_tree.qza \
#    --p-metric faith_pd \
#    --o-alpha-diversity $DADA2_RESULTS_DIR/diversity/faith_pd_vector.qza


# Beta diversity (explicit)

#qiime diversity beta-phylogenetic \
#    --i-table $DADA2_RESULTS_DIR/table.qza \
#    --i-phylogeny $DADA2_RESULTS_DIR/tree/rooted_tree.qza \
#    --p-metric unweighted_unifrac \
#    --o-distance-matrix $DADA2_RESULTS_DIR/diversity/unweighted_unifrac_distance_matrix.qza

# permanova  

qiime diversity adonis \
    --i-distance-matrix $DADA2_RESULTS_DIR/diversity/weighted_unifrac_distance_matrix.qza \
    --m-metadata-file $METADATA_DIR/metadata.tsv \
    --p-formula ""diagnosis+biopsy_location"" \
    --p-n-jobs 2 \
    --o-visualization $DADA2_RESULTS_DIR/diversity/permanova.qzv

   