//
//  TargetSum.swift
//  LeetCode
//
//  Created by William Boles on 15/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/target-sum/
//graph theory
struct TargetSum {
    
    //Time: O(2^n) `n` is the number of elements in `nums`
    //Space: O(n)
    //DFS
    //dynamic vertices
    //
    //Solution Description:
    static func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        var count = 0
        
        dfs(nums, 1, target, nums[0], &count)
        dfs(nums, 1, target, -nums[0], &count)
        
        return count
    }
    
    private static func dfs(_ nums: [Int], _ index: Int, _ target: Int, _ total: Int, _ count: inout Int) {
        guard index != nums.count else {
            if total == target {
                count += 1
            }
            
            return
        }
        
        // possible branches: `+` and `-`
        
        let val = nums[index]
        
        dfs(nums, index + 1, target, (total + val), &count)
        dfs(nums, index + 1, target, (total - val), &count)
    }
}
