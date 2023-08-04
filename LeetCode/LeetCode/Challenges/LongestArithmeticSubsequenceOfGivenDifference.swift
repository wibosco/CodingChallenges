//
//  LongestArithmeticSubsequenceOfGivenDifference.swift
//  LeetCode
//
//  Created by William Boles on 14/07/2023.
//

import Foundation

//https://leetcode.com/problems/longest-arithmetic-subsequence-of-given-difference/
struct LongestArithmeticSubsequenceOfGivenDifference {
    
    //Time: O(
    //Space: O(
    //subsequence
    //array
    //
    static func longestSubsequence(_ arr: [Int], _ difference: Int) -> Int {
        var dp = [Int: Int]()
        var longestLength = 1
        
        for a in arr {
            let previousElementToA = a - difference
            let lengthToPrevious = dp[previousElementToA, default: 0]
            let lengthToA = lengthToPrevious + 1
            dp[a] = lengthToA
            
            longestLength = max(longestLength, lengthToA)
        }
        
        return longestLength
    }
    
    //Time: O(
    //Space: O(
    //array
    //subsequence
    //memoization
    //dynamic programming
    //DFS
    //recursive
    //
    //Solution Description:
    //
    static func longestSubsequenceMemo(_ arr: [Int], _ difference: Int) -> Int {
        var longestLength = 1
        var memo = [Int: Int]()
        
        for i in 0..<arr.count {
            let lengthFromI = dfs(arr, difference, i, &memo) + 1
            longestLength = max(longestLength, lengthFromI)
        }
        
        return max(longestLength, 1)
    }
    
    private static func dfs(_ arr: [Int], _ difference: Int, _ currentIndex: Int, _ memo: inout [Int: Int]) -> Int {
        guard currentIndex < arr.count else {
            return 1
        }
        
        guard memo[currentIndex] == nil else {
            return memo[currentIndex]!
        }
        
        var longestFromCurrentIndex = 0
        for i in (currentIndex + 1)..<arr.count {
            guard (arr[currentIndex] + difference) == arr[i] else {
                continue
            }
            
            let lengthFromI = dfs(arr, difference, i, &memo) + 1
            longestFromCurrentIndex = max(longestFromCurrentIndex, lengthFromI)
        }
        
        memo[currentIndex] = longestFromCurrentIndex
        
        return longestFromCurrentIndex
    }
}
