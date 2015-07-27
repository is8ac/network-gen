# Network Graph Generator
## An R script to generate network graphs of relationships

network-graph-gen.R reads two csv files, an edge list and a vertex list,
and uses [igraph](http://igraph.org/) to generate a
[network graph](https://en.wikipedia.org/wiki/Graph_theory) showing
the relations in the edge list between the vertices in the vertex list.
Edges and vertices are automatically color coded according to the
`relation` and `vertexType` columns of
`edgeList.csv` and `vertexList.csv` respectively.
Legends are created for both edges and vertices showing the colors
that were automatically assigned.

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
These will merely be displayed as unconnected vertices floating be themselves.

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

## Using the assignColor() function
AssignColor() accepts a list of values, and returns a list of the same length
containing the corresponding colors.

| Input  | Output  |
| ------ | ------- |
| "foo"  | "red"   |
| "foo"  | "red"   |
| "bar"  | "green" |
| "baz"  | "blue"  |
| "bar"  | "green" |

It also optionally accepts typeList, colorList, and defaultColor.
By default, typeList is uniquified input data, and colorList is a rainbow
of the length of uniquified input data.
However one can manually set these, by supplying a list of values
for typeList, and a list of colors for colorList.

### Considerations
unique() orders the output list in the order in which they first appeared
in the input data.
This means that the first unique value is assigned the first color,
the second unique value is assigned the second color, etc.

In the Fate/Zero example below, the first instances of the friend edge type
was the first unique edge type to appear after the first instance
of the enemy edge type.
Consequently, they were assigned adjacent shades of green,
making them difficult to distinguish.
This can be fixed however by rearranging the first instance of the types, and so,
reassigning the colors assigned to them, to something more distinguishable.

# Examples
Directed graph using the included example data.
![Alice and Bob - key exchange](examples/alice-bob.png)

Undirected graph of Fate/Zero characters.
![Fate/Zero character relationships](examples/fate-zero-characters-relations.png)

Undirected graph, with nodes inferred from the edge list, showing Ethernet
traffic captured by Wireshark.
Edges are color coded acording to traffic type.
![Wireshark Ethernet traffic](examples/wireshark-ethernet-traffic.png)
