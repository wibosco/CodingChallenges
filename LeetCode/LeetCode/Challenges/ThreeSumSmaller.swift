// Created 07/08/2025.

import Foundation

//https://leetcode.com/problems/3sum-smaller/
struct ThreeSumSmaller {
    
    //Time: O(n log n + n^2) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //two pointers
    //nested loops
    //
    //Solution Description:
    //By sorting `nums` into ascending order we can use two pointers to find the final two value in the triplet that is
    //smaller than `target`. Once a `left` and `right` combination has been found to be less than the `target` then we
    //know that if left was kept static all values from left of `right` will be even smaller than `target` so can be
    //included in the count. Once the count has been calculated we then move `left` rightwards and process that new
    //value. If the `sum` is equal to or larger `target` then we reduce the sum by moving `right` leftwards.
    func threeSumSmaller(_ nums: [Int], _ target: Int) -> Int {
        let nums = nums.sorted(by: <)
        var count = 0

        for (i, num) in nums.enumerated() {
            var left = i + 1 //don't include num in the search range
            var right = nums.count - 1

            while left < right {
                let sum = nums[i] + nums[left] + nums[right]
                if sum < target {
                    //As all values to the left of `right` are smaller than `right` itself we can count them.
                    //Effectively making `left` a static boundary for th duration of the calculation
                    count += right - left
                    left += 1
                } else {
                    right -= 1
                }
            }
        }

        return count
    }
}
