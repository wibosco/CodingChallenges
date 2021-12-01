//
//  NumberConnectedComponentsUndirectedGraph.swift
//  CodingChallenges
//
//  Created by William Boles on 30/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/number-of-connected-components-in-an-undirected-graph/
//graph theory
struct NumberConnectedComponentsUndirectedGraph {
    
    //Time: O(n)
    //Space: O(n)
    //disjoint set
    //
    //Solution Description:
    //1. Using disjoint sets combine the nodes together using the
    //   edges array and count how many distinct sets there are
    static func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        guard !edges.isEmpty else {
            return n
        }
        
        let unionFind = UnionFind(count: n)
        for edge in edges {
            unionFind.union(edge[0], edge[1])
        }
        
        return unionFind.distinctSetCount
    }
}

//Union by rank
//see: https://www.youtube.com/watch?v=wU6udHRIkcc
//
//Solution Description:
//1. Each vertice is given an initial value of -1 to indicate
//   that they are there own root
//2. Perform a union between two vertices by finding the root
//   of each vertice (this will be a negative number). This root
//   may not be directly associated with the vertice but instead
//   require multiple steps hence the while loop in `find`
//3. Compare the size of the nodes assoicated with each vertices
//   root and select the root with the most nodes i.e. lowest
//   negative value. Update the smaller root to point at the other
//   root and update the other roots count to include the count that
//   the former root had
private class UnionFind {
    private(set) var distinctSetCount: Int
    private(set) var ranks: [Int]
    
    // MARK: - Init
    
    init(count: Int) {
        self.distinctSetCount = count
        ranks = Array(repeating: -1, count: count)
    }
    
    // MARK: - Operations
    
    func find(_ x: Int) -> Int {
        guard ranks[x] >= 0 else { // 0 is valid as an array index
            return x
        }
        ranks[x] = find(ranks[x]) //update ranks[x] to point nearer to the root of this set so speeding up finding
        return ranks[x]
    }
    
    func union(_ x: Int, _ y: Int) {
        let xRoot = find(x)
        let yRoot = find(y)
        
        guard xRoot != yRoot else {
            //x and y are already in the same set
            return
        }
        
        distinctSetCount -= 1 //merging two sets so reduce overall sets count by 1
        
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
