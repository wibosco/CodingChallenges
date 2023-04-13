//
//  Permutations.swift
//  LeetCode
//
//  Created by William Boles on 10/03/2022.
//

import Foundation

//https://leetcode.com/problems/permutations/
//array
struct Permutations {
    
    //Time: O(n*n!) where n is the number of elements in `nums`
    //Space: O(n!) stack frames
    //backtracking
    //DFS
    //n-ary tree
    //
    //Solution Description:
    //With permutations order is important so [1, 2, 3] is not the same as [3, 2, 1]. With this in mind we can use backtracking
    //to iterate through `nums` and produce every possible permutation of `nums`. As we don't want repeating elements it is
    //important to remove the current elements from `nums` so that it can't be used in the next recursive call.
    //
    //Similar to: https://leetcode.com/problems/combination-sum/
    //Similar to: https://leetcode.com/problems/subsets/
    static func permute(_ nums: [Int]) -> [[Int]] {
        var permutations = [[Int]]()
        
        backtrack(nums, [Int](), &permutations)
        
        return permutations
    }
    
    private static func backtrack(_ nums: [Int], _ current: [Int], _ permutations: inout [[Int]]) {
        guard !nums.isEmpty else {
            permutations.append(current)
            return
        }
        
        for i in 0..<nums.count {
            let num = nums[i]
            var subNums = nums
            subNums.remove(at: i) //don't want to repeat `nums[i]` in `current`
            
            backtrack(subNums, (current + [num]), &permutations)
        }
    }
    
    //Time: O(n*n!) where n is the number of elements in `nums`
    //Space: O(n!) stack frames
    //backtracking
    //DFS
    //n-ary tree
    //
    //Solution Description:
    //With permutations order is important so [1, 2, 3] is not the same as [3, 2, 1]. With this in mind we can use backtracking
    //to iterate through `nums` and produce every possible permutation of `nums`. As we don't want repeating elements it is
    //important to check if the element of current iteration of `nums` is already in the `current` array and skip it.
    //
    //Similar to: https://leetcode.com/problems/combination-sum/
    //Similar to: https://leetcode.com/problems/subsets/
    static func permuteContains(_ nums: [Int]) -> [[Int]] {
        var permutations = [[Int]]()
        
        backtrackContains(nums, [Int](), &permutations)
        
        return permutations
    }
    
    private static func backtrackContains(_ nums: [Int], _ current: [Int], _ permutations: inout [[Int]]) {
        guard current.count < nums.count else {
            permutations.append(current)
            return
        }
        
        for num in nums {
            guard !current.contains(num) else { //don't want to repeat `num` in `current`
                continue
            }
            
            backtrackContains(nums, (current + [num]), &permutations)
        }
    }
}
