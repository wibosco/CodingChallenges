//
//  FindPeakElement.swift
//  CodingChallenges
//
//  Created by William Boles on 16/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/find-peak-element/
//array
struct FindPeakElement {
    
    //Time: O(log n) where `n` is the number of elements in `nums`
    //Space: O(1)
    //binary search
    //divide and conquer
    //
    //Solution Description:
    //We can use a twist on binary search to search through `nums` and find the peaks. Rather than comparing the `mid` element
    //against a target, we instead comapre it against it's right neighbour and attempt to identify a trend in the data i.e. up,
    //down or flat. Once we know this trend we can move our boundaries accordingly - move left if the right neighbour is lower
    //(we don't just return as while `mid` is greater, it itself might be part of a downward slope), move right if the right
    //neighbour is equal or greater than. Eventually we narrow down on an actual peak and can return it as the `left` index.
    static func findPeakElement(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return 0
        }
        
        var left = 0
        var right = nums.count - 1
        
        //Notice here that we don't check `right >= left` this is because we want to check our target `mid` against
        //it's right most neighbour so we need to ensure that a right neighbour exists
        while left < right {
            let mid = left + (right - left) / 2
            
            if nums[mid] > nums[mid + 1] { // only compare with neighbour
                right = mid
            } else {
                left = mid + 1
            }
        }
        
        return left
    }
    
    //Time: O(n) where `n` is the number of elements in `nums`
    //Space: O(1)
    //
    //Solution Description:
    //Loop through `nums` comparing previous num with current num and current num with next num to find the start of a peak
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
