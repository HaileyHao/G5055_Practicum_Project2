library(dplyr)

setwd("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/PCA_results")
d <- read_csv("Indonesia_scaled_correlation_among_indicators_indicator_model.csv", col_names = T)
d <- d[-1]


x <- as.matrix(d)
rownames(x) <- colnames(d)
# save(x, file = "indo_coefficient_matrix.RData")
write.csv(x, file = "indo_coefficients_matrix.csv")

x[lower.tri(x)] <- 0 # remove duplicate ties (undirected network)
df <- reshape2::melt(x, na.rm = TRUE) %>% 
  filter(value != 0) %>% 
  mutate(abs = abs(value)) %>% 
  mutate(tie = ifelse(value >= 0.5, 1, 0))
write.csv(df, "indo_coefficients.csv")


