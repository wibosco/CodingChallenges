//
//  ReverseInteger.swift
//  CodingChallenges
//
//  Created by William Boles on 07/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/reverse-integer/
struct ReverseInteger {
    
    //0(n)
    static func reverse(_ x: Int) -> Int {
        guard x != 0 else {
            return 0
        }
        
        var tmp = x
        var reversed = 0
        
        while tmp != 0 {
            let reminder = tmp % 10
            tmp /= 10
            
            if willOverFlowIfAdded(a: reversed, b: reminder) ||
                willUnderFlowIfAdded(a: reversed, b: reminder) {
                return 0
            }
            
            reversed = (reversed * 10) + reminder
        }
        
        return reversed
    }
    
    static func willOverFlowIfAdded(a: Int, b: Int) -> Bool {
        //a > (Int32.max / 10), a can not be shifted and added to as any shift will take it over the limit
        //(a == Int32.max/10 && b > (Int32.max % 10)) `a` can be shifted and added to but only if the addition is less than 7, (2^31 - 1) = 2147483647, Note the final digit of 7
        a > (Int32.max / 10) || (a == (Int32.max / 10) && b > (Int32.max % 10))
    }
    
    static func willUnderFlowIfAdded(a: Int, b: Int) -> Bool {
        //a < Int32.min/10, a can not be shifted and added to as any shift will take it over the limit
        //(a == Int32.min/10 && b < (Int32.min % 10)) `a` can be shifted and added to but only if the addition is less than 8, (-2^31) = 2147483648, Note the final digit of 8
        a < Int32.min/10 || (a == (Int32.min / 10) && b < (Int32.min % 10))
    }
}
