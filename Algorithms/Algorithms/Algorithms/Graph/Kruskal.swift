//
//  Kruskal.swift
//  Algorithms
//
//  Created by William Boles on 10/06/2022.
//

import Foundation

struct Kruskal {
        
    //Time: O(e log e) where e is the number of edges in the graph
    //Space: O(e)
    //undirected
    //greedy
    //Kruskal's Algorithm
    //adjacency list
    //disjoint set
    //union find
    //MST - minimum spanning tree
    //sorting
    //
    //Solution Description:
    //Given an undirected, weighted graph we can construct a minimum spanning tree (MST) from its vertices using Kruskal's
    //algorithm. An MST is a subset of edges in the graph that connects all vertices without any cycles and with the minimum
    //possible total edge weight. Kruskal's algorithm does this by always choosing the cheapest edge that doesn't result in a cycle
    //being introduced (trees don't have cycles). We determine if introducing an edge introduces a cycle by using a disjoint set
    //and attempting to perform a union between the two vertices on that edge, if those two vertices have the same root vertice
    //then it means that both are currently in the MST and adding that edge would result in a cycle; if they don't have the same
    //root vertice then it is safe to add that edge to the MST. It's important to note that that cheapest edge does not need to use
    //a vertice already in the MST - this is the reason for using a disjoint set as our in-progress can contain unconnected
    //subgraphs so just using a `visited` set won't tell us if adding an edge to our MST with two already visited vertices was
    //introducing a cycle or joining together two disconnected subgraphs/trees into the one graph/tree. As an MST can only have
    //`|adjList| - 1` edges then once our MST reaches that number of edges we know we have built the MST and don't need to keep
    //checking edges.
    //
    //Similar to Prim's Algorithm
    static func minimumSpanningTree(_ adjList: [[(vertice: Int, weight: Int)]]) -> [(source: Int, destination: Int, weight: Int)]? {
        guard !adjList.isEmpty else {
            return nil
        }
        
        //use a disjoint set as the in-progress MST can contain multiple disconnected graphs/trees
        let unionFind = UnionFind(count: adjList.count)
        var mst = [(source: Int, destination: Int, weight: Int)]()
        
        var edges = [(source: Int, destination: Int, weight: Int)]()
        
        //convert adjList into edge list
        for (vertice, neighbors) in adjList.enumerated() {
            for neighbor in neighbors {
                edges.append((vertice, neighbor.vertice, neighbor.weight))
            }
            
        }
        
        edges.sort { $0.weight < $1.weight } // O(e log e)
        
        for edge in edges {
            //check if the two vertices are already in the same subtree within the MST tree
            if unionFind.union(edge.source, edge.destination) {
                mst.append((edge.source, edge.destination, edge.weight))
            }
            
            //MST has exactly `adjList.count - 1` edges
            guard mst.count < adjList.count else {
                break
            }
        }
        
        return mst
    }
}
