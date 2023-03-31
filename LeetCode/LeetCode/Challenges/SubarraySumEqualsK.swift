//
//  SubarraySumEqualsK.swift
//  LeetCode
//
//  Created by William Boles on 03/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/subarray-sum-equals-k/
//array
struct SubarraySumEqualsK {
    
    //Time: O(n) where `n` is the number of element in `nums`
    //Space: O(n) where `n` is the number of element in `nums`
    //prefix sum
    //dictionary
    //
    //Solution Description:
    //We iterate through `nums` building up a prefix sum as we go. We can quickly determine if we have found our value from
    //0...i by using a prefix sum to gradually sum the the elements in the array that came before `i`. However it's possible
    //that the contiguous subarray might start at a later index than 0. If we are trying to find the sum of j...i then we
    //don't need to directly calculate j...i instead we can use the sum of  0..<j and substitute from 0...i to get j...i
    //- ensursing that we never backtrack the array i.e. linear time. To support this with each iteration we either create a
    //new entry in `map` to store the prefix sum as it is at that index or increase the count of an existing entry. We need
    //to keep the count as `nums` can contain negative values so a later prefix sum is not guaranteed to be larger than a
    //previous. This means that the same prefix sum value can appear multiple times - each representing a valid starting index
    //to `i`. We check if the difference between the `prefixSum` and `k` is already in `map` if it is then we take the count
    //of entry and add it to the `numberOfSubarrays` count.
    //
    //N.B. We handle the special case where `nums[i] == k` by seeding `map` with `[0, 1]` i.e. a difference of 0
    //Similar to: https://leetcode.com/problems/two-sum/
    static func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var prefixSum = 0
        //special case where `nums[i] == k`
        var map = [0: 1] //[sum, count] - we need a count as array can contain negative
                         //               numbers so the same sum can appear multiple times
        var count = 0
        
        for i in 0..<nums.count {
            prefixSum += nums[i]
            
            let diff = prefixSum - k
            
            count += map[diff] ?? 0
            
            map[prefixSum, default: 0] += 1
        }
        
        return count
    }
    
    //Time: O(n^2) where `n` is the number of element in `nums`
    //Space: O(1)
    //nested loops
    //
    //Solution Description:
    //Looping through all possible contiguous subarray combinations we build up a sum of the values from i...j and compare
    //that sum to `k`. Where `sum` == `k` we increment `count` as we have found a contiguous subarray combination that
    //results in `k`. As `nums` can contain negative values upon matching `k` we keep going incase there are other matches
    func subarraySumRecursive(_ nums: [Int], _ k: Int) -> Int {
        var count = 0
                
        for i in 0..<nums.count {
            var sum = 0
            for j in i..<nums.count { //note that j starts at i so that the first iteration is the same as the outer loop
                sum += nums[j]
                if sum == k {
                    count += 1
                }
            }
        }
        
        return count
    }
}
