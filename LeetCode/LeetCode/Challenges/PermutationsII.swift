//
//  PermutationsII.swift
//  LeetCode
//
//  Created by William Boles on 10/03/2022.
//

import Foundation

//https://leetcode.com/problems/permutations-ii/
struct PermutationsII {
    
    //Time: O(n * n!) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //DFS
    //backtracking
    //n-ary tree
    //
    //Solution Description:
    //With permutations order is important so [1, 2, 3] is not the same as [3, 2, 1]. With this in mind we can use backtracking
    //to iterate through `nums` and produce every possible permutation of `nums`. As we don't want to reuse elements it is
    //important to remove the current elements from `nums` from the the next recursive call - rather than actually remove the
    //element from `nums`, we convert `nums` into a character frequency dictionary and then simply decrement and increment the
    //frequency as we use a num or backtrack from using a num. Also as `nums` can contain duplicates we need to be careful that
    //we don't include the same array outcome but with different ordering (with regards to the original `nums` ordering) so
    //`permutations` is a set to avoid this
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var permutations = Set<[Int]>()
        var frequency = [Int: Int]()
        
        for num in nums { //allow for easy addition and removal of `nums` elements as we backtrack
            frequency[num, default: 0] += 1
        }
        
        var permutation = [Int]()
        
        backtrack(&frequency, nums.count, &permutation, &permutations)
        
        return Array(permutations)
    }
    
    private func backtrack(_ nums: inout [Int: Int], _ targetLength: Int, _ permutation: inout [Int], _ permutations: inout Set<[Int]>) {
        guard permutation.count < targetLength else {
            permutations.insert(permutation)
            return
        }
        
        for (key, value) in nums {
            guard value > 0 else {
                continue
            }
            
            nums[key] = (value - 1)
            permutation.append(key)
            
            backtrack(&nums, targetLength, &permutation, &permutations)
            
            permutation.removeLast()
            nums[key] = value //no need for -1 as we are `value` is already +1 to nums[key] du
        }
    }
    
    //Time: O(n * n!) where n is the number of elements in `nums`
    //Space: O(n) stack frames
    //array
    //DFS
    //backtracking
    //n-ary tree
    //
    //Solution Description:
    //With permutations order is important so [1, 2, 3] is not the same as [3, 2, 1]. With this in mind we can use backtracking
    //to iterate through `nums` and produce every possible permutation of `nums`. As we don't want to reuse elements it is
    //important to remove the current elements from `nums` from the the next recursive call. Also as `nums` can contain
    //duplicates we need to be careful that we don't include the same array outcome but with different ordering (with regards
    //to the original `nums` ordering) so `permutations` is a set to avoid this
    func permuteUniqueRemoval(_ nums: [Int]) -> [[Int]] {
        var permutations = Set<[Int]>()
        
        dfs(nums, [Int](), &permutations)
        
        return Array(permutations)
    }
    
    private func dfs(_ nums: [Int], _ current: [Int], _ permutations: inout Set<[Int]>) {
        guard !nums.isEmpty else {
            permutations.insert(current)
            return
        }
        
        for i in 0..<nums.count {
            let num = nums[i]
            var subNums = nums
            subNums.remove(at: i) //O(n) operation
            
            dfs(subNums, (current + [num]), &permutations)
        }
    }
}
