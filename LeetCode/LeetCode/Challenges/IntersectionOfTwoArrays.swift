//
//  IntersectionOfTwoArrays.swift
//  CodingChallenges
//
//  Created by William Boles on 19/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/intersection-of-two-arrays/
//array
struct IntersectionOfTwoArrays {
    
    //Time: O(m log m + n log m) where n is the number of values in `nums1`, m is the number of values in `nums2`
    //Space: O(n) (`intersection` array)
    //binary search
    //sorting
    //
    //Solution Description:
    //By sorting `nums2` we can use binary search to find matching elements between `nums1` and `nums2`.
    static func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var intersection = Set<Int>()
        
        let sortedNums2 = nums2.sorted() //O(m log m)
        
        for num in nums1 {
            if binarySearch(sortedNums2, for: num) {
                intersection.insert(num)
            }
        }
        
        return Array(intersection)
    }
    
    private static func binarySearch(_ nums: [Int], for target: Int) -> Bool {
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
    
    //Time: O(n * m)
    //Space: O(n) (`intersection` array)
    //nested loops
    //
    //Solution Description:
    //For each element in `nums2` we iterate through `nums2` until we either find that element of run out of elements in
    //`nums2`
    static func intersectionLooping(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
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
