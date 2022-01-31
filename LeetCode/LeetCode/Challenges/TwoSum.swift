//
//  TwoSum.swift
//  CodingChallenges
//
//  Created by William Boles on 03/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/two-sum/
//dictionary
struct TwoSum {
    
    //Time: O(n)
    //Space: O(n)
    //
    //Solution Description:
    //1. Builds an dictionary containing with the delta as key and index as value
    //2. Peform lookup of delta to see if it already exists if so return current index and dictionary index
    static func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var visted = [Int: Int]()
        
        for (index, num) in nums.enumerated() {
            let delta = target - num
            if let partner = visted[delta] {
                return [partner, index]
            }
            visted[num] = index
        }
        
        return []
    }
    
    //Time: O(n^2)
    //
    //Solution Description:
    //1. Loop through all possible combinations of `nums` elements
    static func twoSumAlt(_ nums: [Int], _ target: Int) -> [Int] {
        var indices = [Int]()
        outerLoop: for i in 0..<nums.count {
            for j in (i+1)..<nums.count {
                let sum = nums[i] + nums[j]
                if sum == target {
                    indices.append(i)
                    indices.append(j)
                    break outerLoop
                }
            }
        }
        
        return indices
    }
}
