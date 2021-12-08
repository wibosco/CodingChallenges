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
        
        let unionFind = UnionFindCounting(count: n)
        for edge in edges {
            unionFind.union(edge[0], edge[1])
        }
        
        return unionFind.distinctSetsCount
    }
}
