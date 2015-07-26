# Network Graph Generator
## An R script to generate network graphs of relationships

network-graph-gen.R reads two csv files, an edge list and a vertex list,
and uses [igraph](http://igraph.org/) to generate a network graph
showing the relations in the edge list between the vertices in the vertex list.
Edges and vertices are automatically color coded according to the
`relation` and `vertexType` columns of
`edgeList.csv` and `vertexList.csv` respectively.
Legends are created for both edges and vertices showing the colors
that were assigned to then.

## Usage
### Input data
The edge list and vertex list should be placed in the files
`edgeList.csv` and `vertexList.csv` respectively.
Alternatively, the lines
```R
edges <- read.csv("edgeList.csv")
vertices <- read.csv("vertexList.csv")
```
can be edited to the names of your data files.

### Directional
By default, igraph sets `directed=TRUE`.
This means that edges are considered to show one-way relationships,
and bidirectional relationships require two rows in the edge list.
If you wish to show direction-less relationships, set `directed=FALSE`

## Vertex List Considerations
If the edge list refers to vertices that are not listed in the vertex list,
then igraph will halt with the message:
```
Error in graph.data.frame(edges, vertices = vertices, directed = TRUE) :
  Some vertex names in edge list are not listed in vertex data frame
```
It will not however complain if there are vertices that have no edges.
They will merely be displayed as unconnected vertices floating be themselves.

Alternatively, you can do away with the vertex list completely,
and have igraph infer the vertices purely from the edge list.
This can be accomplished by changing the line
``` R
edgeList <- graph.data.frame(edges,vertices=vertices,directed=TRUE)
```
to
``` R
edgeList <- graph.data.frame(edges,directed=TRUE)
```

# Examples
Directed graph using the included example data.
![Alice and Bob - key exchange](examples/alice-bob.png)

Bidirectinal example using characters from Fate/Zero.
![Fate/Zero character relationships](examples/fate-zero-characters-relations.png)
