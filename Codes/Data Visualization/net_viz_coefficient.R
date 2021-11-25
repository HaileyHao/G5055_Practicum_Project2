# visualization
library(dplyr)
library(igraph)
library(ggplot2)
library(ggthemes)

setwd("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/coefficient_network")
# setwd("../../Data/coefficient_network")

# load the 2 networks----
## 1. unweighted coefficient network
load("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/coefficient_network/coefficient_net.RData")

## 2. weighted coefficient network
load("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/coefficient_network/coefficient_net_weighted.RData")


V(cg)$id <- V(cg)$Indicator
plot(cg, color = V(cg)$Goal)
vertex_attr(cg)
# 
# tkplot(cg)
# plot.igraph(cg, 
#             # layout = layout.random, 
#             vertex.color = "blanchedalmond",
#             vertex.size = 15,
#             labels = V(cg)$Indicator, 
#             labels.color = "red",
#             label.font = 0,
#             # label.degree = -pi/20,
#             # label.dist = 0, 
#             edge.color = "gainsboro"
#             # edge.width = 1,
#             # edge.labels = NA, 
#             # vertex.frame.color="black",
#             # axes = FALSE, 
#             # xlab = "", 
#             # ylab = "", 
#             # xlim=c(-1,1), 
#             # ylim=c(-1,1)
#             )

library(ggnetwork)
library(ggthemes)
df <- ggnetwork(cg,layout = with_kk())
# df <- ggnetwork(cg, layout = layout_in_circle(cg))
df_m <- left_join(df,catt[-c(2,3)],by="Indicator")
ggplot(df_m, aes(x, y, xend = xend, yend = yend)) +
  geom_edges(alpha = 0.2,color="seashell3",curvature = 0.2) +
  geom_nodes(data=subset(df_m, Goal == 1), color = "red", alpha = 0.5, size = 5) +
  geom_nodes(data=subset(df_m, Goal == 2), color = "palegoldenrod", alpha = 0.5, size = 5) +
  geom_nodes(data=subset(df_m, Goal == 3), color = "darkgreen", alpha = 0.5, size = 5) +
  geom_nodes(data=subset(df_m, Goal == 4), color = "darkred", alpha = 0.5, size = 5) +
  geom_nodes(data=subset(df_m, Goal == 5), color = "orange", alpha = 0.5, size = 5) +
  geom_nodes(data=subset(df_m, Goal == 6), color = "blue", alpha = 0.5, size = 5) +
  geom_nodes(data=subset(df_m, Goal == 7), color = "yellow", alpha = 0.5, size = 5) +
  geom_nodes(data=subset(df_m, Goal == 8), color = "pink", alpha = 0.5, size = 5) +
  geom_nodes(data=subset(df_m, Goal == 9), color = "green", alpha = 0.5, size = 5) +
  geom_nodes(data=subset(df_m, Goal == 10), color = "purple", alpha = 0.5, size = 5) +
  geom_nodes(data=subset(df_m, Goal == 11), color = "salmon2", alpha = 0.5, size = 5) +
  geom_nodes(data=subset(df_m, Goal == 12), color = "blue4", alpha = 0.5, size = 5) +
  geom_nodes(data=subset(df_m, Goal == 13), color = "navy", alpha = 0.5, size = 5) +
  geom_nodes(data=subset(df_m, Goal == 14), color = "gray4", alpha = 0.5, size = 5) +
  geom_nodes(data=subset(df_m, Goal == 15), color = "blue3", alpha = 0.5, size = 5) +
  geom_nodes(data=subset(df_m, Goal == 16), color = "purple3", alpha = 0.5, size = 5) +
  geom_nodes(data=subset(df_m, Goal == 17), color = "green3", alpha = 0.5, size = 5) +
  # geom_nodetext_repel(aes(label = Goal),size = 2) +
  geom_nodetext(aes(label = Goal), size = 3) +
  theme_blank()



