//
//  SubarraySumEqualsK.swift
//  CodingChallenges
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
    //We iterate through `nums` building up a prefix sum as we go. we can quickly determine if we have found our value from
    //0...i by using a prefix sum to graudally sum the the elements in the array that came before `i`. However it's possible
    //that the continous subarray might start at a later index than 0. If we are trying to find the sum of j...i then we
    //don't need to directly calculate j...i instead we can use the sum of  0..<j and substitute from 0...i to get j...i
    //- ensursing that we never backtrack the array i.e. linear time. To support this with each iteration we either create a
    //new entry in `map` to store the prefix sum as it is at that index or increase the count of an existing entry. We need
    //to keep the count as `nums` can contain negative values so a later iterations are not guaranteed to always be larger so
    //the same sum can appear multiple times - each representing a valid starting index to `i`. We check if the difference
    //between the `prefixSum` and `k` is already in `map` if it is then we take the count of entry and add it to our
    //`subarrays` count.
    //
    //N.B. We handle the special case where `nums[i] == k` by seeding `map` with `[0, 1]` i.e. a difference of 0
    static func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var prefixSum = 0
        //special case where `nums[i] == k`
        var map = [0: 1] //[sum, count] - we need a count as array can contain negative
                         //                numbers for same sum can appear multiple times
        var subarrays = 0
        
        for i in 0..<nums.count {
            prefixSum += nums[i]
            
            let diff = prefixSum - k
                            
            if let count = map[diff] {
                subarrays += count
            }
            
            map[prefixSum, default: 0] += 1
        }
        
        return subarrays
    }
}
