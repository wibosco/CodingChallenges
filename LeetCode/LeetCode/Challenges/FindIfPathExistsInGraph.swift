//
//  FindIfPathExistsInGraph.swift
//  LeetCode
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
    //undirected graph
    //
    //Solution Description:
    //Build an adjacency list containing all the connections from a node/vertice to other nodes/vertices. Check that both start
    //and end nodes actually have connections. Then traverse the graph in the BFS manner, stopping only when the `end` is found
    //or there are no more edges in the graph that contains `start`.
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
            var newQueueItems = [Int]()
            
            for node in queue {
                guard !visited.contains(node) else {
                    continue
                }
                
                guard node != end else {
                    return true
                }
                
                visited.insert(node)
                newQueueItems.append(contentsOf: adjList[node])
            }
            
            queue = newQueueItems
        }
        
        return false
    }
    
    //Time: O(n + e) where n is the number of nodes and e is the number of edges
    //Space: O(n) where n is the number of nodes
    //DFS
    //adjacency list
    //undirected graph
    //
    //Solution Description:
    //Build an adjacency list containing all the connections from a node/vertice to other nodes/vertices. Check that both start
    //and end nodes actually have connections. Then traverse the graph in the DFS manner, stopping only when the `end` is found
    //or there are no more edges in the graph that contains `start`.
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
    //undirected graph
    //
    //Solution Description:
    //Build an array of nodes and then connect them using the array index as the edges index. Then traverse the graph in the DFS
    //manner, stopping only when the `end` is found or there are no more edges in the graph that contains `start`.
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
    //union find
    //disjoint sets
    //undirected graph
    //
    //Solution Description:
    //Using union find connected the nodes into sets. If start and end exist in the same set then they are connected otherwise
    //they are not
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

//Union-by-rank/disjoint set
//See: https://www.youtube.com/watch?v=wU6udHRIkcc
//
//Can only be applied on undirected graphs
//
//Solution Description:
//1. Each vertice is given an initial value of -1 to indicate that they are their own root
//2. Perform a union between two vertices by finding the root of each vertice (this will be a negative number). This root may not
//   be directly associated with the vertice but instead require multiple steps hence the while loop in `find`
//3. Compare the size of the nodes assoicated with each vertices root and select the root with the most nodes i.e. lowest negative
//   value. Update the smaller root to point at the other root and update the other roots count to include the count that the
//   former root had
private final class UnionFind {
    private(set) var ranks: [Int]
    
    // MARK: - Init
    
    init(count: Int) {
        ranks = Array(repeating: -1, count: count)
    }
    
    // MARK: - Operations
    
    func find(_ x: Int) -> Int { //O(1)
        guard ranks[x] >= 0 else { // 0 is valid as an array index
            return x
        }
        ranks[x] = find(ranks[x]) //update ranks[x] to point nearer to the root of this set so speeding up finding
        return ranks[x]
    }
    
    @discardableResult
    func union(_ x: Int, _ y: Int) -> Bool { //O(1)
        let xRoot = find(x)
        let yRoot = find(y)
        
        guard xRoot != yRoot else {
            //x and y are already in the same set, so performing
            //this union will result in introducing a cycle into
            //this graph.
            return false
        }
        
        //join the smaller graph with larger. If both are the same
        //size then favour `x`
        if ranks[xRoot] <= ranks[yRoot] { //careful with the comparison as the larger root has a smaller value (due to being negative)
            let tmp = ranks[yRoot]
            ranks[yRoot] = xRoot
            ranks[xRoot] += tmp //increasing the value as this index, increases the rank of that root
        } else {
            let tmp = ranks[xRoot]
            ranks[xRoot] = yRoot
            ranks[yRoot] += tmp //increasing the value as this index, increases the rank of that root
        }
        
        return true
    }
    
    func connected(_ x: Int, _ y: Int) -> Bool {
        return find(x) == find(y)
    }
}
