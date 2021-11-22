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
    //prefix sum
    static func minStartValue(_ nums: [Int]) -> Int {
        var minValue = 0
        var runningTotal = 0
        for num in nums {
            runningTotal = runningTotal + num
            minValue = min(minValue, runningTotal)
        }
        
        return 1 - minValue
    }
    
    //Time: O(nlogn)
    //The index is sorted
    //binary search
    static func minStartValueBinarySearch(_ nums: [Int]) -> Int {
        var left = 1
        var right = nums.count * 100 + 1 //nums have a range of -100 to 100
        
        while left < right {
            let middle = (left + right)/2
            var runningTotal = middle
            for num in nums {
                runningTotal = runningTotal + num
                if runningTotal <= 0 {
                    break
                }
            }
            
            if runningTotal > 0 {
                right = middle
            } else {
                left = middle + 1
            }
        }
        
        return left
    }
    
    //Time: O(n^2)
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
