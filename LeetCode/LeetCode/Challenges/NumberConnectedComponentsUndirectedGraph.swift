//
//  NumberConnectedComponentsUndirectedGraph.swift
//  LeetCode
//
//  Created by William Boles on 30/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/number-of-connected-components-in-an-undirected-graph/
struct NumberConnectedComponentsUndirectedGraph {
    
    //Time: O(v + e) where v is the number of vertices in the graph
    //               where e is the number of edges
    //Space: O(v + e)
    //graph theory
    //
    //Solution Description:
    //First we convert `edges` into an adjacency list to allow for quicker lookup time determining which vertices are visitable
    //from the current vertice. As this graph can be made up of multiple subgraphs we need to visit each vertice and visit all
    //connected vertices from it to ensure that we visit all possible subgraphs. We are using DFS to traverse each graph and
    //place all visited vertices in `visited` to ensure that we don't get caught in an infinite loop or we don't count the same
    //graph multiple times. When choosing whether to perform a BFS traversal we check if the root vertices has already been
    //visited - by checking it is in `visited`. If the root has been visited then we skip it; if it hasn't been visited we
    //traverse it and increment `count` at the end of that traversal.
    func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        var adjList = Array(repeating: [Int](), count: n)
        
        for edge in edges {
            let src = edge[0]
            let dst = edge[1]
            
            //undirected graph so need to add both paths
            adjList[src].append(dst)
            adjList[dst].append(src)
        }
        
        var count = 0
        var visited = Set<Int>()
        
        for i in 0..<n { //possibly multiple graphs in `edges` so need to search from each node
            guard !visited.contains(i) else {
                continue
            }
        
            visited.insert(i)
            
            dfs(i, adjList, &visited)
            
            count += 1
        }
        
        return count
    }
    
    private func dfs(_ vertice: Int, _ adjList: [[Int]], _ visited: inout Set<Int>) {
        for neighbor in adjList[vertice] {
            guard !visited.contains(neighbor) else {
                continue
            }
            
            visited.insert(neighbor)
            dfs(neighbor, adjList, &visited)
        }
    }
    
    //Time: O(v + e) where v is the number of vertices in the graph
    //               where e is the number of edges
    //Space: O(v + e)
    //graph theory
    //BFS
    //multi-source
    //visited
    //adjacency list
    //undirected
    //
    //Solution Description:
    //First we convert `edges` into an adjacency list to allow for quicker lookup time determining which vertices are visitable
    //from the current vertice. As this graph can be made up of multiple subgraphs we need to visit each vertice and visit all
    //connected vertices from it to ensure that we visit all possible subgraphs. We are using BFS to traverse each graph and
    //place all visited vertices in `visited` to ensure that we don't get caught in an infinite loop or we don't count the same
    //graph multiple times. When choosing whether to perform a BFS traversal we check if the root vertices has already been
    //visited - by checking it is in `visited`. If the root has been visited then we skip it; if it hasn't been visited we
    //traverse it and increment `count` at the end of that traversal.
    func countComponentsBFS(_ n: Int, _ edges: [[Int]]) -> Int {
        var adjList = Array(repeating: [Int](), count: n)
        
        for edge in edges {
            let src = edge[0]
            let dst = edge[1]
            
            //undirected graph so need to add both paths
            adjList[src].append(dst)
            adjList[dst].append(src)
        }
        
        var count = 0
        var visited = Set<Int>()
        
        var queue = [Int]()
        
        for i in 0..<n { //possibly multiple graphs in `edges` so need to search from each node
            guard !visited.contains(i) else {
                continue
            }
            
            queue.append(i)
            visited.insert(i)
            
            while !queue.isEmpty {
                var newQueueItems = [Int]()
                
                for node in queue {                    
                    for neighbor in adjList[node] {
                        guard !visited.contains(neighbor) else {
                            continue
                        }
                        
                        visited.insert(neighbor)
                        newQueueItems.append(neighbor)
                    }
                }
                
                queue = newQueueItems
            }
            
            count += 1
        }
        
        return count
    }
    
    //Time: O(e) where e is the number of edges
    //Space: O(v) where v is the number of vertices in the graph
    //graph theory
    //disjoint set
    //undirected graph
    //
    //Solution Description:
    //Using disjoint sets combine the nodes together using the edges array and count how many distinct sets there are
    func countComponentsDisjointSets(_ n: Int, _ edges: [[Int]]) -> Int {
        guard !edges.isEmpty else {
            return n
        }
        
        let unionFind = UnionFindCounting(count: n)
        for edge in edges {
            unionFind.union(edge[0], edge[1])
        }
        
        return unionFind.distinctSetsCount
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
//3. Compare the size of the nodes associated with each vertices root and select the root with the most nodes i.e. lowest negative
//   value. Update the smaller root to point at the other root and update the other roots count to include the count that the
//   former root had
private final class UnionFindCounting {
    var ranks: [Int]
    var distinctSetsCount: Int
    
    // MARK: - Init
    
    init(count: Int) {
        self.distinctSetsCount = count
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
    
    func union(_ x: Int, _ y: Int) { //O(1)
        let xRoot = find(x)
        let yRoot = find(y)
        
        guard xRoot != yRoot else {
            //x and y are already in the same set
            return
        }
        
        distinctSetsCount -= 1 //merging two sets so reduce overall sets count by 1
        
        //join the smaller graph with larger. If both are the same
        //size then favour `x`
        if ranks[xRoot] <= ranks[yRoot] {
            let tmp = ranks[yRoot]
            ranks[yRoot] = xRoot
            ranks[xRoot] += tmp //increasing the value as this index, increases the rank of that root
        } else {
            let tmp = ranks[xRoot]
            ranks[xRoot] = yRoot
            ranks[yRoot] += tmp
        }
    }
}
