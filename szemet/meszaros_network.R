# Load data
data(MisLinks)
data(MisNodes)

MisLinks <- read.csv('linkes.txt')
MisNodes <- read.csv('nodes.txt')

# Plot
forceNetwork(Links = MisLinks, Nodes = MisNodes,
             Source = "source", Target = "target",
             Value = "value", NodeID = "Name",
             Group = "group", opacity = 0.8, arrows = T)