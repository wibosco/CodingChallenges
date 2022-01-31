//
//  MinimumValueToGetPositive.swift
//  CodingChallenges
//
//  Created by William Boles on 11/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/minimum-value-to-get-positive-step-by-step-sum/
//array
struct MinimumValueToGetPositive {
    
    //Time: O(n)
    //Space: O(1)
    //prefix sum
    //
    //Solution Description:
    //The min starting value we want is 1 larger than the min step-by-step sum. So we iterate through `nums` adding each
    //element to the running total and comparing it against `minValue`. If we find a smaller value we update `minValue`;
    //else we continue on.
    static func minStartValue(_ nums: [Int]) -> Int {
        var minValue = 0
        var runningTotal = 0
        for num in nums {
            runningTotal = runningTotal + num // `nums` can contain negative values
            minValue = min(minValue, runningTotal)
        }
        
        return 1 - minValue
    }
    
    //Time: O(n log n)
    //Space: O(1)
    //The index is sorted
    //binary search
    //
    //Solution Description:
    //While `nums` is unsorted, our starting values range is sorted (constraint is that `nums` can only contain values
    //from -100 to 100 so we have our range). Using this we can perform a binary search on the starting values to
    //determine which starting value is the minimum.
    static func minStartValueBinarySearch(_ nums: [Int]) -> Int {
        var left = 1
        var right = nums.count * 100 + 1 //nums have a range of -100 to 100
        
        while left < right {
            let middle = (left + right)/2
            var runningTotal = middle
            for num in nums {
                runningTotal = runningTotal + num
                if runningTotal <= 0 {
                    break //too small
                }
            }
            
            if runningTotal > 0 { //all values of `runningTotal` have been above 0
                right = middle
            } else {
                left = middle + 1
            }
        }
        
        return left
    }
    
    //Time: O(n^2)
    //Space: O(1)
    //
    //Solution Description:
    //Using a start value of 1, sum it with each element in `nums` using that result as the next value to be summed
    //with the next element of `nums`. If the result is at any time less than 1 then end the iteration and increment
    //the starting number by 1. Once you can make it through `nums` and stay above 0, you have the minimum start value.
    static func minStartValueBruteForce(_ nums: [Int]) -> Int {
        var i = 1
    outerloop: while i < Int.max {
        var runningTotal = i
        for num in nums {
            runningTotal = runningTotal + num
            if runningTotal <= 0 {
                i += 1
                continue outerloop
            }
        }
        
        break outerloop
    }
        
        return i
    }
}
