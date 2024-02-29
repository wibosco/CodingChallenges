//
//  TwoSumLessThanK.swift
//  LeetCode
//
//  Created by William Boles on 27/02/2024.
//

import Foundation

//https://leetcode.com/problems/two-sum-less-than-k/
struct TwoSumLessThanK {
    
    //Time: O(n log n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //two pointers
    //sorting
    //
    //Solution Description:
    //First we sort `nums` in ascending order and then using two pointers we take the smallest and largest values in the sorted
    //array and sum them, if that value is less than `k` we store it as `result` and move our search space rightwards by
    //incrementing `left` to attempt to find a greater `sum` next iteration; if `sum` is equal to or greater than we move our
    //search leftwards by decrementing `right` to attempt to find a smaller `sum` next iterations. As it is possible to find a
    //smaller `sum` in later iterations we need to be careful when we update `result` to ensure that it hold the largest sum
    //that is less than `k`. Once the two pointers cross, we return `result`.
    func twoSumLessThanK(_ nums: [Int], _ k: Int) -> Int {
        let sortedNums = nums.sorted(by: <)
        
        var left = 0
        var right = nums.count - 1
        
        var result = -1
        
        while left < right {
            let sum  = sortedNums[left] + sortedNums[right]
            
            if sum < k {
                result = max(result, sum)//possible that to get a smaller sum in later iteration
                left += 1
            } else {
                right -= 1
            }
        }
        
        return result
    }
    
    //Time: O(n log n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //binary search
    //sorting
    //
    //Solution Description:
    //First we sort `nums` in ascending order and then taking each element as the start element we use binary search to attempt
    //to find another value in the `nums` (after removing the start element). If the sum of the two values is greater than or
    //equal to `k` we move the search space leftwards by reducing `right`, if it is less than `k` is move the search space
    //rightwards by increasing `left`. As we need to perform a binary search for all elements in `nums` we keep track of the
    //largest sum we have found in `result`, which once all combinations have been checked, we return.
    func twoSumLessThanKBinarySearch(_ nums: [Int], _ k: Int) -> Int {
        let sortedNums = nums.sorted(by: <)
        
        var result = -1
        for (index, num) in sortedNums.enumerated() {
            var values = sortedNums
            values.remove(at: index)
            
            let nearest = binarySearch(values, num, k)
            
            result = max(result, nearest)
        }
        
        return result
    }
    
    private func binarySearch(_ values: [Int], _ value: Int, _ target: Int) -> Int {
        var left = 0
        var right = values.count - 1
        
        var result = -1
        
        while left <= right {
            let mid = left + (right - left) / 2
            let sum = values[mid] + value
            
            if sum < target {
                left = mid + 1
                result = sum
            } else {
                right = mid - 1
            }
        }
        
        return result
    }
}
