library(tidyverse)
library(igraph)
library(ggraph)
library(ggthemes)
library(readr)
library(ggplot2)
library(qgraph)


#read in nodes
nodes <- read_csv('/Users/lidan/Desktop/qmss/Fall/G5055_Practicum_Project2-main/nlp/edgelist_goal1.csv')
nodes
#change goal into factor value (not number)
nodes$Goal <- as.factor(nodes$Goal)


#read in edgelist of indicator 17.2.1
edgelist <- read_csv('/Users/lidan/Desktop/qmss/Fall/G5055_Practicum_Project2-main/nlp/edgelist.csv')
qgraph(edgelist, groups = nodes$Goal)

#convert it to an igraph object
g <- graph_from_data_frame(d = edgelist, vertices = nodes, directed = FALSE)
edge_attr(g)
#V(g)$color <- nodes$Goal
V(g)$size <- (degree(g) + 1) # the +1 is to avoid size zero vertices
V(g)$color <- nodes$Goal

qgraph(edgelist, groups = nodes$Goal)


