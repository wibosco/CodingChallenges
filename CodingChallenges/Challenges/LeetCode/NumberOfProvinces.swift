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
//disjoint set
struct NumberOfProvinces {
    
    //Time: O(n) due to the `reduce` otherwise O(log n) for the disjoint set
    //Space: O(n) for the `rank` array in `UnionFind`
    //
    //Solution Description:
    //1. A valid tree has one root and no cycles by using a disjoint set
    //   we can test for both conditions
    static func findCircleNum(_ isConnected: [[Int]]) -> Int {
        guard !isConnected.isEmpty else {
            return 0
        }
        
        let disjointSet = UnionFind(count: isConnected.count)
        
        for (i, row) in isConnected.enumerated() {
            for (j, element) in row.enumerated() where ((i != j) && (element == 1)) {
                disjointSet.union(x: i, y: j)
            }
        }
        
        return disjointSet.rank.reduce(0) {
            return $1 < 0 ? $0 + 1 : $0
        }
    }
}

//Union by rank
//see: https://www.youtube.com/watch?v=wU6udHRIkcc
//Solution description
//
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
    private(set) var rank: [Int]
    
    // MARK: - Init
    
    init(count: Int) {
        rank  = Array(repeating: -1, count: count) //-1 means this index is it's own root
    }
    
    // MARK: - Find
    
    func find(_ x: Int) -> Int {
        var x = x
        while rank[x] >= 0 { // 0 is valid as an array index
            x = rank[x]
        }
        
        return x
    }
    
    // MARK: - Union
    
    func union(x: Int, y: Int) {
        let xIndex = find(x)
        let yIndex = find(y)
        
        guard xIndex != yIndex else {
            //already in the same same set
            return
        }
        
        //Choose the index with the most nodes under it i.e. the lowest negative value
        if rank[xIndex] <= rank[yIndex] {
            let tmp = rank[yIndex]
            rank[yIndex] = xIndex
            rank[xIndex] += tmp //increasing the value as this index, increases the rank of that root
        } else {
            let tmp = rank[xIndex]
            rank[xIndex] = yIndex
            rank[yIndex] =  tmp
        }
    }
    
    
    // MARK - Connected
    
    func connected(_ x: Int, _ y: Int) -> Bool {
        find(x) == find(y)
    }
}
