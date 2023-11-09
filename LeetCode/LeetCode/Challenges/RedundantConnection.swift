//
//  RedundantConnection.swift
//  LeetCode
//
//  Created by William Boles on 11/05/2023.
//

import Foundation

//https://leetcode.com/problems/redundant-connection
struct RedundantConnection {
    
    //Time: O(n^2) where n is the number of nodes in the graph
    //Space: O(n)
    //graph theory
    //DFS
    //cycle detection
    //undirected graph
    //
    //Solution Description:
    //We gradually build up the graph by adding edges to it. Before adding an edge to the graph we first check if there already
    //exists a path between the `source` and `destination` using DFS. If a path exists (directly or indirectly) then we know
    //that the edge we are attempting to add is redundant; if an existing path does not exist then we add two edges to our graph
    //and test the next edge against the now slightly larger graph. An undirected graph is effectively a directed graph with two
    //edges between connected nodes - one in and one out. To avoid getting caught in this cycle we track the nodes we have
    //already been to and skip over them by storing those visited nodes in `visited`. This is reset with each edge iteration to
    //ensure another full search of the graph is completed for a path between `edge[0]` and `edge[1]`.
    //
    //N.B. How we only build the graph enough to be able to find the cycle.
    //
    //N.B. This is similar to detecting a cycle in topological sort.
    static func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        var adjList = Array(repeating: [Int](), count: (edges.count + 1))
        
        for edge in edges {
            var visited = Set<Int>()
            
            //check if a path already exists between the two nodes
            if pathExists(adjList, edge[0], edge[1], &visited) {
                return edge
            }

            //now add that edge to the graph
            adjList[edge[0]].append(edge[1])
            adjList[edge[1]].append(edge[0])
        }
        
        return [Int]() //no cycle found
    }
    
    private static func pathExists(_ adjList: [[Int]], _ source: Int, _ destination: Int, _ visited: inout Set<Int>) -> Bool {
        //found an existing path between source to destination despite that "edge" not having been added yet
        guard source != destination else {
            return true
        }
        
        visited.insert(source)
        
        for neighbor in adjList[source] {
            //an undirected graph is effectively a directed graph with two edges between connected nodes - one in and one out. To
            //avoid getting caught in this cycle we track the nodes we have already been to and skip over them
            if !visited.contains(neighbor) {
                //DFS
                if pathExists(adjList, neighbor, destination, &visited) {
                    return true
                }
            }
        }
        
        return false
    }
}
