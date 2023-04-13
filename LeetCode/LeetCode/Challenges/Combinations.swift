//
//  Combinations.swift
//  LeetCode
//
//  Created by William Boles on 17/03/2022.
//

import Foundation

//https://leetcode.com/problems/combinations/
//array
struct Combinations {
    
    //Time: O(k^n) where `k` is the number of combinations and n is the range
    //Space: O(k+m*n) where `k` is the number of combinations, m is the number of levels in our tree and n is the range
    //backtracking
    //
    //Solution Description:
    //Using backtracking we work through all the possible combinations from `1...n`. As we want combinations and permutations
    //order isn't important so `[1, 4]` an `[4, 1]` are considered the same. To avoid out-of-order duplicates when
    //backtracking we are careful to ensure that we are only ever using digits beyond the current digit.
    static func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var combinations = [[Int]]()
        
        backtrack(1, (n + 1), k, [Int](), &combinations)//counting from 1
        
        return combinations
    }
    
    private static func backtrack(_ left: Int, _ right: Int, _ limit: Int, _ current: [Int], _ combinations: inout [[Int]]) {
        guard current.count < limit else {
            combinations.append(current)
            return
        }
        
        for i in left..<right {
            backtrack((i + 1), right, limit, (current + [i]), &combinations) //(i + 1) as we don't to repeat the same value
        }
    }
}
