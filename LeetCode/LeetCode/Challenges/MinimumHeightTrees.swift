//
//  MinimumHeightTrees.swift
//  LeetCode
//
//  Created by William Boles on 05/04/2023.
//

import Foundation

//https://leetcode.com/problems/minimum-height-trees/
//n-ary tree
struct MinimumHeightTrees {
    
    //Time: O(n+e) where `n` is the number of nodes, `e` is the number of edges
    //Space: O(n+e) where `n` is the number of nodes, `e` is the number of edges
    //graph theory
    //adjacency list
    //visited
    //undirected graph
    //
    //Solution Description:
    //First we convert the edges into an adjacency list to allows for O(1) access time. Rather than selecting
    //multiple roots and working down the tree to determine which is the minimum we instead flip it and
    //work up the tree from the leaf nodes. Bootom-up ensures that we graudally prune the tree of nodes in a
    //level by level fashion and as a new leaf node can only be created from a pruned node we are able to
    //easily generate the next leaf nodes at each level. Eventually we end up with either 1 or 2 nodes at the
    //top that are the roots for the minimum tree.
    static func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        guard n > 1 else {
            return [0]
        }
        
        var adjList = Array(repeating: Set<Int>(), count: n)
        
        for edge in edges {
            let n1 = edge[0]
            let n2 = edge[1]
            
            //undirected graph so need to add both paths
            adjList[n1].insert(n2)
            adjList[n2].insert(n1)
        }
            
        var leafNodes = [Int]()
        var count = n
        
        //find initial leaf nodes
        for i in 0..<count {
            if adjList[i].count == 1 {
                leafNodes.append(i)
            }
        }
        
        while count > 2 { //a minimum height tree will have at most 2 nodes of equal height
            var nextLeafNodes = [Int]()
            
            for leafNode in leafNodes {
                let parentNode = adjList[leafNode].first!
                adjList[parentNode].remove(leafNode)
                
                if adjList[parentNode].count == 1 { //only the parent nodes can become the next leaf nodes
                    nextLeafNodes.append(parentNode)
                }
            }
            
            count -= leafNodes.count
            leafNodes = nextLeafNodes
        }
        
        return leafNodes
    }
    
    //Time: O(n^2 + e) where `n` is the number of nodes, `e` is the number of edges
    //Space: O(n+e) where `n` is the number of nodes, `e` is the number of edges
    //graph theory
    //BFS
    //adjacency list
    //visited
    //undirected graph
    //multi-source
    //
    //Solution Description:
    //First we convert the edges into an adjacency list to allows for O(1) access time. Then treating each
    //node as the potential root of the minimum tree we perform a BFS to the longest leaf node. We count
    //each level of that BFS and then compare that with the current minimum height encountered so far; if
    //it's lower or equal we replace it; if higher we skip on. The height of each tree is stored in
    //`treeHeights` to allow for easy retrieval of the minimum height once all sources have been checked.
    static func findMinHeightTreesBFS(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var adjList = Array(repeating: [Int](), count: n)
        
        for edge in edges {
            let n1 = edge[0]
            let n2 = edge[1]
            
            //undirected graph so need to add both paths
            adjList[n1].append(n2)
            adjList[n2].append(n1)
        }
        
        var treeHeights = [Int: [Int]]()
        var minTreeHeight = Int.max
            
        for source in 0..<n {
            var visited = Set<Int>()
            
            var queue = [source]
            visited.insert(source)
            var level = 0
            
            while !queue.isEmpty {
                var nextQueue = [Int]()
                for node in queue {
                    let neighbors = adjList[node]
                    
                    for neighbor in neighbors {
                        guard !visited.contains(neighbor) else {
                            continue
                        }
                        
                        visited.insert(neighbor)
                        nextQueue.append(neighbor)
                    }
                }

                level += 1
                
                guard level <= minTreeHeight else {
                    break
                }
                
                queue = nextQueue
            }
            
            treeHeights[level, default: []].append(source)
            minTreeHeight = min(minTreeHeight, level)
        }
        
        return treeHeights[minTreeHeight] ?? []
    }
}
