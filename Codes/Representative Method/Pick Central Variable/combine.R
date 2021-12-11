library(dplyr)
library(readr)

setwd("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data")
# full list of Goal-Target-Indicator-Measure
indo <- read_csv("processedIndo.csv")
gua <- read_csv("processedGuate.csv")

indo_measures <- read_csv("measure_picked/Indo_measureIDs.csv")
indo_measures <- indo_measures$x
gua_measures <- read_csv("measure_picked/Gua_measureIDs.csv") 
gua_measures <- gua_measures$x

indo_indicators <- read_csv("indicator_picked/Indo_indicatorIDs.csv")
indo_indicators <- indo_indicators$x
gua_indicators <- read_csv("indicator_picked/Gua_indicatorIDs.csv")
gua_indicators <- gua_indicators$x

indoGTIM <- indo[, c(2:6)] %>% 
  filter(Indicator %in% indo_indicators) %>% 
  unique() %>% 
  filter(UniqueID %in% indo_measures) %>% 
  select(c("Goal", "Target", "Indicator", "SeriesCode", "UniqueID")) %>% 
  unique()

write.csv(indoGTIM, 
           "/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/variables_picked/Indo_GTIM.csv", 
           row.names = FALSE)

guaGTIM <- gua[, c(2:6)] %>% 
  filter(Indicator %in% indo_indicators) %>% 
  unique() %>% 
  filter(UniqueID %in% indo_measures) %>% 
  select(c("Goal", "Target", "Indicator", "SeriesCode", "UniqueID")) %>% 
  unique()

write.csv(guaGTIM, 
          "/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/variables_picked/Gua_GTIM.csv", 
          row.names = FALSE)
