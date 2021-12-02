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
    //dfs
    //recursive
    //
    //Solution Description:
    //Perform a recusive DFS search through the graph, making a copy when we encounter
    //an unvisited node and reusing visited nodes where possible.
    static func cloneGraph(_ node: GraphNode?) -> GraphNode? {
        guard let node = node else {
            return nil
        }

        var copiedNodes = [GraphNode: GraphNode]()
        deepCopy(curr: node, nodes: &copiedNodes)

        return copiedNodes[node]!
    }

    @discardableResult
    private static func deepCopy(curr: GraphNode, nodes: inout [GraphNode: GraphNode]) -> GraphNode {
        guard nodes[curr] == nil else {
            return nodes[curr]!
        }

        let copy = GraphNode(curr.val)
        nodes[curr] = copy

        for neighbor in curr.neighbors {
            copy.neighbors.append(deepCopy(curr: neighbor, nodes: &nodes))
        }

        return copy
    }
    
    //Time: O(n + e) where `n` is the number of nodes and `e` is the number of edges
    //Space: O(n)
    //dfs
    //recursive
    //
    //Solution Description:
    //Perform a recusive DFS search through the graph. Initally making a copy without
    //the neighbors attached and then making making another pass through and attached
    //the copied nodes with their copied neighbors
    static func cloneGraphMultiplePasses(_ node: GraphNode?) -> GraphNode? {
        guard let node = node else {
            return nil
        }
        
        var nodes = [GraphNode: GraphNode]()
        var visited = Set<GraphNode>()
        deepCopy(curr: node, nodes: &nodes, visited: &visited)
        connectNeighbors(nodes: nodes)
        
        return nodes[node]! //return copy of node passed in
    }
    
    private static func deepCopy(curr: GraphNode, nodes: inout [GraphNode: GraphNode], visited: inout Set<GraphNode>) {
        guard !visited.contains(curr) else {
            return
        }
    
        visited.insert(curr)
        
        let copy = GraphNode(curr.val)
        nodes[curr] = copy
        
        for neighbor in curr.neighbors {
            deepCopy(curr: neighbor, nodes: &nodes, visited: &visited)
        }
    }
    
    private static func connectNeighbors(nodes: [GraphNode: GraphNode]) {
        for (original, copy) in nodes {
            for originalNeighbor in original.neighbors {
                let copiedNeighbor = nodes[originalNeighbor]!
                copy.neighbors.append(copiedNeighbor)
            }
        }
    }
}
