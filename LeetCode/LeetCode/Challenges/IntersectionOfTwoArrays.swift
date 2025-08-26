//
//  IntersectionOfTwoArrays.swift
//  LeetCode
//
//  Created by William Boles on 19/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/intersection-of-two-arrays/
struct IntersectionOfTwoArrays {
    
    //Time: O(n + m) where n is the number of elements in `nums1`
    //               where m is the number of elements in `nums2`
    //Space: O(n)
    //array
    //set
    //
    //Solution Description:
    //We iterate through `nums1` and place each element into a set (so allowing O(1) look up time). Then we iterate through
    //`nums2` if a value appears in `set1` then we add it to `intersection` as we know both arrays contain that value.
    //`Intersection` has to be a set to avoid duplicate values being added. Once all values in `nums2` have been processed
    //we convert `intersection` into an array and return it.
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var set1 = Set<Int>()
        for n in nums1 {
            set1.insert(n)
        }

        var intersection = Set<Int>()
        for n in nums2 {
            guard set1.contains(n) else {
                continue
            }

            intersection.insert(n)
        }

        return Array(intersection)
    }
    
    //Time: O(m log m + n log m) where n is the number of values in `nums1`
    //                           where m is the number of values in `nums2`
    //Space: O(n) (`intersection` array)
    //array
    //binary search find exact match
    //sorting
    //
    //Solution Description:
    //By sorting `nums2` we can use binary search to find matching elements between `nums1` and `nums2`.
    func intersection2(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var intersection = Set<Int>()
        
        let sortedNums2 = nums2.sorted() //O(m log m)
        
        for num in nums1 {
            if binarySearch(sortedNums2, for: num) {
                intersection.insert(num)
            }
        }
        
        return Array(intersection)
    }
    
    private func binarySearch(_ nums: [Int], for target: Int) -> Bool {
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
            let mid = left + (right - left) / 2
            
            if nums[mid] == target {
                return true
            } else if nums[mid] > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return false
    }
    
    //Time: O(n * m) where n is the number of values in `nums1`
    //               where m is the number of values in `nums2`
    //Space: O(n) (`intersection` array)
    //array
    //nested loops
    //
    //Solution Description:
    //For each element in `nums2` we iterate through `nums2` until we either find that element of run out of elements in
    //`nums2`
    func intersection3(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var intersection = Set<Int>()
        
        for num1 in nums1 {
            for num2 in nums2 {
                if num1 == num2 {
                    intersection.insert(num1)
                }
            }
        }
        
        return Array(intersection)
    }
}
