//
//  MajorityElement.swift
//  LeetCode
//
//  Created by William Boles on 21/02/2022.
//

import Foundation

//https://leetcode.com/problems/majority-element/
struct MajorityElement {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //counting
    //Boyer-Moore Voting Algorithm
    //
    //Solution Description:
    //Iterating through `nums` we assume that the first element is the majority element. Every time we see that element we add 1 to
    //count and every time we see a different element we subtract 1, if we get to a count of 0 we take the current element as the new
    //majority candidate and start counting until we exhaust all elements in `nums`. 
    static func majorityElement(_ nums: [Int]) -> Int {
        var count = 0
        var majority = nums[0] //will be overwritten first time through the loop
        
        for num in nums {
            if count == 0 {
                majority = num
            }
            
            if num == majority {
                count += 1
            } else {
                count -= 1
            }
        }
        
        return majority
    }
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //dictionary
    //frequency
    //
    //Solution Description:
    //Iterate through `nums` and track the number of times that we have seen the current element in a dictionary. As well as building
    //up the frequency dictionary we also track the current element has been seen more than `nums / 2`. If it has we set the `majority`
    //variable and exit the loop; else we keep iterating.
    static func majorityElementDictionary(_ nums: [Int]) -> Int {
        var frequencies = [Int: Int]()
        var majority = nums[0]
        let threshold = nums.count / 2
        
        for num in nums {
            frequencies[num, default: 0] += 1
            
            if frequencies[num]! > threshold {
                majority = num
                break
            }
        }
        
        return majority
    }
}
