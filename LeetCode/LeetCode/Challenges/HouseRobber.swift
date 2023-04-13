//
//  HouseRobber.swift
//  LeetCode
//
//  Created by William Boles on 13/04/2023.
//

import Foundation

//https://leetcode.com/problems/house-robber/
//array
struct HouseRobber {
    
    //Time: O(n) n is the number of elements in `nums`
    //Space: O(n)
    //graph theory
    //memoization
    //dynamic programming (top down)
    //DFS
    //recursive
    //dynamic vertices
    //
    //Solution Description:
    //Treating `nums` as a graph we can traverse the graph using DFS and determine the maximum path. The only constraint on
    //movement within the graph is that we can not move from one node to it's immediate `nums` array neighbor so a graph
    //neighbor needs to be at least 2 array neighbors away. It's important to point out that it can more than 2 neighbors
    //away. So using the DFS we start at either of our starting positions index 0 or index 1 and form every possible
    //premutation of `nums`, taking the maximum value at each node. The speed up the process we use memoization to store the
    //maximum value from a given node to the end of `nums` - this way we can avoid performing repeated work.
    //
    //N.B. Memoization is a term describing an optimization technique where you cache previously computed results, and return
    //the cached result when the same computation is needed again.
    //
    //N.B. Dynamic programming can be thought of as local brute force.
    static func rob(_ nums: [Int]) -> Int {
        guard nums.count > 2 else {
            return nums.max()!
        }
        
        var memo = [Int: Int]()
        
        return max(dfs(nums, 0, &memo), dfs(nums, 1, &memo))
    }
    
    private static func dfs(_ nums: [Int], _ start: Int, _ memo: inout [Int: Int]) -> Int {
        guard start < nums.count else {
            return 0
        }
        
        guard memo[start] == nil else {
            return memo[start]!
        }
        
        let nextStart = (start + 2)
        guard nextStart < nums.count else {
            return nums[start]
        }
        
        var maxValue = nums[start]
        
        for i in nextStart..<nums.count {
            let value = dfs(nums, i, &memo) + nums[start]
            
            maxValue = max(maxValue, value)
        }
        
        memo[start] = maxValue
        
        return maxValue
    }
}
