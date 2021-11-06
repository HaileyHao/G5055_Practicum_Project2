library(readr)
library(dplyr)

nodisagg <- read_csv("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/processedIndo.csv")

all_indicator <- unique(nodisagg$Indicator) # indo:123 # gua:183
all_SeriesCode <- unique(nodisagg$SeriesCode) # indo:253 # gua:404
all_measure <- unique(nodisagg$UniqueID) # indo:266 # gua:1080


possible_NA_measure <- nodisagg %>% filter(is.na(Value)) %>% select(UniqueID) # indo 54 # gua:116
NA_measure <- nodisagg %>% 
  filter(UniqueID %in% possible_NA_measure$UniqueID) %>% 
  group_by(UniqueID) %>% 
  mutate(n = n()) %>% 
  ungroup() %>% 
  filter(is.na(Value)) %>% 
  group_by(UniqueID) %>% 
  mutate(n_na = n()) %>% 
  mutate(all_na = ifelse(n_na == n, 1, 0)) %>% 
  filter(all_na == 1) %>% 
  select(UniqueID) %>% 
  unique()
# measure with all NAs: indo 12 # gua:20

isna_measure <- nodisagg %>% 
  filter(UniqueID %in% possible_NA_measure$UniqueID) %>% 
  group_by(UniqueID) %>% 
  mutate(n = n()) %>% 
  ungroup() %>% 
  filter(is.na(Value)) %>% 
  group_by(UniqueID) %>% 
  mutate(n_na = n()) %>% 
  mutate(all_na = ifelse(n_na == n, 1, 0)) 
possible_NA_indicator <- isna_measure %>% 
  filter(all_na == 1) %>% 
  ungroup() %>% 
  select(Indicator) %>% 
  unique()
NA_indicator <- nodisagg %>% 
  select(UniqueID, Indicator) %>% 
  filter(Indicator %in% possible_NA_indicator$Indicator) %>% 
  group_by(Indicator) %>% 
  mutate(n = n()) %>% 
  ungroup() %>% 
  mutate(NA_measure = ifelse(UniqueID %in% NA_measure$UniqueID, 1, 0)) %>% 
  unique() %>% 
  filter(NA_measure == 1) %>% 
  group_by(Indicator) %>% 
  mutate(n_na = n()) %>% 
  mutate(all_na = ifelse(n == n_na, 1, 0)) %>% 
  filter(all_na == 1) %>% 
  select(Indicator) %>% 
  unique()
# indicator with all measures with all NAs: indo:3 # gua:4


# measures with only one record other than NAs (can't do correlation): indo 63 # gua:190
one_measure <- nodisagg %>% 
  filter(!is.na(Value)) %>%
  group_by(UniqueID) %>% 
  mutate(n = n()) %>% 
  ungroup() %>% 
  filter(n == 1) 

# indicator with all measures with only one record (can't do correlation): indo:31 # gua:54
isna_indicator <- nodisagg %>% 
  filter(Indicator %in% one_measure$Indicator) %>% 
  group_by(Indicator) %>% 
  mutate(n = n()) %>% 
  ungroup() %>%
  filter(UniqueID %in% one_measure$UniqueID) %>% 
  group_by(Indicator) %>% 
  mutate(n_one = n()) %>% 
  mutate(all_one = ifelse(n == n_one, 1, 0))

one_indicator <- isna_indicator %>% 
  select(Indicator) %>% 
  unique()


# ineligible measures: indo:75 # gua:210
ineligible_measure <- rbind(NA_measure, one_measure)


# ineligible indicators: indo:34 # gua:58
ineligible_indicator <- rbind(NA_indicator, one_indicator)

# eligible indicators: indo:89 # gua:125
eligible_indicators <- nodisagg %>% 
  select(Indicator) %>% 
  unique() %>% 
  mutate(eligible = ifelse(Indicator %in% ineligible_indicator$Indicator, 0, 1)) %>% 
  filter(eligible == 1)

# eligible indicators with multiple measures: indo:34 # gua:70
eligible_indicator_multiple <- nodisagg %>% select(UniqueID, Indicator) %>% 
  unique() %>% 
  filter(Indicator %in% eligible_indicators$Indicator) %>% 
  group_by(Indicator) %>% 
  mutate(n = n()) %>% 
  filter(n > 1) %>% 
  select(Indicator) %>% 
  unique()
