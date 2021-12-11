library(igraph)
# library(plyr)
# library(dplyr)
library(tidyverse)
library(readr)


# define function -- gives the whole list of measure and their weighted degree centrality score
centrality_list <- function(matrix_file) {
  # import measure matrix
  init_matrix <- read.csv(matrix_file, header=TRUE, row.names=1, check.names=FALSE, na.strings = "")
  # set missing values to 0
  init_matrix[is.na(init_matrix)] <- 0
  # prepare matrix for graph
  matrix <- as.matrix(init_matrix) 
  
  diag(matrix) <- 0
  g <- graph_from_adjacency_matrix(matrix, mode = "undirected", weighted = TRUE)
  df <- data.frame(ID = V(g)$name,
                   degree = degree(g, loops = FALSE),
                   weighted_degree = graph.strength(g))
  df <- df[, c(1, 3)] %>% arrange(desc(weighted_degree))
  rownames(df) <- NULL
  df$Indicator = stringr::str_match(matrix_file, "Indicator \\s*(.*?)\\s*.csv")[2]
  # minmax_scaler <- function(x) { (x - min(x)) / (max(x) - min(x)) }
  # df <- mutate(df, centrality_abs = abs(weighted_degree))
  # df <- mutate(df, centrality_norm = minmax_scaler(centrality_abs)) 
  df[, c(1,3,2)]
}


# set path and get a list of file names to iter over later
# country <- readline(prompt="Country: ")
# mydir <-paste("Data/",country, " Correlation among measurements")
mydir <- "/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/Indonesia Correlation among measurements"
corfiles = list.files(mydir, pattern = "Indicator.*.csv", full.names=TRUE)


mcentrality_indo <- data_frame()

for (matrix_file in as.list(corfiles))
  {mcentrality_indo <- rbind(mcentrality_indo, centrality_list(matrix_file))}

mcentrality_indo <- mcentrality_indo %>% arrange(Indicator, ID) %>% unique()

# length(mcentrality_indo$Indicator %>% unique()) # 123 indicators

write.csv(mcentrality_indo, 
          "/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/centrality_scores/Indo_measure_centrality.csv", 
          row.names = FALSE)

