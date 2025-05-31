// Created 31/05/2025.

import Foundation

//https://leetcode.com/problems/missing-element-in-sorted-array/
struct MissingElementInSortedArray {
    
    //Time: O(log n) where n is the number of elements in `nums`
    //Space: O(1)
    //binary search
    //array
    //
    //Solution Description:
    //As `nums` is sorted in ascending order we can use binary search to search the array for the position where the `k`th
    //missing value should be. We can't directly use the values in `nums` to determine how to narrow our search scope as we
    //are trying to find the missing values but we can calculate how many missing values there are for a given index. If
    //filling in the missing values to get to that index would require more than `k` fills then we know that the `k`th
    //missing value is to the left else if the missing values are less than `k` then we know the `k`th missing value is to
    //the right so we can adjust our search scope accordingly. Once we have found the element nearest (but smaller) than
    //the `k`th missing value we calculate what it should be by adding the smallest value in `nums` to `k` to the values
    //are that are present (which is represented by `right`) and return that sum.
    //
    //Similar to: https://leetcode.com/problems/kth-missing-positive-number/
    func missingElement(_ nums: [Int], _ k: Int) -> Int {
        var left = 0
        var right = nums.count - 1

        let firstValue = nums[0]

        while left <= right {
            let mid = left + (right - left) / 2

            let currentValue = nums[mid]
            let missing = (currentValue - firstValue) - mid //mid here is how many values are not-missing

            if missing >= k {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }

        return firstValue + k + right
    }
}
