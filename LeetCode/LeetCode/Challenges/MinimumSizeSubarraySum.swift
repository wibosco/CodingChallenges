//
//  MinimumSizeSubarraySum.swift
//  LeetCode
//
//  Created by William Boles on 06/07/2023.
//

import Foundation

//https://leetcode.com/problems/minimum-size-subarray-sum/
struct MinimumSizeSubarraySum {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //sliding window
    //prefix sum
    //nested loop
    //fast forward
    //
    //Solution Description:
    //Using a sliding window approach we iterate through `nums` in a linear fashion adding or subtracting the elements of `nums`
    //as required. Using two pointers we either expand or contract our window into `nums` by moving right or left respectively.
    //We move `right` rightwards when `prefixSum` is below `target` and the `left` rightwards when `prefixSum` is equal to or
    //greater than `target`. This will allow us find the minimum window. An interesting point to note is the inner `while`
    //loop, this simplifies the outer `while` loop by confining `left` updates to only the inner loop and `right` updates to
    //only the outer loop.
    //
    //Think of sliding window moves across the array as how a caterpillar moves.
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var minLength = Int.max
        
        var left = 0
        var right = 0
        
        var prefixSum = 0
        
        while right < nums.count {
            prefixSum += nums[right] //expand window so add to sum
            
            //no need of checking `left` is in bounds here as when `left` reaches `right` `prefixSum` will be 0
            while prefixSum >= target { //only move `right` forwards again once we fall under `target`
                let currentLength = (right - left) + 1
                minLength = min(minLength, currentLength)
                
                prefixSum -= nums[left] //contract window so subtract from sum
                
                left += 1
            }
            
            right += 1
        }
        
        return minLength == Int.max ? 0 : minLength
    }
}
