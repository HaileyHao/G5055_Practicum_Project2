library(dplyr)

setwd("../..//Data/PCA_results")
d <- read_csv("Guatemala_scaled_correlation_among_indicators_indicator_model.csv", col_names = T)
d <- d[-1]
rownames(x) <- colnames(d)

x <- as.matrix(d)
x[lower.tri(x)] <- 0
rownames(x) <- colnames(d)

df <- reshape2::melt(x, na.rm = TRUE) %>% 
  filter(value != 0) %>% 
  mutate(abs = abs(value)) %>% 
  mutate(tie = ifelse(value >= 0.5, 1, 0))
write.csv(df, "gua_coefficients.csv")


