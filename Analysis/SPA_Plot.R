#### Sequence Pattern Analysis Plot
  
# Library
install.packages("networkD3")
install.packages("tidyverse")
library(networkD3)
library(tidyverse)
library(dplyr)
library(tidyr)

install.packages("magrittr") # only needed the first time you use it
install.packages("dplyr")    # alternative installation of the %>%
library(magrittr) # need to run every time you start R and want to use %>%
library(dplyr)

# 1 ------ CONNECTION DATA FRAME
# Usually what you have is a connection data frame: a list of flows with intensity for each flow
links=data.frame(source=c("Normal(A)","Normal(A)","Minor arrhythmia without symptom(C)",
                          "Minor arrhythmia with symptom(D)", "Moderate arrhythmia(E)"),
                          target=c("Normal(A)","Minor arrhythmia without symptom(C)","Severe arrhythmia(F)", 
                                   "Severe arrhythmia(F)","Severe arrhythmia(F)"))

# Make a connection data frame
links=data.frame(source=c("Normal(A)", "Minor arrhythmia without symptom(C)", "Minor arrhythmia with symptom(D)", "Moderate arrhythmia(E)"), 
                 target=c("Normal(A)", "Minor arrhythmia without symptom(C)", "Severe arrhythmia(F)", "Severe arrhythmia(F)", "Severe arrhythmia(F)"), 
                 value=c(2, 2, 2, 2, 2))

# From these flows we need to create a node data frame: it lists every entities involved in the flow
nodes=data.frame(name=c(as.character(links$source), as.character(links$target)) %>% unique())
links$IDsource=match(links$source, nodes$name)-1 
links$IDtarget=match(links$target, nodes$name)-1

# prepare color scale: I give one specific color for each node.
my_color <- 'd3.scaleOrdinal() .domain(["Normal(A)", "Minor arrhythmia without symptom(C)","arrhythmia without symptom(C)", "Minor arrhythmia with symptom(D)",
            "Moderate arrhythmia(E)", "Severe arrhythmia(F)"]) 
            .range(["blue", "green", "yellow", "red", "pink", "red"])'

# Make the Network. I call my colour scale with the colourScale argument
sankeyNetwork(Links = links, Nodes = nodes, Source = "IDsource", Target = "IDtarget", Value = "value", NodeID = "name", colourScale=my_color)
