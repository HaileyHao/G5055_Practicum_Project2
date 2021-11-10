library(readr)
library(dplyr)

nodisagg <- read_csv("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/processedGuate.csv")

all_indicator <- unique(nodisagg$Indicator) # indo:123 # gua:123
all_SeriesCode <- unique(nodisagg$SeriesCode) # indo:253 # gua:280
all_measure <- unique(nodisagg$UniqueID) # indo:266 # gua:297



# Measure:

# ineligible part 1: measure with all NAs: 
# indo 12 # gua:13
NA_measure <- nodisagg %>% 
  # filter(UniqueID %in% possible_NA_measure$UniqueID) %>% 
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


# ineligible part 2: measures with only one record other than NAs (can't do correlation): 
# indo 63 # gua:77
one_measure <- nodisagg %>% 
  filter(!is.na(Value)) %>%
  group_by(UniqueID) %>% 
  mutate(n = n()) %>% 
  ungroup() %>% 
  filter(n == 1) %>% 
  select(UniqueID) %>% 
  unique()


# ineligible measures: indo:75 # gua:90
ineligible_measure <- rbind(NA_measure, one_measure) %>% unique()





# Indicator:

# ineligible part 1: indicator with all measures with all NAs: 
# indo:6 # gua:6
NA_indicator <- nodisagg %>% 
  select(UniqueID, Indicator) %>% 
  unique() %>% 
  group_by(Indicator) %>% 
  mutate(n = n()) %>% # number of measures under each indicator
  ungroup() %>% 
  mutate(NA_measure = ifelse(UniqueID %in% NA_measure$UniqueID, 1, 0)) %>% 
  unique() %>% 
  filter(NA_measure == 1) %>% 
  group_by(Indicator) %>% 
  mutate(n_na = n()) %>% # number of measures with no data under each indicator
  mutate(all_na = ifelse(n == n_na, 1, 0)) %>% 
  filter(all_na == 1) %>%
  select(Indicator) %>%
  unique()



# indicator with all ineligible measures: 
# indo:29 # gua:31
ineligible_indicator <- nodisagg %>% 
  select(UniqueID, Indicator) %>% 
  unique() %>% 
  group_by(Indicator) %>% 
  mutate(n = n()) %>% # number of measures under each indicator
  ungroup() %>% 
  mutate(one_measure = ifelse(UniqueID %in% one_measure$UniqueID, 1, 0)) %>% # measure with only 1 obs other than NAs
  unique() %>% 
  mutate(NA_measure = ifelse(UniqueID %in% NA_measure$UniqueID, 1, 0)) %>% # measure with all NAs
  filter(one_measure == 1 | NA_measure == 1) %>% 
  group_by(Indicator) %>% 
  mutate(n_ineligible = n()) %>% # number of ineligible measures
  mutate(all_one = ifelse(n == n_ineligible, 1, 0)) %>% 
  filter(all_one == 1) %>%
  select(Indicator) %>%
  unique()


# eligible indicators: indo:94 # gua:92
eligible_indicator <- nodisagg %>% 
  select(Indicator) %>% 
  unique() %>% 
  mutate(eligible = ifelse(Indicator %in% ineligible_indicator$Indicator, 0, 1)) %>% 
  filter(eligible == 1) %>% 
  select(Indicator)

# eligible indicators with multiple measures: indo:40 # gua:42
eligible_indicator_multiple <- nodisagg %>% 
  select(UniqueID, Indicator) %>% 
  unique() %>% 
  filter(Indicator %in% eligible_indicator$Indicator) %>% 
  group_by(Indicator) %>% 
  mutate(n = n()) %>% 
  filter(n > 1) %>%
  select(Indicator) %>%
  unique()


write.csv(eligible_indicator, 
          "/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/variable_types/gua_eligible_indicator_all.csv", 
          row.names = FALSE)

write.csv(eligible_indicator_multiple, 
          "/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/variable_types/gua_eligible_indicator_multimeasure.csv", 
          row.names = FALSE)




