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
        
        let unionFind = UnionFindCounting(count: isConnected.count)
        
        for (i, row) in isConnected.enumerated() {
            for (j, element) in row.enumerated() where ((i != j) && (element == 1)) {
                unionFind.union(i, j)
            }
        }
        
        return unionFind.distinctSetsCount
    }
}
