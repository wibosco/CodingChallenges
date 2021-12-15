//
//  CloneGraph.swift
//  CodingChallenges
//
//  Created by William Boles on 01/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/clone-graph/
//graph theory
struct CloneGraph {
    
    //Time: O(n + e) where `n` is the number of vertices and `e` is the number of edges
    //Space: O(n)
    //DFS
    //recursive
    //
    //Solution Description:
    //Perform a recusive DFS search through the graph, making a copy when we encounter
    //an unvisited vertice and using the original vertice to build that copies neighbor list.
    //If we have already copied a vertice that we encounter (i.e. a later vertice has
    //that previously copied vertice as a neighbor)
    static func cloneGraph(_ vertice: GraphVertice?) -> GraphVertice? {
        guard let vertice = vertice else {
            return nil
        }

        var copiedvertices = [GraphVertice: GraphVertice]()
        deepCopy(curr: vertice, vertices: &copiedvertices)

        return copiedvertices[vertice]!
    }

    @discardableResult
    private static func deepCopy(curr: GraphVertice, vertices: inout [GraphVertice: GraphVertice]) -> GraphVertice {
        guard vertices[curr] == nil else {
            return vertices[curr]!
        }

        let copy = GraphVertice(curr.val)
        vertices[curr] = copy

        for neighbor in curr.neighbors {
            copy.neighbors.append(deepCopy(curr: neighbor, vertices: &vertices))
        }

        return copy
    }
    
    //Time: O(n + e) where `n` is the number of vertice and `e` is the number of edges
    //Space: O(n) where `n` is the number stored in the `vertices` and `visited`
    //DFS
    //recursive
    //dictionary
    //
    //Solution Description:
    //Perform a recusive DFS search through the graph. Initally making a copy without
    //the neighbors attached and then making making another pass through and attached
    //the copied vertices with their copied neighbors
    static func cloneGraphMultiplePasses(_ vertice: GraphVertice?) -> GraphVertice? {
        guard let vertice = vertice else {
            return nil
        }
        
        var vertices = [GraphVertice: GraphVertice]()
        var visited = Set<GraphVertice>()
        deepCopy(curr: vertice, vertices: &vertices, visited: &visited)
        connectNeighbors(vertices: vertices)
        
        return vertices[vertice]! //return copy of vertice passed in
    }
    
    private static func deepCopy(curr: GraphVertice, vertices: inout [GraphVertice: GraphVertice], visited: inout Set<GraphVertice>) {
        guard !visited.contains(curr) else {
            return
        }
    
        visited.insert(curr)
        
        let copy = GraphVertice(curr.val)
        vertices[curr] = copy
        
        for neighbor in curr.neighbors {
            deepCopy(curr: neighbor, vertices: &vertices, visited: &visited)
        }
    }
    
    private static func connectNeighbors(vertices: [GraphVertice: GraphVertice]) {
        for (original, copy) in vertices {
            for originalNeighbor in original.neighbors {
                let copiedNeighbor = vertices[originalNeighbor]!
                copy.neighbors.append(copiedNeighbor)
            }
        }
    }
}
