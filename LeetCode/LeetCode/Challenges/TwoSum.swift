//
//  TwoSum.swift
//  LeetCode
//
//  Created by William Boles on 03/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/two-sum/
//array
struct TwoSum {
    
    //Time: O(n) `n` is the number of elements in `nums`
    //Space: O(n) `n` is the number of elements in `nums`
    //dictionary
    //
    //Solution Description:
    //As we iterate through `nums` we check if another `nums` element can be added to it to equal `target`. To avoid having to
    //nest loops we build a dictionary containing each seen `nums` element and its `index`. This will allow constant access time
    //to check for if the difference between the current `nums` element and target has already been seen. If that difference is
    //in `visited` we return the two indexes with the visited index being first (as it came before the current element)
    static func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var visted = [Int: Int]() //[num: index]
        
        for (index, num) in nums.enumerated() {
            let delta = target - num
            if let partner = visted[delta] {
                return [partner, index]
            }
            visted[num] = index
        }
        
        return [Int]()
    }
    
    //Time: O(n^2) `n` is the number of elements in `nums`
    //Space: O(1)
    //nested loops
    //
    //Solution Description:
    //Iterate through `nums` and add every other `nums` element after it to check if the sum equals `target`
    static func twoSumNestedLoops(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0..<nums.count {
            for j in (i+1)..<nums.count {
                let sum = nums[i] + nums[j]
                
                if sum == target {
                    return [i, j]
                }
            }
        }
        
        return [Int]()
    }
}
