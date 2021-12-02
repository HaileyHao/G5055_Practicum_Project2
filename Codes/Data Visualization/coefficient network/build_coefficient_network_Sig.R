library(igraph)
library(dplyr)
library(readr)

# load data and keep only the node pairs that are related----
setwd("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/PCA_results")
d <- read_csv("indo_coefficients.csv")
p <- read_csv("Indonesia_scaled_correlation_among_indicators_indicator_model_pval.csv") %>% rename(Var1 = X, Var2 = Y, p = `p-unc`) 
d2 <- merge(d, p, by = c("Var1", "Var2"))


# build an unweighted network base (cutoff score = 0.5)----
el <- d2 %>% 
  filter(Var1 != Var2) %>% 
  filter(value >= 0.5 | value <= -0.5) %>%
  filter(p <= 0.05) %>%
  select(Var1, Var2)

# ...with some attributes----
info <- read_csv("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/processedIndo.csv")
# information: goal, target, indicator
att <- info[3:5] %>% 
  unique() %>% 
  filter(Indicator %in% unique(append(el$Var1, el$Var2)))
node <- att[,c(3,1,2)]

g <- graph.edgelist(as.matrix(el), directed = FALSE)
# vertex_attr(g)
# edge_attr(g) # empty because there's no weight


# add all the attributes to the vertex----
vertex_attr(g, index = att$Indicator) <- att
V(g)$name <- V(g)$Indicator


# calculate network variables: degree and several kinds of centrality score----
netatt <- data.frame(Indicator = V(g)$Indicator,
           degree = igraph::degree(g) # number of neighbors # numerically equal to degree centrality
           # btwn = betweenness(g, directed = F), # betweenness centrality
           # close = closeness(g, mode = c("all")), # closeness centrality not well-defined for disconnected graphs
           # eigen = evcent(g) # eigenvector centrality
           )

# merge the network attributes with attributes from other data source----
att <- merge(att, netatt, by='Indicator')

# rename for later analysis with text network----
catt <- att
cd <- d
cel <- el
cg <- g



# # save attribute table----
# write_csv(catt, "/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/coefficient_network/indo_attributes_sig.csv")
# #
# # save network object in RData format----
# save(cd, cel,cg, catt, file = "/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/coefficient_network/indo_coefficient_net_sig.RData")
# 
# # To load the data again
# load("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/coefficient_network/indo_coefficient_net_sig.RData")










# ------------------------------------------------------------------
# # build a weighted network base (edge weight = coefficient)----
# setwd("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/PCA_results")
# matrix_d <- read_csv("indo_coefficients_matrix.csv") # adjacency matrix # former version, no filtering stat sig

# load data and keep all the node pairs statistically significantly related----
setwd("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/PCA_results")
d <- read_csv("gua_coefficients.csv")
p <- read_csv("Guatemala_scaled_correlation_among_indicators_indicator_model_pval.csv") %>% rename(Var1 = X, Var2 = Y, p = `p-unc`) 
d2 <- merge(d, p, by = c("Var1", "Var2"))

# change the data format to matrix, to build weighted network
library(tidyr)
library(dplyr)
el_weighted <- d2 %>% 
  filter(Var1 != Var2) %>% 
  # filter(value >= 0.5 | value <= -0.5) %>% 
  filter(p <= 0.05) %>%
  select(Var1, Var2, value) %>% 
  arrange(abs(value))

library(igraph)

g2 <- graph.data.frame(el_weighted, directed = FALSE)

m <- get.adjacency(g2, sparse = FALSE, attr='value')

# g2 <- graph_from_adjacency_matrix(m, mode = "undirected", weighted = TRUE)

# repeat for the weighted network g2----
# some attributes----
info <- read_csv("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/processedGuate.csv")
# information: goal, target, indicator
att2 <- info[3:5] %>%
  unique() %>%
  filter(Indicator %in% colnames(m))

# add all the attributes to the vertex----
vertex_attr(g2, index = att2$Indicator) <- att2  #### Error in as.igraph.vs(graph, index) : Invalid vertex names
V(g2)$name <- V(g2)$Indicator

# inspect the vertexes(nodes) in the network----
vertex_attr(g2)

# width and sign of ties----
E(g2)$weight <- el_weighted$value
E(g2)$width <- abs(E(g2)$weight)
E(g2)$sign <- ifelse(E(g2)$weight > 0, "positive", 
                         ifelse(E(g2)$weight < 0, "negative", 
                                ifelse(E(g2)$weight == 0, 0, NA)))
edge_attr(g2)


# calculate network variables: degree and several kinds of centrality score----
netatt2 <- data.frame(Indicator = V(g2)$Indicator,
                      degree = igraph::degree(g2), # number of neighbors # numerically equal to degree centrality # here meaningless
                      strength = strength(g2) # sum of the edge weights of the adjacent edges for each vertex # weight here should be absolute value # somehow it's giving all NAs
                     # btwn = betweenness(g2, directed = F), # betweenness centrality # DON'T RUN IT!!! r session aborts
                     # close = closeness(g, mode = c("all")), # closeness centrality not well-defined for disconnected graphs
                     # eigen = evcent(g2) # eigenvector centrality # all very high, not much help
                     )

V(g2)$degree <- netatt2$degree
# merge the network attributes with attributes from other data source----
att2 <- merge(att2, netatt2, by='Indicator')

# rename for later analysis with text network----
# cmatrix_d <- matrix_d
cm <- m
catt2 <- att2
cg2 <- g2

# # save attribute table----
# write_csv(catt2, "/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/coefficient_network/gua_weighted_attributes_sig.csv")
# 
# # save network object in RData format----
# save(cm, cg2, catt2, file = "/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/coefficient_network/gua_coefficient_net_weighted_sig.RData")
# 
# # To load the data again
# load("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/coefficient_network/gua_coefficient_net_weighted_sig.RData")


