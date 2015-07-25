# Network Graph Generator
## An R script to generate network graphs of relationships.

network-graph-gen.R reads two csv files, and edge list and a vertex list,
and uses the [igraph](http://igraph.org/) package to generate a network graph showing the relations in the edge list
between the vertices's in the vertex list.
Edges and vertices's are color coded according to the the `relation` or `vertexType` columns respectively.
Legends are created for both edges and vertices's showing the colors that were assigned to then.

## Usage
### Input data
The edge list and vertex list should be placed in the files
"edgeList.csv" and "vertexList.csv" respectively.
Alternatively, the lines
```R
edges <- read.csv("edgeList.csv")
vertices <- read.csv("vertexList.csv")
```
can be edited to names of your data files.

### Directional
By default, igraphs directed=TRUE.
This means that edges are considered to show one way relationships.
If you wish to show bidirectional relationships, set `directed=FALSE`
