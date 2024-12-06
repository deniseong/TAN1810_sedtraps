# After read data V3, filter samples with microviz 

set.seed(1)
#### Subset data with microviz ####
# remove blank samples
ps <-  ps_all %>%
  ps_filter(sample != "trap_blank_fix") %>%
  ps_filter(sample != "trap_blank_live")

set.seed(1)
# remove replicate samples
ps <- ps %>%
  ps_dedupe(method = "random", #set.seed(1) for reproducibility
            vars = c("replicates_check", "station_id"),
            .message_IDs = TRUE) #using dedupe function to randomly select one replicate

# Remove fixed traps SA3 540 m. Dominated by 1 ASV.
ps <-  ps %>%
  ps_filter(sample_name != "C5-4-T4-Fix-TDNA-0-2") %>%
  ps_filter(sample_name != "C5-4-T7-Fix-SFDNA20")

# remove CTD samples that are sampled lower than 40 m
ps <- ps %>%
  ps_filter(!(sample == "water_CTD" & depth >=41))


# order depths
ps <- ps %>% 
  # ps_mutate(depth = factor(depth, levels = unique(depth))) %>%
  # ps_mutate(depth = fct_relevel(depth, c("428", "780", "1051", "1405", "2604", "540", "500", "340","300", "200", "140", "110", "100", "70", "40", "30", "25", "20", "12", "5"))) %>%
  ps_mutate(depth_category = factor(depth_category, levels = unique (depth_category))) %>%
  ps_mutate(depth_category = fct_relevel(depth_category, c("6", "5", "4", "3", "2", "1")))


# order cycles
ps <- ps %>% 
  ps_mutate(cycle_name = factor(cycle_name, levels = unique(cycle_name))) %>%
  ps_mutate(cycle_name = fct_relevel(cycle_name, c("ST1", "ST2", "SA-Sc-A", "SA-Sc-B","SA1","SA2")))  %>%
  ps_mutate(cycle_name_2 = fct_relevel(cycle_name_2, c("ST1", "ST2", "SA-Sc", "SA1","SA2"))) 


# only include ASVs with more than 10 reads
ps <- ps %>%
  tax_filter(min_total_abundance = 11) 

# check samples included
check <- data.frame(ps@sam_data) 

ps <- phyloseq_validate(ps)