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
    //that are present (which is represented by `right`) and return that sum.
    //
    //Similar to: https://leetcode.com/problems/kth-missing-positive-number/
    func missingElement(_ nums: [Int], _ k: Int) -> Int {
        var left = 0
        var right = nums.count - 1

        let valueOffset = nums[0]

        while left <= right {
            let mid = left + (right - left) / 2
            
            let missing = nums[mid] - (mid + valueOffset)
            
            if missing >= k {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        /*
         Think of this as 3 steps:
         
         1. `(nums[right] - (right + valueOffset)` to calculate how many values are missing up to `right`
         2. `(k - (nums[right] - (right + valueOffset))` to calculate how many k value we have to use after `right`
         3. `nums[right] + (k - (nums[right] - (right + valueOffset)))` to fill in the gaps to the right of `right`
         */

        return nums[right] + (k - (nums[right] - (right + valueOffset)))
    }
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //two pointers
    //
    //Solution Description:
    //We iterate through `nums` and compare the current value against it's right neighbor. If there is a gap between those
    //two values then we calculate if that gap is large enough for `k` values to fit in the gap. If the gap is at least as
    //large as `k `is then we add `k` to the current value and return it; if the gap is smaller than `k` then is reduce `k`
    //by the size of the gap and continue iterating. If after iterating through `nums`, the `k`th missing element hasn't
    //been found then we add `k` to the last value in `nums` and return that value.
    func missingElement2(_ nums: [Int], _ k: Int) -> Int {
        var k = k
        for i in 0..<nums.count - 1 {
            guard nums[(i + 1)] - nums[i] > 1 else {
                continue
            }

            let missing = (nums[(i + 1)] - nums[i]) - 1

            if missing >= k {
                return nums[i] + k
            } else {
                k -= missing
            }
        }

        return nums.last! + k
    }
}
