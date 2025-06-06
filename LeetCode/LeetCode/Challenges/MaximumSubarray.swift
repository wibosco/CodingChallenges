//
//  MaximumSubarray.swift
//  LeetCode
//
//  Created by William Boles on 31/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/maximum-subarray/
struct MaximumSubarray {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //counting
    //greedy
    //Kadanes algorithm
    //
    //Solution Description:
    //As this array contains both positive and negative values it be possible that as add values together we can end up
    //with a lower total value that what we began with i.e. [4, -1] would give us 3 which is lower than just 4, however
    //it is also possible that we have e.g. [4, -1, 2] - here by going through the negative we actually end up with a
    //higher positive value, 5. So we need to know when to discard a negative i.e start a new subarray sum and when to
    //accept them into the current subarray sum. To do we need to be "greedy" - if adding a value to the current subarray
    //sum takes us below the value that was added then that value was more valuable on its own (e.g. [-1, 4] if we start
    //the subarray sum from index 0 then the it would be 3 however if we start it from index 1 then it would be 4) and we
    //need to start a new subarray sum; if adding a value to the current subarray sum takes us above the value that was
    //added then we continue with that subarray sum. We then compare that new subarray sum with the maximum/greatest
    //subarray sum that we have seen so far and keep the larger of the two.
    //
    //See: https://en.wikipedia.org/wiki/Maximum_subarray_problem#Kadane's_algorithm
    //This is almost a two pointers question but as we only return the value we need to keep the start pointer
    func maxSubArray(_ nums: [Int]) -> Int {
        var currentSum = nums[0]
        var maxSum = nums[0]
        
        for num in nums[1...] {
            currentSum = max(num, (currentSum + num))
            maxSum = max(currentSum, maxSum)
        }
        
        return maxSum
    }
}
