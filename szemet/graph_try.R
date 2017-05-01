library(RCurl)
library(jsonlite)
library(networkD3)

Source <- c("Mészáros Lőrinc", "Mészáros Lőrinc", "Mészáros Lőrinc", "Mészáros Gasztro Kft.", "Mészáros Gasztro Kft.", "Talentis Group Zrt.")
Target <- c("CLH kft", "Talentis Group Zrt.", "Mészáros Gasztro Kft.", "TÉMADESIGN Kft.", "POLLUX Hotel Zrt.", "Agrosystem Zrt.")
NetworkData <- data.frame(Source, Target)

simpleNetwork(NetworkData, opacity = 1, zoom = T)

############################################################
data(MisLinks)
data(MisNodes)

# Plot
forceNetwork(Links = MisLinks, Nodes = MisNodes,
             Source = "source", Target = "target",
             Value = "value", NodeID = "name",
             Group = "group", opacity = 1)
###########################################################

URL <- paste0(
  "https://cdn.rawgit.com/christophergandrud/networkD3/",
  "master/JSONdata//flare.json")

## Convert to list format
Flare <- jsonlite::fromJSON(URL, simplifyDataFrame = FALSE)

# Use subset of data for more readable diagram
Flare$children = Flare$children[1:3]

radialNetwork(List = Flare, fontSize = 10, opacity = 0.9)

diagonalNetwork(List = Flare, fontSize = 10, opacity = 0.9)