# plot.igraph(cg2, 
#             layout = layout.random,
#             vertex.color = "blanchedalmond",
#             vertex.size = 15,
#             labels = V(cg2)$Indicator, 
#             labels.color = "red",
#             label.font = 0,
#             # label.degree = -pi/20,
#             # label.dist = 0, 
#             edge.color = "gainsboro"
#             # edge.width = 1,
#             # edge.labels = NA, 
#             # vertex.frame.color="black",
#             # axes = FALSE, 
#             # xlab = "", 
#             # ylab = "", 
#             # xlim=c(-1,1), 
#             # ylim=c(-1,1)
# )



# visualize the whole weighted coefficient network
library(ggnetwork)
library(ggthemes)
df2 <- ggnetwork(cg2,layout = with_kk()) %>% mutate(positive = ifelse(weight2 > 0, TRUE, FALSE))
# df2 <- ggnetwork(cg, layout = layout_in_circle(cg))
df_m2 <- left_join(df,catt[-c(2,3)],by="Indicator")
ggplot(df_m2, aes(x, y, xend = xend, yend = yend)) +
  geom_edges(alpha = 0.2, color="gray",curvature = 0.2) +
  geom_nodes(data=subset(df_m, Goal == 1), color = "red", alpha = 0.5, size = 5) +
  geom_nodes(data=subset(df_m, Goal == 2), color = "palegoldenrod", alpha = 0.5, size = 5) +
  geom_nodes(data=subset(df_m, Goal == 3), color = "darkgreen", alpha = 0.5, size = 5) +
  geom_nodes(data=subset(df_m, Goal == 4), color = "darkred", alpha = 0.5, size = 5) +
  geom_nodes(data=subset(df_m, Goal == 5), color = "orange", alpha = 0.5, size = 5) +
  geom_nodes(data=subset(df_m, Goal == 6), color = "blue", alpha = 0.5, size = 5) +
  geom_nodes(data=subset(df_m, Goal == 7), color = "yellow", alpha = 0.5, size = 5) +
  geom_nodes(data=subset(df_m, Goal == 8), color = "pink", alpha = 0.5, size = 5) +
  geom_nodes(data=subset(df_m, Goal == 9), color = "green", alpha = 0.5, size = 5) +
  geom_nodes(data=subset(df_m, Goal == 10), color = "purple", alpha = 0.5, size = 5) +
  geom_nodes(data=subset(df_m, Goal == 11), color = "salmon2", alpha = 0.5, size = 5) +
  geom_nodes(data=subset(df_m, Goal == 12), color = "blue4", alpha = 0.5, size = 5) +
  geom_nodes(data=subset(df_m, Goal == 13), color = "navy", alpha = 0.5, size = 5) +
  geom_nodes(data=subset(df_m, Goal == 14), color = "gray4", alpha = 0.5, size = 5) +
  geom_nodes(data=subset(df_m, Goal == 15), color = "blue3", alpha = 0.5, size = 5) +
  geom_nodes(data=subset(df_m, Goal == 16), color = "purple3", alpha = 0.5, size = 5) +
  geom_nodes(data=subset(df_m, Goal == 17), color = "green3", alpha = 0.5, size = 5) +
  # geom_nodetext_repel(aes(label = Goal),size = 2) +
  geom_nodetext(aes(label = Goal), size = 3) +
  theme_blank()












E(cg2)$weight2 <- E(cg2)$weight # the actual value stored in E(cg2)$weight2
E(cg2)$weight <- abs(E(cg2)$weight2) # the absolute value stored in E(cg2)$weight
E(cg2)$width <- E(cg2)$weight

E(cg2)
edge_attr(cg2)

E(cg2)[weight2 <= -0.5]$color <- "darkred"
E(cg2)[weight2 >= 0.5]$color <- "chartreuse3"


vertex_attr(cg2)$Goal

V(cg2)[Goal == 1]$color <- "yellow"
plot(cg2, layout=layout.circle, edge.width=E(cg2)$width, edge.color= E(cg2)$color)
