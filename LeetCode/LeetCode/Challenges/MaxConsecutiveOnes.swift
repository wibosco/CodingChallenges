// Created 31/08/2025.

import Foundation

//https://leetcode.com/problems/max-consecutive-ones/
class MaxConsecutiveOnes {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //counting
    //
    //Solution Description:
    //We iterate through `nums` and whenever we encounter a one we increment `count` and then compare that updated `count`
    //value against `maxCount`, setting `maxCount` to the larger of the two. If we encounter a non-one we set `count` to zero
    //Once all elements in `nums` have been processed we return `maxCount`.
    //
    //Similar to: https://leetcode.com/problems/max-consecutive-ones-iii/
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var maxCount = 0
        var currentCount = 0

        for num in nums {
            if num == 1 {
                currentCount += 1
                maxCount = max(maxCount, currentCount)
            } else {
                currentCount = 0
            }
        }

        return maxCount
    }
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //two pointers
    //sliding window
    //
    //Solution Description:
    //Using two pointers we iterate through `nums`. When we encounter a one, `p1` is left on that first one and `p2` is
    //iterated to the last one. We then calculate the window size by finding the difference between `p1` and `p2` and
    //compare that window size against `maxWindow`, setting `maxWindow` to the larger of the two. When we encounter a
    //non-one we set `p1` to `p2` and continue our search for the next one. Once all elements in `nums` have been processed
    //we return `maxWindow`.
    //
    //Similar to: https://leetcode.com/problems/max-consecutive-ones-iii/
    func findMaxConsecutiveOnes2(_ nums: [Int]) -> Int {
        var p1 = 0
        var p2 = 0

        var maxWindow = 0

        while p2 < nums.count {
            if nums[p2] == 1 {
                while p2 < nums.count, nums[p2] == 1 {
                    p2 += 1
                }

                let window = (p2 - p1) //no need for +1 as `p2` is already a head of the `1` elements
                maxWindow = max(maxWindow, window)
            } else {
                p2 += 1
                p1 = p2
            }
        }

        return maxWindow
    }
}
