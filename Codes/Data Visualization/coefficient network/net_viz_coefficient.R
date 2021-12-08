# visualization
library(dplyr)
library(igraph)
library(ggplot2)
library(ggthemes)
library(network)


setwd("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/coefficient_network")
# setwd("../../Data/coefficient_network")

## 1. Indonesia unweighted coefficient network
load("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/coefficient_network/indo_coefficient_net.RData")

library(ggnetwork)
library(ggthemes)
hex <- read_csv("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Visualizations/goal_hexcodes.csv")

# unweighted (only kept coefficient > 0.5 or < -0.5)
V(cg)$id <- V(cg)$Indicator
plot(cg, color = V(cg)$Goal)
vertex_attr(cg)

df <- ggnetwork(cg,layout = with_kk())
# df <- ggnetwork(cg, layout = layout_in_circle(cg))
df_m <- left_join(df,catt[-c(2,3)],by="Indicator")
ggplot(df_m, aes(x, y, xend = xend, yend = yend)) +
  geom_edges(alpha = 0.2,color="seashell3",curvature = 0.2) +
  geom_nodes(aes(colour = as.factor(Goal), size = degree), alpha = 0.8) +
  scale_color_manual(values = hex$hexcode) +
  # geom_nodetext_repel(aes(label = Goal),size = 2) +
  # geom_nodetext(aes(label = Target),size = 2) +
  geom_nodetext(aes(label = Indicator),size = 2) +
  # geom_nodetext(aes(label = Indicator), size = 2, color = "white") +
  theme_blank()






## 2. Guatemala unweighted coefficient network
load("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/coefficient_network/gua_coefficient_net.RData")

library(ggnetwork)
library(ggthemes)
hex <- read_csv("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Visualizations/goal_hexcodes.csv")

# unweighted (only kept coefficient > 0.5 or < -0.5)
V(cg)$id <- V(cg)$Indicator
plot(cg, color = V(cg)$Goal)
vertex_attr(cg)

df <- ggnetwork(cg,layout = with_kk())
# df <- ggnetwork(cg, layout = layout_in_circle(cg))
df_m <- left_join(df,catt[-c(2,3)],by="Indicator")
ggplot(df_m, aes(x, y, xend = xend, yend = yend)) +
  geom_edges(alpha = 0.2,color="seashell3",curvature = 0.2) +
  geom_nodes(aes(colour = as.factor(Goal), size = degree), alpha = 0.8) +
  scale_color_manual(values = hex$hexcode) +
  # geom_nodetext_repel(aes(label = Goal),size = 2) +
  # geom_nodetext(aes(label = Target),size = 2) +
  geom_nodetext(aes(label = Indicator),size = 2) +
  # geom_nodetext(aes(label = Indicator), size = 2, color = "white") +
  theme_blank()








