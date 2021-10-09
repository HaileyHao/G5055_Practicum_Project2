library(igraph)
library(dplyr)
library(plyr)


pick_central <- function(matrix_file) {
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
  measureID <- df[, c(1,3)] %>% arrange(desc(weighted_degree)) %>% head(1)[1]
  measureID
}


country <- readline(prompt="Country: ")
mydir <-paste("Data/",country, " Correlation among measurements")
corfiles = list.files(pattern="Indicator.*.csv", full.names=TRUE)
# attfiles = list.files(path = mydir, pattern="Attribute.*.csv", full.names=TRUE)


# call function
for (filename in corfiles) {
  print(filename)
  pick_central(filename)
  measureIDs <- append(measureIDs, measureID)
}

# list of central variables
measureIDs <- sapply(as.list(corfiles), pick_central)
measureIDs




