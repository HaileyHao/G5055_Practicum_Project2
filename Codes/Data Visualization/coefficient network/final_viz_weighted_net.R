library(readr)
library(tidyr)
library(dplyr)
library(ggplot2)
library(ggnetwork)

# load data and keep all the node pairs statistically significantly related----
setwd("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/PCA_results")
# d <- read_csv("indo_coefficients.csv")
# p <- read_csv("Indonesia_scaled_correlation_among_indicators_indicator_model_pval.csv") %>% rename(Var1 = X, Var2 = Y, p = `p-unc`)
d <- read_csv("gua_coefficients.csv")
p <- read_csv("Guatemala_scaled_correlation_among_indicators_indicator_model_pval.csv") %>% rename(Var1 = X, Var2 = Y, p = `p-unc`)
d2 <- merge(d, p, by = c("Var1", "Var2"))

# change the data format to matrix, to build weighted network
el_weighted <- d2 %>% 
  filter(Var1 != Var2) %>% 
  # filter(value >= 0.5 | value <= -0.5) %>% 
  filter(p <= 0.05) %>%
  select(Var1, Var2, value) %>% 
  arrange(abs(value)) %>% 
  unique()

# write_csv(el_weighted, file = "indo_coefficients_sig.csv")
# write_csv(el_weighted, file = "gua_coefficients_sig.csv")

# d2 %>%
#   filter(Var1 != Var2) %>%
#   # filter(value >= 0.5 | value <= -0.5) %>%
#   filter(p <= 0.05) %>%
#   select(Var1, Var2, value) %>%
#   arrange(abs(value)) %>%
#   filter(value < 0.5 & value > -0.5)
# ...no sig tie with coeffcient abs < 0.5

library(igraph)

g2 <- graph.data.frame(el_weighted, directed = FALSE)
edge_attr(g2)


# density
edge_density(g2, loops = FALSE)
# indo: 87 nodes, 2138 ties, density 2138/((87*86)/2) = 0.5715049
# gua: 79 nodes, 1992 ties, density 1992/((79*78)/2) = 0.6465433

m <- get.adjacency(g2, sparse = FALSE, attr='value')

# g2 <- graph_from_adjacency_matrix(m, mode = "undirected", weighted = TRUE)

# repeat for the weighted network g2----
# some attributes----
info <- read_csv("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/processedIndo.csv")
# info <- read_csv("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/processedGuate.csv")
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
E(g2)$coefficient <- el_weighted$value
E(g2)$weight <- abs(E(g2)$coefficient)
E(g2)$sign <- ifelse(E(g2)$weight > 0, "positive", 
                     ifelse(E(g2)$weight < 0, "negative", 
                            ifelse(E(g2)$weight == 0, 0, NA)))
E(g2)$color <- ifelse(E(g2)$coefficient > 0, "green", 
                     ifelse(E(g2)$coefficient < 0, "red", 
                            ifelse(E(g2)$coefficient == 0, 0, NA)))
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
catt <- att2
cg <- g2

hex <- read_csv("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Visualizations/goal_hexcodes.csv")
# hex2 <- read_csv("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Visualizations/goal_hexcodes_edge.csv")

# df <- ggnetwork(cg,layout = with_kk())
# df <- ggnetwork(cg, layout = layout_in_circle(cg))
df <- ggnetwork(cg,layout = layout_nicely(cg))
# df <- ggnetwork(cg,layout = with_fr())

ggplot(df, aes(x, y, xend = xend, yend = yend)) +
  geom_edges(alpha = 0.2, curvature = 0.2, color="seashell3") + # aes(color = color) color="seashell3"
  geom_nodes(aes(colour = as.factor(Goal), size = degree), alpha = 0.8) +
  scale_color_manual(values = hex$hexcode) +
  # geom_nodetext_repel(aes(label = Goal),size = 2) +
  # geom_nodetext(aes(label = Target),size = 2) +
  geom_nodetext(aes(label = Indicator),size = 2) +
  # geom_nodetext(aes(label = Indicator), size = 2, color = "white") +
  theme_blank()

cm <- round(cm, 2)
# write.csv(cm, file = "/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/coefficient_network/indo_coefficient_matrix.csv")

summary(as.factor(df$color))

