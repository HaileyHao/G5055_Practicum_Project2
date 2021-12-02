library(igraph)
library(dplyr)

# load data and keep only the node pairs that are related----
setwd("../../Data/PCA_results")
d <- read_csv("indo_coefficients.csv")

el <- d %>% 
  filter(Var1 != Var2) %>% 
  filter(tie == 1) %>% 
  select(Var1, Var2)

# build a network graph----
g <- graph_from_edgelist(as.matrix(el), directed = FALSE)

# some attributes
info <- read_csv("../../Data/processedIndo.csv")
# information: goal, target, indicator
att <- info[3:5] %>% 
  unique() %>% 
  filter((Indicator %in% el$Var1) | (Indicator %in% el$Var2))

# add all the attributes to the vertex----
vertex_attr(g, index = att$Indicator) <- att

# inspect the vertexes(nodes) in the network----
V(g)$Indicator


# calculate network variables: degree and several kinds of centrality score----
netatt <- data.frame(Indicator = V(g)$Indicator,
           degree = degree(g), # number of neighbors # numerically equal to degree centrality
           btwn = betweenness(g, directed = F), # betweenness centrality
           # close = closeness(g, mode = c("all")), # closeness centrality not well-defined for disconnected graphs
           eigen = evcent(g) # eigenvector centrality
           )[1:5]

# merge the network attributes with attributes from other data source----
att <- merge(att, netatt, by='Indicator')

# write_csv(att, "../../Data/coefficient_network/attributes.csv")

