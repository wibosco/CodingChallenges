//
//  MaximumCountOfPositiveIntegerAndNegativeInteger.swift
//  LeetCode
//
//  Created by William Boles on 25/02/2024.
//

import Foundation

//https://leetcode.com/problems/maximum-count-of-positive-integer-and-negative-integer/
struct MaximumCountOfPositiveIntegerAndNegativeInteger {
    
    //Time: O(log n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //binary search
    //
    //Solution Description:
    //As `nums` is already sorted we can use two binary searches to find the total number negative and positive elements. First we
    //use binary search to find the right-most negative element (if it exists) and return the count of negative elements. Then we
    //use binary search to find the left-most positive element (if it exists) and return the count of positive elements. Next we
    //take the maximum of those two values and return it.
    //
    //N.B. 0 does not count as negative or positive.
    func maximumCount(_ nums: [Int]) -> Int {
        let negativeCount = negativeElementsBinarySearch(nums)
        let positiveCount = positiveElementsBinarySearch(nums)
        
        return max(negativeCount, positiveCount)
    }
    
    private func negativeElementsBinarySearch(_ values: [Int]) -> Int {
        let target = -1
        
        var left = 0
        var right = values.count - 1
        
        var result = -1
        
        while left <= right {
            let mid = left + (right - left) / 2 //to avoid overflow
            
            if values[mid] <= target {
                left = mid + 1
                result = mid
            } else {
                right = mid - 1
            }
        }
        
        return result + 1 //return count of negative elements
    }
    
    private func positiveElementsBinarySearch(_ values: [Int]) -> Int {
        let target = 1
        
        var left = 0
        var right = values.count - 1
        
        var result = -1
        
        while left <= right {
            let mid = left + (right - left) / 2 //to avoid overflow
            
            if values[mid] >= target {
                right = mid - 1
                result = mid
            } else {
                left = mid + 1
            }
        }
        
        guard result != -1 else {
            return 0
        }
        
        return values.count - result
    }
}
