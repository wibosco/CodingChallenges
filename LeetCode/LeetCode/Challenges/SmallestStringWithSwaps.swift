//
//  SmallestStringWithSwaps.swift
//  CodingChallenges
//
//  Created by William Boles on 30/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/smallest-string-with-swaps/
//graph theory
struct SmallestStringWithSwaps {
    
    //Time: O(n log n) where n is the number of pairs
    //Space: O(n) where n is the number of pairs
    //disjoint set
    //
    //Solution Description:
    //1. Using disjoint set build up a set of possible values for any of `s` indexes.
    //   This is needed because the swaps that can occur can interact with each other
    //2. Assign the actual character value to each of those groups
    //3, Sort each group to enusre that the smallest value character is first
    //4. Iterate through `s` changing the character at any given index for the smallest
    //   in the group (for that index)
    static func smallestStringWithSwaps(_ s: String, _ pairs: [[Int]]) -> String {
        guard s.count != 1 else {
            return s
        }
        
        //build the sets
        let unionFind = UnionFind(count: s.count)
        for pair in pairs {
            unionFind.union(pair[0], pair[1])
        }
        
        //assign characters to groups/sets based on their index
        let characters = Array(s)
        var groups = [Int: [Character]]()
        for (i, character) in characters.enumerated() {
            //important to note that we only care about the root of i so `groups` can end up
            //being siggnifcantly smaller than s.count
            let root = unionFind.find(i)
            groups[root, default: [Character]()].append(character)
        }
        
        //sort so that smallest character is first
        for (key, _) in groups {
            groups[key]?.sort()
        }
        
        var smallest = [Character]()
        
        //build up `smallest` by remove smallest character from group and assigning ti
        //to the next Most-significant-index of the string
        for i in 0..<s.count {
            let root = unionFind.find(i)
            smallest.append(groups[root]!.removeFirst())
        }
        
        return String(smallest)
    }
}

//Union-by-rank/disjoint set
//See: https://www.youtube.com/watch?v=wU6udHRIkcc
//
//Can only be applied on undirected graphs
//
//Solution Description:
//1. Each vertice is given an initial value of -1 to indicate
//   that they are their own root
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
    private(set) var ranks: [Int]
    
    // MARK: - Init
    
    init(count: Int) {
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
    
    @discardableResult
    func union(_ x: Int, _ y: Int) -> Bool { //O(1)
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
        if ranks[xRoot] <= ranks[yRoot] { //careful with the comparison here as the larger root has a smaller value (due to being negative)
            let tmp = ranks[yRoot]
            ranks[yRoot] = xRoot
            ranks[xRoot] += tmp //increasing the value as this index, increases the rank of that root
        } else {
            let tmp = ranks[xRoot]
            ranks[xRoot] = yRoot
            ranks[yRoot] += tmp //increasing the value as this index, increases the rank of that root
        }
        
        return true
    }
    
    func connected(_ x: Int, _ y: Int) -> Bool {
        return find(x) == find(y)
    }
}
