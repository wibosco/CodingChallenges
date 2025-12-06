// Created 18/11/2021.

import Foundation

//https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/
struct FindMinimumRotatedSortedArray {
    
    //Time: O(log n)
    //Space: O(1)
    //divide and conquer
    //binary search find leftmost
    func findMin(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        
        while left < right {
            let mid = left + (right - left) / 2
            
            if nums[mid] > nums[right] {
                left = mid + 1
            } else {
                right = mid
            }
        }
        
        return nums[left]
    }
}
