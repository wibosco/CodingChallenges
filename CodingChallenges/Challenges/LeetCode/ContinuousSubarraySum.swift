//
//  ContinuousSubarraySum.swift
//  CodingChallenges
//
//  Created by William Boles on 02/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/continuous-subarray-sum/
//array
struct ContinuousSubarraySum {
    
    //Time: O(n) where `n` is the number of elements in `nums`
    //Space: O(1)
    //modulo
    //prefix sum
    //
    //Solution Description:
    //If `k` or a multiple of `k` exists then it will have a remainder value of 0. So using modulo we can
    //quickly determine if we have found our value from 0...i by using a prefix sum to graudally sum the
    //the elements in the array that came before `i`. However it's possible that the continous subarray
    //might start at a later index than 0. If we are trying to find the sum of j...i then we don't need to
    //directly calculate j...i instead we can use the sum of  0..<j and substitute from 0...i to get j...i
    //- ensursing that we never backtrack the array. Now rather than directly storing the prefix sum
    //for each index we instead store the remainder as we are trying to find `k` or any multiple of `k`.
    //With this of we get a match for `prefixSum % k` in the `map` dictionary then we have match from
    //(j + 1)...i. Really important to note that it's `j + 1` and not `j`
    //
    //N.B. see https://stackoverflow.com/questions/51830010/continuous-subarray-sum
    static func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        guard nums.count > 1 else {
            return false
        }
        
        var prefixSum = 0
        var map = [Int: Int]()
        
        for i in 0..<nums.count {
            prefixSum += nums[i]
            let remainder = prefixSum % k
            
            if remainder == 0 && i > 0 { // found the sum of `k` or a multiple of `k` directly from 0...i
                return true
            } else if let secondIndex = map[remainder] { //found the sum of `k` or a multiple of `k` directly from (secondIndex + 1)...i
                if (i - secondIndex) > 1 { // must be at least two elements
                    return true
                }
            } else {
                map[remainder] = i // store the remainder for index `i` to check in future iterations
            }
        }
        
        return false
    }
    
    //Time: O(n^2) where `n` is the number of elements in `nums`
    //Space: O(1)
    //modulo
    //
    //Solution Description:
    //Loop through the `nums` array and add each element to all other elements checking that sum is a multiple
    //of `k`. To ensure all combinations we need to gradually reducing `nums` with each iteration
    static func checkSubarraySumBruteForce(_ nums: [Int], _ k: Int) -> Bool {
        guard nums.count > 1 else {
            return false
        }
        
        var total = 0
        
        for i in 0..<nums.count {
            total += nums[i]
            for j in (i + 1)..<nums.count {
                total += nums[j]
                
                if total % k == 0 {
                    return true
                }
            }
            
            total = 0
        }
        
        return false
    }
}
