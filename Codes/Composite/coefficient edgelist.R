setwd("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/PCA_results")
d <- read_csv("Indonesia_scaled_correlation_among_indicators_indicator_model.csv", col_names = T)
d <- d[-1]
rownames(x) <- colnames(d)
x <- as.matrix(d)
x[lower.tri(x)] <- 0
rownames(x) <- colnames(d)
df <- reshape2::melt(x, na.rm = TRUE) %>% filter(value != 0)
write.csv(df, "coefficients.csv")


