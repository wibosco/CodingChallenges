//
//  Sqrt.swift
//  LeetCode
//
//  Created by William Boles on 17/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/sqrtx/
struct Sqrt {
    
    //Time: O(log n)
    //binary search
    func mySqrt(_ x: Int) -> Int {
        guard x > 1 else {
            return x
        }
        
        var left = 0
        var right = x / 2
        
        while left <= right {
            let mid = left + (right - left) / 2
            
            let squared = mid * mid
            if squared == x {
                return mid
            } else if squared > x {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return right
    }
    
    //Time: O(n)
    func mySqrtLinear(_ x: Int) -> Int {
        var i = 0
        while (i * i) <= x {
            i += 1
        }
        
        return (i - 1)
    }
}
