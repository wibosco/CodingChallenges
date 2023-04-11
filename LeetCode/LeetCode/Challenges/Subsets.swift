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
    
    //Time: O(2^n) `n` is the number of elements in `nums`
    //Space: O(k+m*n) where `k` is the number of subsets, `m` is the number of levels in our tree and `n` current subset
    //backtracking
    //recursive
    //DFS
    //graph theory
    //n-ary tree
    //
    //Solution Description:
    //To generate every possible subset we need to be always moving "forward" with `nums` and adding each array that we
    //build to `subsets` (note that unlike combinations or permutations we don't wait to reach "x" before adding the
    //current to `subset`, we add any length of `current` to subsets). We use backtracking to ensure that all possible
    //combinations are generated and to ensure we are always moving forward we track the starting index of the previous
    //iteration and ensure that we only use elements to the right of that index.
    //
    //Similar to: https://leetcode.com/problems/combination-sum/
    //Similar to: https://leetcode.com/problems/permutations/
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
