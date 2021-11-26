# visualization
library(dplyr)
library(igraph)
library(ggplot2)
library(ggthemes)
library(ggnetwork)

# load the 2 networks----
## 1. unweighted text network
load("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/Text_Model_Data/text_net.RData")

hex <- read_csv("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Visualizations/goal_hexcodes.csv")

# unweighted (only kept similarity > 0.2)
V(tg)$id <- V(tg)$Indicator
plot(tg, color = V(tg)$Goal)
vertex_attr(tg)

df <- ggnetwork(tg,layout = with_fr())
# df <- ggnetwork(cg, layout = layout_in_circle(cg))
df_m <- left_join(df,tatt[-c(2,3)],by="Indicator")
ggplot(df_m, aes(x, y, xend = xend, yend = yend)) +
  geom_edges(alpha = 0.2,color="seashell3",curvature = 0.2) +
  geom_nodes(aes(colour = as.factor(Goal), size = degree), alpha = 0.8) +
  scale_color_manual(values = hex$hexcode) +
  # geom_nodetext_repel(aes(label = Goal),size = 2) +
  # geom_nodetext(aes(label = Target),size = 2) +
  geom_nodetext(aes(label = Indicator),size = 2) +
  # geom_nodetext(aes(label = Indicator), size = 2, color = "white") +
  theme_blank()

