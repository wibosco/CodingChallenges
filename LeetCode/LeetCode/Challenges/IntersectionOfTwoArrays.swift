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
    
    //Time: O(n log m)
    //binary search
    static func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var intersectingValues = Set<Int>()
        
        let sortedNums2 = nums2.sorted()
        for num in nums1 {
            if search(sortedNums2, for: num) {
                intersectingValues.insert(num)
            }
        }
        
        return Array(intersectingValues).sorted() //sorting is only needed for unit testing
    }
    
    private static func search(_ nums: [Int], for target: Int) -> Bool {
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
    
    //Time: O(n*m)
    static func intersectionLooping(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var intersectingValues = Set<Int>()
        
        for num1 in nums1 {
            for num2 in nums2 {
                if num1 == num2 {
                    intersectingValues.insert(num1)
                }
            }
        }
        
        return Array(intersectingValues).sorted() //sorting is only needed for unit testing
    }
    
    static func intersectionBuiltin(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        return Array(Set(nums1).intersection(Set(nums2)))
    }
}
