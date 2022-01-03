//
//  SquaresOfSortedArray.swift
//  CodingChallenges
//
//  Created by William Boles on 17/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/squares-of-a-sorted-array/
//array
struct SquaresOfSortedArray {
    
    //Time: O(n) where is the number of elements in `nums`
    //Space: O(n)
    //two pointers
    //
    //Solution Description:
    //Whenever we square a number we always get a positive and if `a^2` > `b^2` then `a` > `b`. With this observation we need
    //to treat `nums` as a semi sorted array of positive numbers. With two pointer we are able to iterate through `nums` getting
    //selecting the largest positive number between `left` and `right` pointers and inserting that into the `squared` array in
    //reverse ordering i.e. (n-1)..0
    static func sortedSquares(_ nums: [Int]) -> [Int] {
        var squared = Array(repeating: 0, count: nums.count)
        
        var left = 0
        var right = nums.count - 1
        
        for i in (0..<squared.count).reversed() {
            let leftValue = abs(nums[left])
            let rightValue = abs(nums[right])
            
            
            var square = 0
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
    //sorting
    //
    //Solution Description:
    //Sqaure all the nums and add them to the `sqaured` array in the order of `nums`. Then sort the squared array in ascending
    //order
    static func sortedSquaresSorting(_ nums: [Int]) -> [Int] {
        var squared = [Int]()
        for num in nums {
            squared.append((num * num))
        }
        
        let sorted = squared.sorted { $0 < $1 }
        
        return sorted
    }
}
