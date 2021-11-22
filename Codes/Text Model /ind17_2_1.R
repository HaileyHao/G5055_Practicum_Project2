library(tidyverse)
library(igraph)
library(ggraph)
library(ggthemes)
library(readr)
library(ggplot2)

#getwd()
#setwd("/Users/hannahz/Desktop/columbia second semester/practicum/G5055_Practicum_Project2/Data/Text_Model_Data")
#list.files()

#read in nodes
nodes_of17 <- read_csv('nodes_ind17.csv')
nodes_of17
#change goal into factor value (not number)
nodes_of17$goal <- as.factor(nodes_of17$goal)

#read in edgelist of indicator 17.2.1
ind17 <- read_csv('ind17.csv')

#convert it to an igraph object
g <- graph_from_data_frame(d = ind17, vertices = nodes_of17, directed = FALSE)
edge_attr(g)
vertex_attr(g)

library(ggnetwork)
set.seed(2103)
dat <- ggnetwork(g, 
                 layout=igraph::nicely())
dat
dat_label <- dat %>% distinct(name, .keep_all = TRUE)
library(ggrepel)
plot <- 
  ggplot() +
  geom_edges(data=dat, 
             aes(x=x, y=y, xend=xend, yend=yend, size=similarity_score), color="grey50", curvature=0.1) +
  geom_nodes(data=dat,
             aes(x=x, y=y, xend=xend, yend=yend, color = goal),size = 3,show.legend = FALSE) + 
  geom_label_repel(data = dat_label,aes(x=x, y=y, label= name)) +
  scale_color_brewer(palette = 'Set3') + 
  labs(size="similarity score") +  scale_size_continuous(range = c(0.05, 1.2)) +theme_blank() 
plot

path = '/Users/hannahz/Desktop/columbia second semester/practicum/G5055_Practicum_Project2/Visualizations/Text_Model_Viz'
ggsave('indi17_2_1', plot, path = path, device = 'png',dpi = 300, width = 9.71, height = 6.83)
ggsave('indi', plot, path = path, device = 'png',dpi = 300)
