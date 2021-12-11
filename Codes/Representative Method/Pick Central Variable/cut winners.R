library(readr)
library(dplyr)

indo_c <- "/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/Centrality_representative_results/centrality_scores(after removing disaggregation)/Indo_measure_centrality.csv"
gua_c <- "/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/Centrality_representative_results/centrality_scores(after removing disaggregation)/Gua_measure_centrality.csv"
mcentrality <- read_csv(gua_c)

# NA summary ===========================================================================
indo_p <- "/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/processedIndo.csv"
gua_p <- "/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/processedGuate.csv"
nodisagg <- read_csv(gua_p)

indo_eim <- "/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/variable_types/indo_eligible_indicator_multimeasure.csv"
gua_eim <- "/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/variable_types/gua_eligible_indicator_multimeasure.csv"
eligible_indicator_multiple <- read_csv(gua_eim)
# =================================================================== #

multi_measure <- mcentrality %>% 
  filter(Indicator %in% eligible_indicator_multiple$Indicator)

# Which indicators have cut winners?
## Let's say: if a measure has a normalized score at least 0.1 higher than the average of the others under the same indicator, 
## ..it is a cut winner
## 
## (those with all the same score will also yield the expected result -- no cut winner)


# # using the minmax normalized centrality score
# cut_standard <- 0.1 # 0.1 - 30; 0.2 - 22; 0.3 - 15
# compare <- multi_measure %>% 
#   mutate(high = ifelse(rank == 1, 1, 0)) %>% 
#   group_by(Indicator, high) %>% 
#   summarize(mean = mean(centrality_norm)) %>% 
#   ungroup() %>% 
#   tidyr::spread(key = "high", value = "mean") %>%
#   rename("top" = "1") %>%
#   rename("mean_others" = "0") %>%
#   mutate(diff = top - mean_others) %>% 
#   mutate(cut_winner = ifelse(diff > cut_standard, 1, 0))
# 
# 
# (n_winner <- compare %>% filter(cut_winner == 1) %>% nrow()) # 30 out of 291


# normalized -- using the (absolute centrality score)/(number of other measures under the same indicator)
# compare <- merge(compare, multi_measure, by = "Indicator") 
normalized <- multi_measure %>% 
  group_by(Indicator) %>% 
  mutate(n = n()) %>% 
  mutate(centrality_abs = abs(weighted_degree)) %>% 
  mutate(centrality_norm = centrality_abs/(n - 1)) %>% 
  arrange(desc(centrality_norm)) %>% 
  mutate(rank = row_number()) %>% 
  ungroup() 

compare <- normalized %>% 
  mutate(high = ifelse(rank == 1, 1, 0)) %>% 
  group_by(Indicator, high) %>% 
  summarize(mean = mean(centrality_norm)) %>% 
  ungroup() %>% 
  tidyr::spread(key = "high", value = "mean") %>%
  rename("top" = "1") %>%
  rename("mean_others" = "0") %>%
  mutate(diff = top - mean_others) %>% 
  mutate(cut_winner = ifelse(diff > 0.1, 1, 0))

  
(n_winner <- compare %>% filter(cut_winner == 1) %>% nrow()) # indo:14/40 # gua:15/42

descdiff <- compare %>% arrange(desc(diff))

# indo: 34 measures with multiple measures
# diff == 0 -- 17 (all measures have the same score)
# cut winner: if a measure has a centrality score at least 0.1 higher than the average score, it's defined as the cut winner
# 0.1 -- 10
# 0.05 -- 11
# 0.001 -- 16


write.csv(descdiff, 
          "/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/Centrality_representative_results/centrality_scores(after removing disaggregation)/gua_centrality.csv", 
          row.names = FALSE)

