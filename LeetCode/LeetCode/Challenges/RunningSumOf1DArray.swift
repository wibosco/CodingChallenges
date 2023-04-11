//
//  RunningSumOf1DArray.swift
//  LeetCode
//
//  Created by William Boles on 04/02/2022.
//

import Foundation

//https://leetcode.com/problems/running-sum-of-1d-array/
//prefix sum
struct RunningSumOf1DArray {
    
    //Time: O(n) `n` is the number of elements in `nums`
    //Space: O(n)
    //array
    //
    //Solution Description:
    //Using the prefix sum technique we iterate through the `nums` array and adding nums[i] to running total of all the
    //previous values of `nums` which we can get from the last elements in `prefixSum`
    static func runningSum(_ nums: [Int]) -> [Int] {
        var prefixSum = [Int]()
        prefixSum.append(nums[0])
        
        for num in nums[1...] {
            let value = prefixSum.last! + num
            prefixSum.append(value)
        }
        
        return prefixSum
    }
}
