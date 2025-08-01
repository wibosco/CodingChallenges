//
//  FindTargetIndicesAfterSortingArray.swift
//  LeetCode
//
//  Created by William Boles on 25/02/2024.
//

import Foundation

//https://leetcode.com/problems/find-target-indices-after-sorting-array/
struct FindTargetIndicesAfterSortingArray {
    
    //Time: O(n log n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //sorting
    //binary search find leftmost
    //binary search find rightmost
    //result
    //
    //Solution Description:
    //With a sorted array of `nums` we can perform two binary searches to find the first occurrence of `target` and the last
    //occurrence. With these two indexes we can construct the result array from that range.
    //
    //N.B. Both `leftMostIndex` and `rightMostIndex` might have the same index value or they both might be nil but one can't
    //be nil while the other is non-nil.
    //
    //Similar to: https://leetcode.com/problems/check-if-a-number-is-majority-element-in-a-sorted-array/
    //Similar to: https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/
    func targetIndices(_ nums: [Int], _ target: Int) -> [Int] {
        let sortedNums = nums.sorted(by: <)
        
        let leftMostIndex = findLeftMost(sortedNums, target)
        let rightMostIndex = findRightMost(sortedNums, target)
        
        guard let leftMostIndex = leftMostIndex, let rightMostIndex = rightMostIndex else {
            return [Int]()
        }
        
        return Array(leftMostIndex...rightMostIndex)
    }
    
    private func findLeftMost(_ values: [Int], _ target: Int) -> Int? {
        var left = 0
        var right = values.count - 1
        
        var result: Int?
        
        while left <= right {
            let mid = left + (right - left) / 2 //to avoid overflow
            
            if values[mid] == target {
                result = mid
                right = mid - 1
            } else if values[mid] > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return result
    }
    
    private func findRightMost(_ values: [Int], _ target: Int) -> Int? {
        var left = 0
        var right = values.count - 1
        
        var result: Int?
        
        while left <= right {
            let mid = left + (right - left) / 2 //to avoid overflow
            
            if values[mid] == target {
                result = mid
                left = mid + 1
            } else if values[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return result
    }
}
