# Knight's Travails

Created as part of The Odin Project curriculum.

### Functionality

The Board class includes the method `knight_moves`, which returns a knight's shortest path from one square of an empty chess board to another. 

The Board class accepts standard algebraic chess notation and converts it to array notation with [0, 0] at the top left. The Graph class deals mainly in array coordinates, but converts that to an index value in order to hold vertices in its @vertex_list.

On instantiation, the Board class creates a graph that contains vertices for each square and edges between them that reflect the moves of a knight. These can be displayed with `display_vertices`  and `display_edges`. 

At the heart of the program are Board's `add_knight`, which populates the graph with vertices and edges, and Graph's `bfs`. This is a modified breadth-first search that instead of storing single vertices in its queue, stores the full path to them. That way, once the target square is found, it can immediately return the path that got there.

### Thoughts

This was the most complicated program I've written in terms of thinking about different classes and how they relate to one another. For me, an understanding of the breadth-first search in an undirected, non-weighted graph, was the key to finding a solution. 

-Andrew Hayhurst