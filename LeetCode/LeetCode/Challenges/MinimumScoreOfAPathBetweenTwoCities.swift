//
//  MinimumScoreOfAPathBetweenTwoCities.swift
//  LeetCode
//
//  Created by William Boles on 31/10/2023.
//

import Foundation

//https://leetcode.com/problems/minimum-score-of-a-path-between-two-cities/
struct MinimumScoreOfAPathBetweenTwoCities {
    
    //Time: O(n + e) where n is the number of nodes in the graph,
    //               where e is the number of edges in the graph
    //Space: O(n)
    //graph theory
    //weighted graph
    //BFS
    //iterative
    //visited
    //set
    //adjacency list
    //undirected graph
    //directed graph
    //disconnected graph
    //forest
    //
    //Solution Description:
    //First we convert `roads` into an adjacency list, as the road is two-way (graph is undirected) we add both paths to 
    //`adjList`. As this graph can contain multiple disconnected subgraphs we can't just take the smallest weight we
    //encounter as we don't know it's in the subgraph containing node 0 and node n. Using BFS we traversal all nodes
    //connected to node 0 (which will include node n) and store the smallest weight we find in `minWeight`. As this graph
    //contains loops to avoid searching the same path multiple times we store a used path in a `visited` set. Once all
    //paths/nodes connected to node 0 have been search we return `minWeight.`
    static func minScore(_ n: Int, _ roads: [[Int]]) -> Int {
        var adjList = Array(repeating: [[Int]](), count: n)
        for road in roads {
            let src = road[0] - 1
            let dst = road[1] - 1
            let weight = road[2]
            
            adjList[src].append([dst, weight])
            adjList[dst].append([src, weight])
        }
        
        var visited = Set<[Int]>()
        var minWeight = Int.max
        
        var queue = [Int]()
        queue.append(0)
        
        while !queue.isEmpty {
            var nextIteration = [Int]()
            
            for node in queue {
                for neighbor in adjList[node] {
                    let to = neighbor[0]
                    let weight = neighbor[1]
                    
                    guard !visited.contains([node, to]), !visited.contains([to, node]) else {
                        continue
                    }
                    //the node->to and to->node are the same weight so if we check one path we've
                    //checked the other path so lets just store both
                    visited.insert([node, to])
                    visited.insert([to, node])
                    
                    minWeight = min(minWeight, weight)
                    
                    nextIteration.append(to)
                }
            }
            
            queue = nextIteration
        }
        
        return minWeight
    }
}
