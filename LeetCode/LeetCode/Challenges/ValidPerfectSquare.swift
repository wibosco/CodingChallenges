//
//  ValidPerfectSquare.swift
//  LeetCode
//
//  Created by William Boles on 19/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/valid-perfect-square/
struct ValidPerfectSquare {
    
    //Time: O(log n)
    //Space: O(1)
    //binary search
    //
    //Solution Description:
    //1. Note that any ascending number squence is sorted by definition
    //2. Perform binary search using the squared value to compare with num
    static func isPerfectSquare(_ num: Int) -> Bool {
        guard num != 1 else {
            return true
        }
        
        var left = 0
        var right = num / 2
        
        while left <= right {
            let mid = left + (right - left) / 2
            
            let squared = mid * mid
            if squared == num {
                return true
            } else if squared > num {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return false
    }
}
