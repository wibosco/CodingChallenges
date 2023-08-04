//
//  NumberOfSubsequencesThatSatisfyTheGivenSumCondition.swift
//  LeetCode
//
//  Created by William Boles on 17/07/2023.
//

import Foundation

//https://leetcode.com/problems/number-of-subsequences-that-satisfy-the-given-sum-condition/
struct NumberOfSubsequencesThatSatisfyTheGivenSumCondition {
    
    //Time: O(n log n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //two pointers
    //sorting
    //maths
    //
    //Solution Description:
    //We need to calculate sunsqeuences of `nums` that are equal to or less than `target` but we only care about the minimum and
    //maximum values in those subsequences. So by sorting the `nums` we are able to use two pointers to iterate through `nums`
    //and calculate those sums without missing any subsequences. We do by controlling with pointers we move:
    //
    //1. Sum equal to or smaller than `target` move the `left` pointer right (+1)
    //2. Sum greater than `target` move the `right` pointer left (-1)
    //
    //We can then calculate the number of possible subsequences between `left` and `right` with maths rather than with a DFS
    //operation. We repeat this process until `left` crosses `right`.
    //
    //N.B. the modulo operations are only here to satisify the leetcode question, if `nums` contained small enough values there
    //would be no need for them.
    //
    //N.B. The possible subsqeuence count formula is `2 ^ subsequence-element-count`
    static func numSubseq(_ nums: [Int], _ target: Int) -> Int {
        let nums = nums.sorted()
        let mod = 1000000007 //modulo operation as required
       
        //precompute the value of 2 to the power of each value.
        var powers = [Int]()
        powers.append(1)
        for i in 1..<nums.count {
            let power = (powers[(i - 1)] * 2) % mod
            powers.append(power)
        }
        
        var left = 0
        var right = (nums.count - 1)
        
        var total = 0
        
        while left <= right {
            guard nums[left] + nums[right] <= target else {
                //sum is too big so reduce largest value
                right -= 1
                continue
            }
            
            total += powers[(right - left)]
            total %= mod
            
            left += 1
        }
        
        return total
    }
}
