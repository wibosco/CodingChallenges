//
//  FindDuplicateNumber.swift
//  CodingChallenges
//
//  Created by William Boles on 20/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/find-the-duplicate-number/
struct FindDuplicateNumber {
    
    //Time: O(n)
    //linked list (think of the array as a linked list)
    //circular dependency
    //two pointers
    //See: https://en.wikipedia.org/wiki/Cycle_detection#Floyd's_Tortoise_and_Hare
    static func findDuplicate(_ nums: [Int]) -> Int {
        var slow = nums[0]
        var fast = nums[0]
        
        repeat {
            slow = nums[slow] //use the value within the array to set the next indexpath
            fast = nums[nums[fast]]//make two "jumps"
        } while slow != fast
        
        slow = nums[0] //leave fast in the loop and reset slow back to the start
        
        while slow != fast { //now when they meet again it will be on the duplicate
            slow = nums[slow]
            fast = nums[fast]
        }
        
        return slow
    }
    
    //Time: O(n log n)
    //binary search
    static func findDuplicateBinarySearch(_ nums: [Int]) -> Int {
        var left = 1
        var right = nums.count - 1
        
        var dup = -1
        while left <= right {
            let mid = left + (right - left) / 2
            
            var count = 0
            for n in nums where n <= mid { //Time: O(n)
                count += 1
            }
            
            if count > mid {// Note comparison happening against index here
                dup = mid
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return dup
    }
    
    //Time: O(n)
    //negative marking
    static func findDuplicateNegativeMarking(_ nums: [Int]) -> Int {
        var nums = nums
        var i = 0
        
        while i < nums.count {
            let num = abs(nums[i])
            //use the value of nums[i] to update the nums array
            //if the value of nums[num] is slready  a negative
            //then we have already visited it and we have our
            //duplicate
            if nums[num] < 0 {
                return num
            }
            
            nums[num] *= -1
            i += 1
        }
        
        return -1
    }
    
    //Time: O(n)
    //dictionary
    static func findDuplicateDictionary(_ nums: [Int]) -> Int {
        var count = [Int: Int]()
        for num in nums {
            if let _ = count[num] {
                return num
            }
            
            count[num] = 1
        }
        
        return -1
    }
    
    //Time: O(n log n)
    //sorting
    static func findDuplicateSorting(_ nums: [Int]) -> Int {
        let sortedNums = nums.sorted() //Time: O(n log n)
        for i in 0..<(sortedNums.count - 1) {
            if sortedNums[i] == sortedNums[(i + 1)] { //Time: O(n)
                return sortedNums[i]
            }
        }
        
        return -1
    }
    
    //Time: O(n^2)
    static func findDuplicateLooping(_ nums: [Int]) -> Int {
        for i in 0..<nums.count {
            for j in (i + 1)..<nums.count {
                if nums[i] == nums[j] {
                    return nums[i]
                }
            }
        }
        
        return -1
    }
}
