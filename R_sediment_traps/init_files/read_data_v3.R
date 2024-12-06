# read data V3: 
# - changed the samples list to edited samples list with depth category
# - change ASV assignment to PR2 version 5.0

# Load the phyloseq files
ps_all <- read_rds("../metabarcoding/metapr2_phyloseq_asv_set_47_Eukaryota_pr2_version_5.0.rds") 

check <- as.data.frame(ps_all@sam_data)

# column to merge cycle and station
sample_data(ps_all)$cycle_station <- str_c(sample_data(ps_all)$cycle_name, sample_data(ps_all)$station_id, sep = "_")

# column to merge sample type and water mass
sample_data(ps_all)$sample_wm <- str_c(sample_data(ps_all)$sample, sample_data(ps_all)$water_mass, sep = "_")

# filter out ASVs without any reads
ps_all <- ps_all %>%
  phyloseq::filter_taxa(function(x) sum(x) > 0 , TRUE) 

# filter out non protistan taxa
ps_all <- ps_all %>%
  subset_taxa(!(subdivision %in% c("Metazoa"))) %>%
  subset_taxa(!(subdivision %in% c("Ichthyosporea"))) %>%
  subset_taxa(!(subdivision %in% c("Fungi"))) %>%
  subset_taxa(!(domain %in% c("Bacteria", "Eukaryota:nucl")))