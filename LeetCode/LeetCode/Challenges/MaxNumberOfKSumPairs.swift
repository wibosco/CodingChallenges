//
//  MaxNumberOfKSumPairs.swift
//  LeetCode
//
//  Created by William Boles on 05/05/2022.
//

import Foundation

//https://leetcode.com/problems/max-number-of-k-sum-pairs/
//array
struct MaxNumberOfKSumPairs {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n)
    //dictionary
    //
    //Solution Description:
    //Iterating through `nums` we calculate the difference between the current num and `k` and attempt to find that difference
    //value in `nums`. To speed this up we store all unmatched differences in the `differences` dictionary - this will allow
    //O(1) search time when attempting to find that matching value. As the same value can appear multiple times in `nums`, when
    //storing that value in `differences` we need to also store how many times it has been seen. As a value can only be used once
    //when match is found we decrement the count for that value in `differences` by 1 (we also don't add the current num to
    //`differences` as it has been matched).
    //
    //Similar to: https://leetcode.com/problems/two-sum/
    static func maxOperations(_ nums: [Int], _ k: Int) -> Int {
        var differences = [Int: Int]() //[diff, count]
        var operations = 0
        
        for num in nums {
            let diff = (k - num)
            
            if let count = differences[diff], count > 0  {
                differences[diff] = (count - 1)
                
                operations += 1
            } else {
                differences[num, default: 0] += 1
            }
        }
        
        return operations
    }
}
