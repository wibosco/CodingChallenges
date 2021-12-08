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
    
    //Time: O(n + e) where `n` is the number of nodes and `e` is the number of edges
    //Space: O(n)
    //DFS
    //recursive
    //
    //Solution Description:
    //Perform a recusive DFS search through the graph, making a copy when we encounter
    //an unvisited node and reusing visited nodes where possible.
    static func cloneGraph(_ node: GraphVertice?) -> GraphVertice? {
        guard let node = node else {
            return nil
        }

        var copiedNodes = [GraphVertice: GraphVertice]()
        deepCopy(curr: node, nodes: &copiedNodes)

        return copiedNodes[node]!
    }

    @discardableResult
    private static func deepCopy(curr: GraphVertice, nodes: inout [GraphVertice: GraphVertice]) -> GraphVertice {
        guard nodes[curr] == nil else {
            return nodes[curr]!
        }

        let copy = GraphVertice(curr.val)
        nodes[curr] = copy

        for neighbor in curr.neighbors {
            copy.neighbors.append(deepCopy(curr: neighbor, nodes: &nodes))
        }

        return copy
    }
    
    //Time: O(n + e) where `n` is the number of nodes and `e` is the number of edges
    //Space: O(n)
    //DFS
    //recursive
    //
    //Solution Description:
    //Perform a recusive DFS search through the graph. Initally making a copy without
    //the neighbors attached and then making making another pass through and attached
    //the copied nodes with their copied neighbors
    static func cloneGraphMultiplePasses(_ node: GraphVertice?) -> GraphVertice? {
        guard let node = node else {
            return nil
        }
        
        var nodes = [GraphVertice: GraphVertice]()
        var visited = Set<GraphVertice>()
        deepCopy(curr: node, nodes: &nodes, visited: &visited)
        connectNeighbors(nodes: nodes)
        
        return nodes[node]! //return copy of node passed in
    }
    
    private static func deepCopy(curr: GraphVertice, nodes: inout [GraphVertice: GraphVertice], visited: inout Set<GraphVertice>) {
        guard !visited.contains(curr) else {
            return
        }
    
        visited.insert(curr)
        
        let copy = GraphVertice(curr.val)
        nodes[curr] = copy
        
        for neighbor in curr.neighbors {
            deepCopy(curr: neighbor, nodes: &nodes, visited: &visited)
        }
    }
    
    private static func connectNeighbors(nodes: [GraphVertice: GraphVertice]) {
        for (original, copy) in nodes {
            for originalNeighbor in original.neighbors {
                let copiedNeighbor = nodes[originalNeighbor]!
                copy.neighbors.append(copiedNeighbor)
            }
        }
    }
}
