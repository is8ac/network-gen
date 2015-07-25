require(igraph)

# Function to assign unique colors to the elements in a list.
assignColor <- function(data,
    typeList=unique(data),
    colorList=rainbow(length(unique(data)))){
  colorData <- data
  colorData <- "black"
  for(type in typeList){
    colorData[data == type] <- colorList[typeList == type]
  }
  return(colorData)
}

# Read in the raw data.
edges <- read.csv("edgeList.csv")
vertices <- read.csv("vertexList.csv")

# Assign colors to the edges and vertices.
edges$color <- assignColor(edges$relation)
vertices$color <- assignColor(vertices$vertexType)

# Create the edge list.
edgeList <- graph.data.frame(edges,vertices=vertices,directed=TRUE)

# Open the graphics device.
png(filename = "network-graph.png", width = 1920, height = 1080, bg="black")
  # Plot
  plot.igraph(edgeList,
    vertex.label.color="white",
    vertex.label.cex=1.5,
    vertex.size=6)
  # Make an edge color legend.
  legend(x="bottomright",
         legend = unique(edges$relation),
         col=rainbow(length(unique(edges$relation))),
         lty=1,
         bg="white")
    # Make a vertex color legend.
    legend(x="bottomleft",
          legend = unique(vertices$vertexType),
          col=rainbow(length(unique(vertices$vertexType))),
          lty=1,
          bg="white")
dev.off()
