//
//  OptimalPartitionOfString.swift
//  LeetCode
//
//  Created by William Boles on 16/07/2023.
//

import Foundation

//https://leetcode.com/problems/optimal-partition-of-string/
//array
struct OptimalPartitionOfString {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(1) `partitionSeen` will only every contain at most 26 elements (English Alphabet)
    //greedy
    //
    //Solution Description:
    //Taking a greedy approach to find partitions we iterate through `s` storing each character we encounter in the `partitionSeen`
    //set. If that character already exists in `partitionSeen` then we have encounted another partition and we increment
    //`partitions`. We repeat this process until all characters of `s` have been processed.
    //
    //N.B. `paritions` starts at 1 to ensure that we count the final partition without having to add conditional into or after the
    //loop.
    static func partitionString(_ s: String) -> Int {
        var partitionSeen = Set<Character>()
        var partitions = 1
        
        for c in s {
            if partitionSeen.contains(c) {
                partitionSeen.removeAll()
                
                partitions += 1
            }
            
            partitionSeen.insert(c)
        }
        
        return partitions
    }
}
