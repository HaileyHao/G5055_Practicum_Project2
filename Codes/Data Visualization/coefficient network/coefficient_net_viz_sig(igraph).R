

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
  filter(value >= 0.5 | value <= -0.5) %>%
  filter(p <= 0.05) %>%
  select(Var1, Var2, value) %>% 
  arrange(abs(value))

library(igraph)

g <- graph.data.frame(el_weighted, directed = FALSE)

m <- get.adjacency(g, sparse = FALSE, attr='value')

# g2 <- graph_from_adjacency_matrix(m, mode = "undirected", weighted = TRUE)

# repeat for the weighted network g2----
# some attributes----
info <- read_csv("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/processedGuate.csv")
# information: goal, target, indicator
att <- info[3:5] %>%
  unique() %>%
  filter(Indicator %in% colnames(m))

# add all the attributes to the vertex----
vertex_attr(g, index = att$Indicator) <- att  #### Error in as.igraph.vs(graph, index) : Invalid vertex names
V(g)$name <- V(g)$Indicator
# color vertex with Goal
color <- c("#ea1d2d", "#d19f2a","#2d9a47", "#c22033","#ef412a", "#00add9", "#fdb714", "#8f1838", "#f36e24", "#e01a83", "#f99d25", "#cd8b2a", "#48773c", "#007dbb", "#40ae49",  "#00558a", "#1a3668")
V(g)$color <- color[V(g)$Goal]

# inspect the vertexes(nodes) in the network----
vertex_attr(g)

# width and sign of ties----
E(g)$weight <- el_weighted$value
E(g)$width <- abs(E(g)$weight)
# E(g)$sign <- ifelse(E(g)$weight > 0, "positive", 
#                      ifelse(E(g)$weight < 0, "negative", 
#                             ifelse(E(g)$weight == 0, 0, NA)))
E(g)$color <- ifelse(E(g)$weight > 0, "green", 
                    ifelse(E(g)$weight < 0, "red", 
                           ifelse(E(g)$weight == 0, "white", NA)))
edge_attr(g)


# calculate network variables: degree and several kinds of centrality score----
netatt <- data.frame(Indicator = V(g)$Indicator,
                      degree = igraph::degree(g), # number of neighbors # numerically equal to degree centrality # here meaningless
                      strength = strength(g) # sum of the edge weights of the adjacent edges for each vertex # weight here should be absolute value # somehow it's giving all NAs
)

V(g)$degree <- netatt$degree
# merge the network attributes with attributes from other data source----
att <- merge(att, netatt, by='Indicator')


# -----------------------
gua_cg <- g

# vertex attributes: Goal, Target, Indicator
vertex_attr(gua_cg)

# edge attributes: value, width, sign
edge_attr(gua_cg)
# value(weight): coefficient
# width: absolute value of coefficient
# sign: positive or negative

# plotting 1: without label
plot(gua_cg, 
     # vertex.label = V(gua_cg)$indicator,
     vertex.label = NA,
     # label.cex = 0.00001, not working
     # label.color = "red", # not working
     # edge.color = "gray77",
     vertex.color = adjustcolor(V(gua_cg)$color, alpha.f = 1), 
     vertex.size = V(gua_cg)$degree/6,
     edge.width = E(gua_cg)$width/2,
     edge.color = adjustcolor(E(gua_cg)$color, alpha.f = 0.5),
     layout = layout_with_fr(gua_cg))
     # layout_on_grid(gua_cg))
     # layout_randomly(gua_cg))
     # layout_as_tree(gua_cg))
     

# ?layout_
