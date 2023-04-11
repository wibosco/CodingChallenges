//
//  N-RepeatedElementInSize2NArray.swift
//  LeetCode
//
//  Created by William Boles on 22/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/n-repeated-element-in-size-2n-array/
//array
struct NRepeatedElementInSize2NArray {
    
    //Time: O(n) `n` is the number of elements in `nums`
    //Space: O(1)
    //dictionary
    //
    //Solution Description:
    //
    static func repeatedNTimes(_ nums: [Int]) -> Int {
        var count = [Int: Int]()
        
        for num in nums {
            count[num, default: 0] += 1
        }
        
        let target = nums.count / 2
        
        for key in count.keys {
            guard count[key] == target else {
                continue
            }
            
            return key
        }
        
        return -1
    }
}
