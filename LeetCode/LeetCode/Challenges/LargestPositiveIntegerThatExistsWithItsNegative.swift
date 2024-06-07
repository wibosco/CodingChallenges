//
//  LargestPositiveIntegerThatExistsWithItsNegative.swift
//  LeetCode
//
//  Created by William Boles on 07/06/2024.
//

import Foundation

//https://leetcode.com/problems/largest-positive-integer-that-exists-with-its-negative/
struct LargestPositiveIntegerThatExistsWithItsNegative {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //set
    //
    //Solution Description:
    //Using a set as we iterate through `nums` we check if we have already seen the match of `num` in the set, if we find
    //a match and its positive value is greater than `maxK` we update `maxK` to the positive value and continue iterating.
    //Once all elements in `nums` have been checked we return `maxK` which will either be the largest match found or -1 if
    //no match was found.
    func findMaxK(_ nums: [Int]) -> Int {
        var values = Set<Int>()
        var maxK = -1
        
        for num in nums {
            let absNum = abs(num)
            
            if absNum > maxK { //no point checking for a match if the positive is smaller than `maxK`
                let target = num * -1
                    
                if values.contains(target) {
                    maxK = absNum
                }
            }
            values.insert(num)
        }
        
        return maxK
    }
    
    //Time: O(n log n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //two pointers
    //sorting
    //
    //Solution Description:
    //First we sort the array in ascending order then using two pointers we iterate through the array checking if values at 
    //`p1` and `p2` match, if they do then we return the positive value as this is largest possible match; if they don't
    //match we determine which pointer to adjust - if the absolute value of `p1` is larger then we move `p1` onto a smaller
    //value; if the absolute value of `p2` is greater we move `p2` onto a smaller value.
    func findMaxKSorting(_ nums: [Int]) -> Int {
        var nums = nums
        nums.sort(by: <)
        
        var p1 = 0
        var p2 = nums.count - 1
        
        while p1 < p2 {
            if nums[p1] > 0 { //the value at p1 is now positive so no match is possible
                break
            }
            
            let target = abs(nums[p1]) //try to find the positive
            
            if target == nums[p2] {
                return target
            } else if target > nums[p2] {
                p1 += 1
            } else {
                p2 -= 1
            }
        }
        
        return -1
    }
}
