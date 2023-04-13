//
//  LongestIncreasingSubsequence.swift
//  LeetCode
//
//  Created by William Boles on 02/04/2023.
//

import Foundation

//https://leetcode.com/problems/longest-increasing-subsequence
//array
struct LongestIncreasingSubsequence {
    
    //Time: O(n^2) where n is the number of elements in `nums` (nested for loops)
    //Space: O(n)
    //graph theory
    //dynamic programming (bottom-up)
    //
    //Solution Description:
    //Treating `nums` as a graph, we traverse the graph and determine the longest possible incrementing subsequence by visiting
    //each node of that graph from every possible path backwards. By going backwards we ensure that the value at a given index in
    //`lis` is the largest subsquence count (from that index). So first we loop backwards to ensure that quickest route to that
    //count and then once we get to an index we take advantage of previously calculations to to loop forward through all possible
    //indexes that can be visited and extract the longest value - we add to this as the current node need is added to the
    //count.
    //
    //N.B. Dynamic programming can be thought of as local brute force.
    static func lengthOfLIS(_ nums: [Int]) -> Int {
        var lis = Array(repeating: 1, count: nums.count)
        
        for i in (0..<nums.count).reversed() {
            for j in i..<nums.count {
                if nums[i] < nums[j] { //as we are iterating backwards i needs to be smaller than j
                    lis[i] = max(lis[i], (lis[j] + 1))
                }
            }
        }
        
        return lis.max() ?? 0
    }
    
    //Time: O(n^2) where n is the number of elements in `nums` (nested for loops)
    //Space: O(n)
    //graph theory
    //DFS
    //recursive
    //memoization
    //dynamic programming (top down)
    //
    //Solution Description:
    //Treating `nums` as a graph, we traverse the graph and determine the longest possible incrementing subsequence by visiting
    //each node of that graph from every possible path in DFS manner. To avoid traversing paths that we have already travelled
    //down we use memoization to store the maxmimum incrementing subsequence from that node - due to traversing using DFS you
    //know that if a node as a memoization entry, that entry is the maximum.
    //
    //N.B. Memoization is a term describing an optimization technique where you cache previously computed results, and return
    //the cached result when the same computation is needed again.
    //
    //N.B. Dynamic programming can be thought of as local brute force.
    static func lengthOfLISMemoization(_ nums: [Int]) -> Int {
        var longest = 0
        var memo = [Int: Int]()
        
        for i in 0..<nums.count {
            let lengthFromI =  dfs(nums, (i + 1), nums[i], &memo) + 1 //add 1 for current node being added to count
            longest = max(longest, lengthFromI)
        }
        
        return longest
    }
    
    private static func dfs(_ nums: [Int], _ currentIndex: Int, _ num: Int, _ memo: inout [Int: Int]) -> Int {
        guard currentIndex < nums.count else {
            return 0
        }
        
        //check if we have already went down the `currentIndex` branch and can just return the result of the previous effort
        guard memo[currentIndex] == nil else {
            return memo[currentIndex]!
        }
        
        var longestFromCurrentIndex = 0
        for i in currentIndex..<nums.count {
            guard nums[i] > num else { //only interested in searching down an incrementing subsequence
                continue
            }
        
            let lengthFromI = dfs(nums, (i + 1), nums[i], &memo) + 1
            longestFromCurrentIndex = max(longestFromCurrentIndex, lengthFromI)
        }
        
        memo[currentIndex] = longestFromCurrentIndex
            
        return longestFromCurrentIndex
    }
    
    //Time: O(2^n) where n is the number of elements in `nums` (at each index we can choose to add that value to our count or not)
    //Space: O(n)
    //graph theory
    //DFS
    //recursive
    //
    //Solution Description:
    //Treating `nums` as a graph, we traverse the graph and determine the longest possible incrementing subsequence by visiting
    //each node of that graph from every possible path in DFS manner.
    static func lengthOfLISDFS(_ nums: [Int]) -> Int {
        var longest = 0
        
        for i in 0..<nums.count {
            dfs(nums, i, nums[i], 1, &longest)
        }
        
        return longest
    }
    
    private static func dfs(_ nums: [Int], _ currentIndex: Int, _ num: Int, _ currentLength: Int, _ longest: inout Int) {
        guard currentIndex < nums.count else {
            longest = max(longest, currentLength)
            return
        }
        
        for i in currentIndex..<nums.count {
            guard nums[i] > num else { //only interested in searching down an incrementing subsequence
                longest = max(longest, currentLength)
                continue
            }
            
            dfs(nums, i, nums[i], (currentLength + 1), &longest) 
        }
    }
}
