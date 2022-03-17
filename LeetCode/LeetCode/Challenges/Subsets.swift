//
//  Subsets.swift
//  LeetCode
//
//  Created by William Boles on 17/03/2022.
//

import Foundation

//https://leetcode.com/problems/subsets/
//array
struct Subsets {
    
    //Time: O(2^n) where `n` is the number of elements in `nums`
    //Space: O(k+m*n) where `k` is the number of subsets, `m` is the number of levels in our tree and `n` current subset
    //backtracking
    //
    //Solution Description:
    //
    static func subsets(_ nums: [Int]) -> [[Int]] {
        var subsets = [[Int]]()
        
        backtrack(nums, 0, [Int](), &subsets)
        
        return subsets
    }
    
    private static func backtrack(_ nums: [Int], _ left: Int, _ current: [Int], _ subsets: inout [[Int]]) {
        subsets.append(current)
        
        guard left < nums.count else {
            return
        }
        
        for i in left..<nums.count {
            let num = nums[i]
            backtrack(nums, (i + 1), (current + [num]), &subsets)
        }
    }
}
