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
