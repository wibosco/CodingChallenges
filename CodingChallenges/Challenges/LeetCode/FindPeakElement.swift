//
//  FindPeakElement.swift
//  CodingChallenges
//
//  Created by William Boles on 16/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/find-peak-element/
//binary search
//array
struct FindPeakElement {
    
    //Time: O(log n)
    //Space: O(1)
    //
    //Solution Description:
    //1. Use binary search to search through sorted array nums
    //2. Find peak by comparing mid against it's neighbout (rather than target) to determine if mid is moving "downwards"
    static func findPeakElement(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return 0
        }
        
        var left = 0
        var right = nums.count - 1
        
        //Notice here that we don't check `right >= left` this is because
        //we want to check our target `mid` against it's right most
        //neighbour so we need to ensure that a right neighbour exists
        while left < right {
            let mid = left + (right - left) / 2
            if nums[mid] > nums[mid + 1] { // only compare with neighbour
                //we don't just return here as we need to make sure that
                //this is actually this a peak i.e the previous element is
                //not greater than it. If the previous element is greater
                //than it then its not a peak but rather just part of the
                //slope
                right = mid
            } else {
                left = mid + 1
            }
        }
        
        return left
    }
    
    //Time: O(n)
    //Space: O(1)
    //
    //Solution Description:
    //1. Loop through nums comparing previous with current and current with next to find the start of a peak
    static func findPeakElementLinear(_ nums: [Int]) -> Int {
        var nums = nums
        
        nums.append(Int(Int32.min))
        nums.insert(Int(Int32.min), at: 0)
        
        var left = 0
        var mid = 1
        var right = 2
        
        while right < nums.count {
            let leftValue = nums[left]
            let midValue = nums[mid]
            let rightValue = nums[right]
            
            if midValue > leftValue && midValue > rightValue {
                return (mid - 1)
            }
            
            left += 1
            mid += 1
            right += 1
        }
        
        return 0
    }
}
