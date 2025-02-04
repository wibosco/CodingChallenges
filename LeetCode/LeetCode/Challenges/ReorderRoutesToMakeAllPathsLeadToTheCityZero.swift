//
//  ReorderRoutesToMakeAllPathsLeadToTheCityZero.swift
//  LeetCode
//
//  Created by William Boles on 25/10/2023.
//

import Foundation

//https://leetcode.com/problems/reorder-routes-to-make-all-paths-lead-to-the-city-zero/
struct ReorderRoutesToMakeAllPathsLeadToTheCityZero {
    
    //Time: O(n) where n is the number of nodes in the graph
    //Space: O(n)
    //BFS
    //graph theory
    //n-ary tree
    //unweighted graph
    //adjacency list
    //visited
    //queue
    //iterative
    //directed graph
    //undirected graph
    //
    //Solution Description:
    //We need to treat this graph as both an undirected graph and a directed graph. Undirected for the purpose of finding
    //which nodes are connected to a given node (regardless of who is the source) - `neighbors`; directed for the purpose
    //of determining which connection needs to reordered - `adjList`. As this graph is actually an n-ary tree we know that
    //it won't contain any loops and that the graph won't be disconnected so don't need to handle those scenarios. First
    //we build both `neighbors` and `adjList` and using BFS we move through `neighbors`, as we know all nodes must have
    //path back to node `0` we seed our queue with the neighbors of node `0`. We then iterate through the queue adding
    //each node we encountered to the `visited` set so as not to search not search again. As we know all previous
    //iterations offer a path to node `0` if we discover that `node` is pointing away from it's predecessor (by checking
    //the `adjList`) we know that that path would need to change and we increment `changes`. After iterating through all
    //nodes in the graph we return `changes` as the result.
     func minReorder(_ n: Int, _ connections: [[Int]]) -> Int {
        var adjList = Array(repeating: Set<Int>(), count: n)
        var neighbors = Array(repeating: Set<Int>(), count: n)
    
        for connection in connections {
            let src = connection[0]
            let dst = connection[1]
            
            adjList[src].insert(dst)
            
            neighbors[src].insert(dst)
            neighbors[dst].insert(src)
        }
        
        var queue = [(Int, Int)]() //(from, node)
        for neighbor in neighbors[0] {
            queue.append((0, neighbor))
        }
        
        var visited = Set<Int>()
        visited.insert(0)
        
        var changes = 0
        
        while !queue.isEmpty {
            var newQueue = [(Int, Int)]()
            
            for (from, node) in queue {
                visited.insert(node)
                
                if !adjList[node].contains(from) {
                    changes += 1
                }
                
                for neighbor in neighbors[node] {
                    if !visited.contains(neighbor) {
                        newQueue.append((node, neighbor))
                    }
                }
            }
            
            queue = newQueue
        }
        
        return changes
    }
}
