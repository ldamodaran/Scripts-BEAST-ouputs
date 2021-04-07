# Lamvodhar Damodaran
# 2021-04-06
# Visulize an  MCC tree
# Input: annotated MCC tree file from TreeAnotator 
# Output: Time scaled MCC tree with node bars for nodes wiht 95% HPD


library(ggplot2)
library(ggtree)
library(treeio)

# Read in MCC tree file
beast_tree <- read.beast("MCC.tree")

### change mrsd to the earliest sampled taxa in your tree
p1 <- ggtree(beast_tree, mrsd='2020-10-02') +
  theme_tree2(panel.grid.major.x=element_line()) + 
  ggtitle("MCC tree") +
  geom_range(range='height_0.95_HPD', color='red', alpha=2, size=.3)

p1

# Optional coloring of tips
# Coloring tips by associated metadata (trait metadta should be in format with taxa id column and column for associated metadata trait)

### create a data frame with first column as taxa name and second column as discrete character to color by
data <- read.csv("trait-metadata.tsv", header = TRUE, sep = '\t')
df <- as.data.frame(data)

# to add legend and colored tips
p2 <- p1 %<+% df + geom_tippoint(aes(color=trait1), size=1, alpha=.75) 

p2


