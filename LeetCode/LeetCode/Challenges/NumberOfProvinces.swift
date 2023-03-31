//
//  NumberOfProvinces.swift
//  CodingChallenges
//
//  Created by William Boles on 29/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/number-of-provinces/
//graph theory
struct NumberOfProvinces {
    
    //Time: O(n^2) where n is the number of elements in `isConnected`
    //Space: O(n)
    //DFS
    //visited
    //adjacency matrix
    //visited
    //muliti-source
    //undirected
    //
    //Solution Description:
    //As this graph could contain graphs we need to treat each vertice as the possible start of a new subgraph. So we iterate
    //through each vertice in the graph and traverse it's graph using DFS. To ensure that we don't search the same graph
    //multiple times (from different starting vertices) or get caught in an infinite loop, each vertice we encounter we place
    //in the `visited` set. At the end of each DFS traversal we increment `count`.
    static func findCircleNum(_ isConnected: [[Int]]) -> Int {
        var visited = Set<Int>()
        var count = 0
        
        for i in 0..<isConnected.count {
            guard !visited.contains(i) else { //already seen `i` so skip it
                continue
            }
            
            visited.insert(i)
            
            dfs(i, isConnected, &visited)
            
            count += 1
        }
        
        return count
    }
    
    private static func dfs(_ src: Int, _ adjMatrix: [[Int]], _ visited: inout Set<Int>) {
        for dst in 0..<adjMatrix[src].count {
            guard adjMatrix[src][dst] == 1 else { //`1` indicates that there is an edge between these two vertices
                continue
            }
            
            guard !visited.contains(dst) else {
                continue
            }
            
            visited.insert(dst) //as this matrix is square, `src` and `dst` are interchangable
            dfs(dst, adjMatrix, &visited)
        }
    }
    
    //Time: O(n^2) where n is the number of elements in `isConnected`
    //Space: O(n)
    //BFS
    //visited
    //adjacency matrix
    //visited
    //muliti-source
    //undirected
    //
    //Solution Description:
    //As this graph could contain graphs we need to treat each vertice as the possible start of a new subgraph. So we iterate
    //through each vertice in the graph and traverse it's graph using BFS. To ensure that we don't search the same graph
    //multiple times (from different starting vertices) or get caught in an infinite loop, each vertice we encounter we place
    //in the `visited` set. At the end of each BFS traversal we increment `count`.
    static func findCircleNumBFS(_ isConnected: [[Int]]) -> Int {
        var visited = Set<Int>()
        var queue = [Int]()
        var count = 0
        
        for i in 0..<isConnected.count { //multiple sources
            guard !visited.contains(i) else { //already seen `i` so skip it
                continue
            }
            
            visited.insert(i)
            queue.append(i)
            
            while !queue.isEmpty {
                let src = queue.removeFirst()
                
                for dst in 0..<isConnected[src].count {
                    guard isConnected[src][dst] == 1 else { //`1` indicates that there is an edge between these two vertices
                        continue
                    }
                    
                    guard !visited.contains(dst) else {
                        continue
                    }
                    
                    visited.insert(dst) //as this matrix is square, `src` and `dst` are interchangable
                    queue.append(dst)
                }
            }
            
            count += 1
        }
        
        return count
    }
    
    //Time: O(n^2) for the disjoint set
    //Space: O(n) for the `rank` array in `UnionFind`
    //disjoint set
    //
    //Solution Description:
    //A valid tree has one root and no cycles by using a disjoint set we can test for both conditions
    static func findCircleNumDisjointSet(_ isConnected: [[Int]]) -> Int {
        guard !isConnected.isEmpty else {
            return 0
        }
        
        let unionFind = UnionFindCounting(count: isConnected.count)
        
        for (i, row) in isConnected.enumerated() {
            for (j, element) in row.enumerated() where ((i != j) && (element == 1)) {
                unionFind.union(i, j)
            }
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
//3. Compare the size of the nodes assoicated with each vertices root and select the root with the most nodes i.e. lowest negative
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
