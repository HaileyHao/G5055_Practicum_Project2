# Text Network built with igraph package

library(igraph)
library(dplyr)

# setwd("../../Data/")
d <- read_csv("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/Text_Model_Data/edgelist.csv") 
d <- d %>% rename("Var1" = "indicator", "Var2" = "related_indicator")

el <- d %>% 
  filter(Var1 != Var2) %>% 
  filter(similarity_score >= 0.2) %>% 
  select(Var1, Var2) %>% 
  unique()

# build a network graph----
g <- graph_from_edgelist(as.matrix(el), directed = FALSE)

# some attributes
info <- read_csv("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/Text_Model_Data/indicator_att.csv")
# information: goal, target, indicator
# limit to only the indicators in the network
Indicators <- rbind(el$Var1,el$Var2) %>% unique()
att <- info[c(2,4,5)] %>% 
  # filter(Indicator %in% el$Var1 | Indicator %in% el$Var2 )\
  filter(Indicator %in% vertex_attr(g)[[1]])

list <- vertex_attr(g)$name # 196 indicators

# add all the attributes to the vertex----
vertex_attr(g, index = att$Indicator) <- att
# att # 98 rows
# vertex_attr(g) # 196 rows
# inspect the vertexes(nodes) in the network----
vertex_attr(g)
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


# rename for later analysis with text network----
tatt <- att
td <- d
tel <- el
tg <- g


# # save attribute table----
# write_csv(tatt, "/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/Text_Model_Data/attributes.csv")
# 
# # save network object in RData format----
# save(td, tel,tg, tatt, file = "/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/Text_Model_Data/text_net.RData")
# 
# # To load the data again
# load("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/Text_Model_Data/text_net.RData")




# change the data format to matrix, to build weighted network
library(tidyr)
d <- read_csv("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/Text_Model_Data/edgelist.csv") 
m <- pivot_wider(d, names_from = related_indicator, values_from = similarity_score)
