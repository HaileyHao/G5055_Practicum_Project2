# visualization
library(dplyr)
library(igraph)
library(ggplot2)
library(ggthemes)

# load the 2 networks----
## 1. unweighted text network
load("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/Text_Model_Data/text_net.RData")


library(ggnetwork)
library(ggthemes)
df <- ggnetwork(tg,layout = with_kk())
# df <- ggnetwork(cg, layout = layout_in_circle(cg))
# df_m <- left_join(df,catt[-c(2,3)],by="Indicator")
df_m <- df
ggplot(df_m, aes(x, y, xend = xend, yend = yend)) +
  geom_edges(alpha = 0.5,color="seashell3",curvature = 0.2) +
  scale_color_brewer(palette = "Set2") +
  geom_nodes(size=bt_df$spin, color=bt_df$charm) +
  geom_nodetext(aes(label=vertex.Goal), color="grey80") + 
  theme_blank() +
  coord_fixed( 0.5 )
  # geom_nodes(data=subset(df_m, Goal == 1), color = "red", alpha = 0.5, size = 5) +
  # geom_nodes(data=subset(df_m, Goal == 2), color = "palegoldenrod", alpha = 0.5, size = 5) +
  # geom_nodes(data=subset(df_m, Goal == 3), color = "darkgreen", alpha = 0.5, size = 5) +
  # geom_nodes(data=subset(df_m, Goal == 4), color = "darkred", alpha = 0.5, size = 5) +
  # geom_nodes(data=subset(df_m, Goal == 5), color = "orange", alpha = 0.5, size = 5) +
  # geom_nodes(data=subset(df_m, Goal == 6), color = "blue", alpha = 0.5, size = 5) +
  # geom_nodes(data=subset(df_m, Goal == 7), color = "yellow", alpha = 0.5, size = 5) +
  # geom_nodes(data=subset(df_m, Goal == 8), color = "pink", alpha = 0.5, size = 5) +
  # geom_nodes(data=subset(df_m, Goal == 9), color = "green", alpha = 0.5, size = 5) +
  # geom_nodes(data=subset(df_m, Goal == 10), color = "purple", alpha = 0.5, size = 5) +
  # geom_nodes(data=subset(df_m, Goal == 11), color = "salmon2", alpha = 0.5, size = 5) +
  # geom_nodes(data=subset(df_m, Goal == 12), color = "blue4", alpha = 0.5, size = 5) +
  # geom_nodes(data=subset(df_m, Goal == 13), color = "navy", alpha = 0.5, size = 5) +
  # geom_nodes(data=subset(df_m, Goal == 14), color = "gray4", alpha = 0.5, size = 5) +
  # geom_nodes(data=subset(df_m, Goal == 15), color = "blue3", alpha = 0.5, size = 5) +
  # geom_nodes(data=subset(df_m, Goal == 16), color = "purple3", alpha = 0.5, size = 5) +
  # geom_nodes(data=subset(df_m, Goal == 17), color = "green3", alpha = 0.5, size = 5) +
  # geom_nodetext_repel(aes(label = Goal),size = 2) +
  geom_nodetext(aes(label = Goal), size = 3) +
  theme_blank()
