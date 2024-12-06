# TAN1810_sedtraps

Script and data for: 

All unprocessed bioinformatics data have been deposited in NCBI Sequence Read Archive (PRJNA670061 and PRJNA1033349). 

## metabarcoding
- Phyloseq file (metapr2_phyloseq_asv_set_47_Eukaryota_pr2_version_5.0.rds)
- fasta file with all ASV sequences (metapr2_asv_set_47_Eukaryota.fasta)
- ASV table (metapr2_asv_set_47_Eukaryota_pr2_version_5.0.xlsx)
- sample metadata (metapr2_samples_asv_set_47_Denise.xlsx)
- ASV abundance (metapr2_asv_set_47_abundance.xls)

## R_sediment_traps
Folders:
- init_files: load libraries, colours, read data
- data: metadata (sampling coordinates, CTD, nutrients, chlorophyll, flux measurements)
- deseq: deseq raw data output
- figs_paper
- tables

Rmd files:
- 01_map_v2.Rmd: map figure
- 02_Table_env.Rmd: metadata processing
- 03_POC plots.Rmd
- 04_diversity plots.Rmd: sample preprocessing and checks, alpha diversity and richess, upset plot for samples
- 05_NMDS_v2.Rmd: NMDS, PERMANOVA analysis
- 06_treemap heatmap.Rmd: treemap and heatmap main plots
- 07_shared_checks.Rmd: check for common ASVs between upper and lower water columns
- 07_shared_v3.Rmd: "shared ASVs" analysis
- 08_deseq_v5.Rmd: Deseq for export and transfer analysis

