//
//  FindIfPathExistsInGraph.swift
//  CodingChallenges
//
//  Created by William Boles on 01/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/find-if-path-exists-in-graph/
//graph theory
struct FindIfPathExistsInGraph {
    
    //Time: O(n + e) where n is the number of nodes and e is the number of edges
    //Space: O(n) where n is the number of nodes
    //BFS
    //adjacency list
    //
    //Solution Description:
    //Build an adjacency list containing all the connections from a node/vertice to other
    //nodes/vertices. Check that both start and end nodes actually have connections. Then
    //traverse the graph in the BFS manner, stopping only when the `end` is found or there
    //are no more edges in the graph that contains `start`.
    static func validPath(_ n: Int, _ edges: [[Int]], _ start: Int, _ end: Int) -> Bool {
        guard start != end else {
            return true
        }
        
        var adjList = Array(repeating: [Int](), count: n)
        for edge in edges {
            adjList[edge[0]].append(edge[1])
            adjList[edge[1]].append(edge[0])
        }
        
        let startNode = adjList[start]
        let endNode = adjList[end]
        
        guard !startNode.isEmpty, !endNode.isEmpty else {
            return false
        }
        
        var visited = Set<Int>()
        var queue = startNode
        
        while !queue.isEmpty {
            let node = queue.removeFirst() //O(n)
            guard !visited.contains(node) else {
                continue
            }
            
            guard node != end else {
                return true
            }
            
            visited.insert(node)
            queue.append(contentsOf: adjList[node])
        }
        
        return false
    }
    
    //Time: O(n + e) where n is the number of nodes and e is the number of edges
    //Space: O(n) where n is the number of nodes
    //DFS
    //adjacency list
    //
    //Solution Description:
    //Build an adjacency list containing all the connections from a node/vertice to other
    //nodes/vertices. Check that both start and end nodes actually have connections. Then
    //traverse the graph in the DFS manner, stopping only when the `end` is found or there
    //are no more edges in the graph that contains `start`.
    static func validPathAdjacencyListDFS(_ n: Int, _ edges: [[Int]], _ start: Int, _ end: Int) -> Bool {
        guard start != end else {
            return true
        }
        
        var adjList = Array(repeating: [Int](), count: n)
        for edge in edges {
            adjList[edge[0]].append(edge[1])
            adjList[edge[1]].append(edge[0])
        }
        
        let startNode = adjList[start]
        let endNode = adjList[end]
        
        guard !startNode.isEmpty, !endNode.isEmpty else {
            return false
        }
        
        var visited = Set<Int>()
        var stack = startNode
        
        while !stack.isEmpty {
            let node = stack.removeLast() //O(1)
            guard !visited.contains(node) else {
                continue
            }
            
            guard node != end else {
                return true
            }
            
            visited.insert(node)
            stack.append(contentsOf: adjList[node])
        }
        
        return false
    }
    
    //Time: O(n + e) where n is the number of nodes and e is the number of edges
    //Space: O(n) where n is the number of nodes
    //DFS
    //
    //Solution Description:
    //Build an array of nodes and then connect them using the array index as the edges
    //index. Then traverse the graph in the DFS manner, stopping only when the `end` is
    //found or there are no more edges in the graph that contains `start`.
    static func validPathGraphNodesDFS(_ n: Int, _ edges: [[Int]], _ start: Int, _ end: Int) -> Bool {
        guard start != end else {
            return true
        }
        
        var nodes = [GraphVertice]()
        for i in 0..<n {
            let node = GraphVertice(i)
            nodes.append(node)
        }
        
        for edge in edges {
            let fromNode = nodes[edge[0]]
            let toNode = nodes[edge[1]]
            
            fromNode.neighbors.append(toNode)
            toNode.neighbors.append(fromNode)
        }
        
        let startNode = nodes[start]
        let endNode = nodes[end]
        
        var visited = Set<GraphVertice>()
        var stack = [startNode]
        while !stack.isEmpty {
            let node = stack.removeLast()
            guard !visited.contains(node) else {
                continue
            }
            
            guard node != endNode else {
                return true
            }
            
            visited.insert(node)
            stack.append(contentsOf: node.neighbors)
        }
        
        return false
    }
    
    //Time: O(n)
    //Space: O(n) where n is the number of nodes in the `ranks` array
    //disjoint sets
    //
    //Solution Description:
    //Using union find connected the nodes into sets. If start and end exist in the same
    //set then they are connected otherwise they are not
    static func validPathDisjointSets(_ n: Int, _ edges: [[Int]], _ start: Int, _ end: Int) -> Bool {
        guard start != end else {
            return true
        }
        
        let unionFind = UnionFind(count: n)
        for edge in edges {
            unionFind.union(edge[0], edge[1])
        }
        
        return unionFind.find(start) == unionFind.find(end)
    }
}
