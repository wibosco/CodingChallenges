//
//  ReverseInteger.swift
//  LeetCode
//
//  Created by William Boles on 07/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/reverse-integer/
//modulo
struct ReverseInteger {
    
    //Time: O(n) where `n` is the number of digits in `x`
    //Space: O(1)
    //overflow
    //underflow
    //math
    //
    //Solution Description:
    //To reverse a number we need to take each digit in turn (right to left) by performing modulo operation on the whole
    //number against base 10. With this individual we check if we can safely add it to the existing `reversed` number
    //without causing either an overflow or underflow. For overflow we first check if can shift the `reversed` number up
    //checking if it is already greater than `Int32.max / 10` i.e. we shift the Int32.max down. If `reversed` is greater
    //we return 0 as any shift by 10 will result in an overflow. We need to be careful on the edge where `reversed` is
    //equal to `Int32.max / 10` as we can shift by 10 without an overflow but adding certain `digit` values will still
    //result in an overflow - if adding `digit` would overflow we return 0. We repeat this process for `Int32.min` but
    //checking for underflow. If both pass we add `digit` to `reversed` and perform an integer divison to reduce `x` and
    //repeat the process.
    static func reverse(_ x: Int) -> Int {
        var reversed = 0
        var x = x
        
        while x != 0 {
            let digit = x % 10
            
            //overflow
            if reversed > (Int32.max / 10) { 
                return 0
            } else if reversed == (Int32.max / 10) {
                if digit > (Int32.max % 10) { //comparing positives so we need to use `>`
                    return 0
                }
            }
            
            //underflow
            if reversed < (Int32.min / 10) {
                return 0
            } else if reversed == (Int32.min / 10) {
                if digit < (Int32.min % 10) { //comparing negatives so we need to use `<`
                    return 0
                }
            }
            
            reversed *= 10
            reversed += digit
            
            x /= 10
        }
        
        return reversed
    }
}
