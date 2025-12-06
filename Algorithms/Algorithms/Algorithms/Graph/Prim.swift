// Created 09/06/2022.

import Foundation

struct Prim {
    
    //Time: O(e log e) where e is the number of edges in the graph
    //Space: O(e)
    //graph theory
    //undirected
    //greedy
    //Prim's Algorithm
    //adjacency list
    //visited
    //min heap
    //MST - minimum spanning tree
    //
    //Solution Description:
    //Given an undirected, weighted graph we can construct a minimum spanning tree (MST) from its vertices using Prim's algorithm.
    //An MST is a subset of edges in the graph that connects all vertices without any cycles and with the minimum possible total
    //edge weight - note that with an MST we don't really traverse down each edge so if we go A -> B then we can choose the
    //cheapest edge from either A or B i.e. we are not "on" B and so don't need to "pay" to get back to A. To construct a MST we
    //select any given vertice e.g. A and then find the cheapest edge between that vertice and one of it's neighbors e.g. B, we
    //then choose the cheapest edge starting at either A or B (that won't introduce a cycle) and connect that neighbor e.g. to
    //our growing MST e.g.
    //
    //MST after iteration 1:
    //
    //           +---+
    //           | A |
    //           +---+
    //
    //MST after iteration 2:
    //
    //           +---+    +---+
    //           | A +----+ B |
    //           +---+    +---+
    //
    //MST after iteration 3:
    //
    //           +---+    +---+
    //           | A +----+ B |
    //           +-+-+    +---+
    //             |
    //             |
    //           +-+-+
    //           | C |
    //           +---+
    //
    //            OR
    //
    //           +---+    +---+
    //           | A +----+ B |
    //           +---+    +-+-+
    //                      |
    //                      |
    //                    +-+-+
    //                    | C |
    //                    +---+
    //
    //As you can see from the above example, it doesn't matter which of A or B, C connects to - it only matter that that edge is
    //the cheapest edge available and that there is a connection between the new vertice and an existing vertice in the MST. With
    //Prim's algorithm the MST is always connected as it built up - we can only select edges once a vertice at either side of that
    //edge is added to the MST. To allow us to always select the cheapest edge we use a min heap sorted by edge weight. To avoid
    //introducing cycles we add each vertice that we add the MST also to `visited` set - if the cheapest edge is back an existing
    //vertice in the MST we skip it.
    //
    //N.B. An MST will have `|adjList| - 1` edges.
    //N.B. Where multiple edges have the same (min) weight selecting any is valid
    //
    //Similar to Kruskal's Algorithm
    static func minimumSpanningTree(_ adjList: [[(vertice: Int, weight: Int)]]) -> [(source: Int, destination: Int, weight: Int)]? {
        guard !adjList.isEmpty else {
            return nil
        }

        //We need to track the full edge between two vertices so we add not just the destination vertice but also
        //the source vertice. This will allow us to construct a tree.
        var minHeap = Heap<(vertice: Int, weight: Int, source: Int?)> { $0.weight < $1.weight }
        minHeap.insert((0, 0, nil)) //the first vertice does't come via an edge so `source` is nil
        
        var visited = Set<Int>()
        //can't add the first vertice to `visited` right away as we want to search it's connections
        
        var mst = [(source: Int, destination: Int, weight: Int)]() //will hold each edge in the MST
        
        while let edge = minHeap.remove() {
            guard !visited.contains(edge.vertice) else {
                //vertice is already in our MST so skip this edge to avoid introducing a cycle in the MST
                continue
            }
            
            visited.insert(edge.vertice)
            
            for neighbor in adjList[edge.vertice] {
                minHeap.insert((neighbor.vertice, neighbor.weight, edge.vertice))
            }
            
            guard let source = edge.source else { //skip the first vertice as it isn't connected to anything yet
                continue
            }
            
            mst.append((source, edge.vertice, edge.weight))
        }
        
        return mst
    }
}
