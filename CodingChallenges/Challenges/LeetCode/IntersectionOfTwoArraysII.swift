//
//  IntersectionOfTwoArraysII.swift
//  CodingChallenges
//
//  Created by William Boles on 20/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/intersection-of-two-arrays-ii/
struct IntersectionOfTwoArraysII {
    
    //Time: O(n+m)
    //two pointers
    static func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let nums1Sorted = nums1.sorted()
        let nums2Sorted = nums2.sorted()
        var intersectingValues = [Int]()
        
        var i = 0
        var j = 0
        
        while i < nums1Sorted.count &&
               j < nums2.count {
            let num1 = nums1Sorted[i]
            let num2 = nums2Sorted[j]
            
            if num1 < num2 {
                i += 1
            } else if num1 > num2 {
                j += 1
            } else { //equal
                i += 1
                j += 1
                
                intersectingValues.append(num1)
            }
        }
        
        return intersectingValues
    }
    
    //Time: O(n + m)
    //dictionary
    static func intersectDictionary(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var counts = [Int: Int]()
        
        for num in nums1 {
            counts[num, default: 0] += 1
        }
        
        var intersectingValues = [Int]()
        
        for num in nums2 {
            if let count = counts[num], count > 0 {
                intersectingValues.append(num)
                counts[num] = count - 1
            }
        }
        
        return intersectingValues
    }
    
    //Time: O(n*m)
    //binary search
    static func intersectBinarySearch(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var intersectingValues = [Int]()
        
        var sortedNums2 = nums2.sorted()
        
        for num1 in nums1 {
            let result = search(sortedNums2, for: num1)
            if result.0 {
                intersectingValues.append(num1)
                sortedNums2.remove(at: result.1)//Time: O(n) operation
            }
        }
        
        return intersectingValues
    }
    
    private static func search(_ nums: [Int], for target: Int) -> (Bool, Int) {
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
            let mid = left + (right - left) / 2
            
            if nums[mid] == target {
                return (true, mid)
            } else if nums[mid] > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return (false, -1)
    }
}
