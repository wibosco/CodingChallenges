//
//  HouseRobberII.swift
//  LeetCode
//
//  Created by William Boles on 13/04/2023.
//

import Foundation

//https://leetcode.com/problems/house-robber-ii/
struct HouseRobberII {
    
    //Time: O(n) n is the number of elements in `nums`
    //Space: O(n)
    //array
    //graph theory
    //memoization
    //top-down
    //dynamic programming
    //DFS
    //recursive
    //dynamic vertices
    //
    //Solution Description:
    //Treating `nums` as a graph we can traverse the graph using DFS and determine the maximum path. The constraints on
    //movement within the graph is that we can not move from one node to it's immediate `nums` array neighbor (this includes
    //the end and end of `nums` as the houses wrap round)so a graph neighbor needs to be at least 2 array neighbors away.
    //It's important to point out that it can more than 2 neighbors away. To handle the issue caused by wrapping the start and
    //end houses we can omit them as nodes in the graph. So our DFS will occur on two subsets of `nums` -
    //`nums[..<(nums.count - 1)]` and `nums[1...]`. Using the DFS we start at either of our starting positions index 0 or
    //index 1 and form every possible premutation of `nums`, taking the maximum value at each node. To speed up the process we
    //use memoization to store the maximum value from a given node to the end of `nums` - this way we can avoid performing
    //repeated work.
    //
    //N.B. Memoization is a term describing an optimization technique where you cache previously computed results, and return
    //the cached result when the same computation is needed again.
    //
    //N.B. Dynamic programming can be thought of as local brute force.
    static func rob(_ nums: [Int]) -> Int {
        guard nums.count > 3 else {
            return nums.max()!
        }
        
        var prefixNumsMemo = [Int: Int]()
        var suffixNumsMemo = [Int: Int]()
        
        return max(dfs(nums, 0, (nums.count - 1), &prefixNumsMemo),
                   dfs(nums, 1, (nums.count - 1), &prefixNumsMemo),
                   dfs(nums, 1, nums.count, &suffixNumsMemo),
                   dfs(nums, 2, nums.count, &suffixNumsMemo))
    }
    
    private static func dfs(_ nums: [Int], _ start: Int, _ end: Int, _ memo: inout [Int: Int]) -> Int {
        guard start < end else {
            return 0
        }
        
        guard memo[start] == nil else {
            return memo[start]!
        }
        
        var maxValue = nums[start]
        
        let nextStart = start + 2
        guard nextStart < end else {
            return maxValue
        }
        
        for i in nextStart..<end {
            let value = dfs(nums, i, end, &memo) + nums[start]
            
            maxValue = max(maxValue, value)
        }
        
        memo[start] = maxValue
        
        return maxValue
    }
}
