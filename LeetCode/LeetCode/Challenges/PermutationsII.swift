//
//  PermutationsII.swift
//  LeetCode
//
//  Created by William Boles on 10/03/2022.
//

import Foundation

//https://leetcode.com/problems/permutations-ii/
//array
struct PermutationsII {
    
    //Time: O(n*n!) where `n` is the number of elements in `nums`
    //Space: O(n!) stack frames
    //backtracking
    //DFS
    //n-ary tree
    //
    //Solution Description:
    //With permutations order is important so [1, 2, 3] is not the same as [3, 2, 1]. With this in mind we can use backtracking
    //to iterate through `nums` and produce every possible permutation of `nums`. As we don't want to reuse elements it is
    //important to remove the current elements from `nums` from the the next recursive call. Also as `nums` can contain
    //duplicates we need to be careful that we don't include the same array outcome but with different ordering (with regards
    //to the original `nums` ordering) so `permutations` is a set to avoid this
    static func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var permutations = Set<[Int]>()
        
        backtrack(nums, [Int](), &permutations)
        
        return Array(permutations)
    }
    
    private static func backtrack(_ nums: [Int], _ current: [Int], _ permutations: inout Set<[Int]>) {
        guard !nums.isEmpty else {
            permutations.insert(current)
            return
        }
        
        for i in 0..<nums.count {
            let num = nums[i]
            var subNums = nums
            subNums.remove(at: i)
            
            backtrack(subNums, (current + [num]), &permutations)
        }
    }
}
