//
//  SquaresOfSortedArray.swift
//  LeetCode
//
//  Created by William Boles on 17/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/squares-of-a-sorted-array/
struct SquaresOfSortedArray {
    
    //Time: O(n) where is the number of elements in `nums`
    //Space: O(n)
    //array
    //two pointers
    //
    //Solution Description:
    //Whenever we square a number we always get a positive and if `a^2` > `b^2` then `a` > `b`. With these observations we can
    //treat `nums` as a semi sorted array of numbers (every positive number is already sorted). Using two pointers we iterate
    //through `nums` from opposite ends comparing the squared values at each pointer (remember a negative number squared
    //becomes positive). Whichever squared value is greater we insert into our `squared` array (before any already inserted
    //values as they would be greater).
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var squared = Array(repeating: 0, count: nums.count) //avoid having to expand the array with each new append
        
        var left = 0
        var right = nums.count - 1
        
        for i in (0..<squared.count).reversed() {
            let leftValue = abs(nums[left])
            let rightValue = abs(nums[right])
            
            let square: Int
            if leftValue > rightValue {
                square = leftValue * leftValue
                
                left += 1
            } else {
                square = rightValue * rightValue
                
                right -= 1
            }
            
            squared[i] = square
        }
        
        return squared
    }
    
    //Time: O(n log n) where is the number of elements in `nums`
    //Space: O(n)
    //array
    //sorting
    //
    //Solution Description:
    //Square all the nums and add them to the `squared` array in the order of `nums`. Then sort the squared array in ascending
    //order
    func sortedSquaresSorting(_ nums: [Int]) -> [Int] {
        var squared = [Int]()
        for num in nums {
            squared.append((num * num))
        }
        
        let sorted = squared.sorted { $0 < $1 }
        
        return sorted
    }
}
