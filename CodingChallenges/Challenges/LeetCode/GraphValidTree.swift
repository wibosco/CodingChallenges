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
//4. If when attempting to union two nodes we discover they already
//   share a root then that union will create a cycle
private class UnionFind {
    private(set) var ranks: [Int]
    
    // MARK: - Init
    
    init(count: Int) {
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
    
    func union(_ x: Int, _ y: Int) -> Bool {
        let xRoot = find(x)
        let yRoot = find(y)
        
        guard xRoot != yRoot else {
            //x and y are already in the same set, so performing
            //this union will result in introducing a cycle into
            //this graph.
            return false
        }
        
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
        
        return true
    }
}
