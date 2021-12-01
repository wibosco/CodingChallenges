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
    
    //Time: O(n^2) for the disjoint set
    //Space: O(n) for the `rank` array in `UnionFind`
    //disjoint set
    //
    //Solution Description:
    //1. A valid tree has one root and no cycles by using a disjoint set
    //   we can test for both conditions
    static func findCircleNum(_ isConnected: [[Int]]) -> Int {
        guard !isConnected.isEmpty else {
            return 0
        }
        
        let unionFind = UnionFind(count: isConnected.count)
        
        for (i, row) in isConnected.enumerated() {
            for (j, element) in row.enumerated() where ((i != j) && (element == 1)) {
                unionFind.union(x: i, y: j)
            }
        }
        
        return unionFind.distinctSetCount
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
    private(set) var distinctSetCount: Int
    private(set) var ranks: [Int]
    
    // MARK: - Init
    
    init(count: Int) {
        self.distinctSetCount = count
        ranks = Array(repeating: -1, count: count) //-1 means this index is it's own root
    }
    
    // MARK: - Find
    
    func find(_ x: Int) -> Int {
        guard ranks[x] >= 0 else { // 0 is valid as an array index
            return x
        }
        ranks[x] = find(ranks[x]) //update ranks[x] to point nearer to the root of this set so speeding up finding
        return ranks[x]
    }
    
    // MARK: - Union
    
    func union(x: Int, y: Int) {
        let xIndex = find(x)
        let yIndex = find(y)
        
        guard xIndex != yIndex else {
            //already in the same same set
            return
        }
        
        distinctSetCount -= 1 //merging two sets into one
        
        //Choose the index with the most nodes under it i.e. the lowest negative value
        if ranks[xIndex] <= ranks[yIndex] {
            let tmp = ranks[yIndex]
            ranks[yIndex] = xIndex
            ranks[xIndex] += tmp //increasing the value as this index, increases the rank of that root
        } else {
            let tmp = ranks[xIndex]
            ranks[xIndex] = yIndex
            ranks[yIndex] += tmp
        }
    }
    
    
    // MARK - Connected
    
    func connected(_ x: Int, _ y: Int) -> Bool {
        find(x) == find(y)
    }
}
