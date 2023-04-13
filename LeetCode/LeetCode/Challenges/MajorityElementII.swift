//
//  MajorityElementII.swift
//  LeetCode
//
//  Created by William Boles on 21/02/2022.
//

import Foundation

//https://leetcode.com/problems/majority-element-ii/
//array
struct MajorityElementII {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n) where n is the number of elements in `nums`
    //dictionary
    //
    //Solution Description:
    //Iterate through `nums` and track the number of times that we have seen the current element in a dictionary. As well as building
    //up the frequency dictionary we also check if the current element has been seen more than `nums / 3`. If it has we add it to
    //`elements` and continue; else we keep iterating.
    static func majorityElement(_ nums: [Int]) -> [Int] {
        let threshold = nums.count / 3
        var frequencies = [Int: Int]()
        var elements = [Int]()
        
        for num in nums {
            frequencies[num, default: 0] += 1
            
            if frequencies[num]! == (threshold + 1) { //to only record `num` we only add it the first time it exceeds the threshold
                elements.append(num)
            }
        }
        
        return elements
    }
}
