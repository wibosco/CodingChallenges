// Created 15/11/2026.

import Foundation

//https://leetcode.com/problems/longest-strictly-increasing-or-strictly-decreasing-subarray/
struct LongestStrictlyIncreasingOrStrictlyDecreasingSubarray {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //single-pass
    //
    //Solution Description:
    //We iterate through `nums` from the second index and compare each value against the previous value. If the current value
    //is greater than the previous value then we are in a strictly increasing subarray, so we increment `increasingCount` and
    //reset `decreasingCount` back to 1. If the current value is less than the previous value then we are in a strictly
    //decreasing subarray, so we increment `decreasingCount` and reset `increasingCount` back to 1. If the two values are
    //equal we reset both counts back to 1. At the end of each iteration we store the largest of `maxCount`,
    //`increasingCount` and `decreasingCount` in `maxCount`. Once all values in `nums` have been checked we return `maxCount`.
    func longestMonotonicSubarray(_ nums: [Int]) -> Int {
        var increasingCount = 1
        var decreasingCount = 1

        var maxCount = 1

        for i in 1..<nums.count {
            if nums[i] > nums[(i - 1)] {
                increasingCount += 1
                decreasingCount = 1
            } else if nums[i] < nums[(i - 1)] {
                decreasingCount += 1
                increasingCount = 1
            } else {
                increasingCount = 1
                decreasingCount = 1
            }

            maxCount = max(maxCount, increasingCount, decreasingCount)
        }

        return maxCount
    }
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //multi-pass
    //
    //Solution Description:
    //First we find the length of the longest strictly increasing subarray by iterating through `nums` from the second index
    //and comparing each value against the previous value. If the current value is larger we increment `increasingCount`; if
    //not we reset `increasingCount` back to 1. At the end of each iteration we compare `increasingCount` against
    //`maxIncreasingCount` and store the larger of the two in `maxIncreasingCount`. Next we find `maxDecreasingCount` by
    //taking the same approach but for strictly decreasing values. With `maxIncreasingCount` and `maxDecreasingCount` we
    //return the larger of the two.
    func longestMonotonicSubarray2(_ nums: [Int]) -> Int {
        var maxIncreasingCount = 1
        var increasingCount = 1
        for i in 1..<nums.count {
            if nums[i] > nums[(i - 1)] {
                increasingCount += 1
            } else {
                increasingCount = 1
            }

            maxIncreasingCount = max(maxIncreasingCount, increasingCount)
        }

        var maxDecreasingCount = 1
        var decreasingCount = 1
        for i in 1..<nums.count {
            if nums[i] < nums[(i - 1)] {
                decreasingCount += 1
            } else {
                decreasingCount = 1
            }

            maxDecreasingCount = max(maxDecreasingCount, decreasingCount)
        }

        return max(maxIncreasingCount, maxDecreasingCount)
    }
}
