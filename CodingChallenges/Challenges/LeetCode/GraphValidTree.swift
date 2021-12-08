//
//  GraphValidTree.swift
//  CodingChallenges
//
//  Created by William Boles on 29/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/graph-valid-tree/
//graph theory
struct GraphValidTree {
        
    //Time: O(n) where n is edges
    //Space: O(n) where n is the nodes
    //disjoint set
    //
    //Solution Description:
    //1. A valid tree has one root (all nodes need to be connected) and no cycles
    //   by using a disjoint set we can test for both conditions. First a check is
    //   made to ensure that edges are not too few or too many and then a check is
    //   that connecting the nodes together does not result in a cycle
    static func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        //For the graph to be a valid tree, it must have exactly `n - 1` edges.
        //Any less, and it can't possibly be fully connected. Any more, and
        //it has to contain cycles.
        guard edges.count == (n - 1) else {
            return false
        }
        
        let disjointSet = UnionFind(count: n)
        
        for edge in edges {
            if !disjointSet.union(edge[0], edge[1]) {
                return false //a cycle was found so this can't be a valid tree
            }
        }
        
        return true
    }
}
