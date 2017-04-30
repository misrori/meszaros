library(RCurl)
library(jsonlite)
library(d3Network)

Source <- c("A", "A", "A", "A", "B", "B", "C", "C", "D")
Target <- c("B", "C", "D", "J", "E", "F", "G", "H", "I")
NetworkData <- data.frame(Source, Target)

d3SimpleNetwork(NetworkData, width = 400, height = 250, file = "elso.html")
