//
//  DivideTwoIntegers.swift
//  CodingChallenges
//
//  Created by William Boles on 12/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/divide-two-integers/
//bit shifting
struct DivideTwoIntegers {
    
    //https://www.youtube.com/watch?v=htX69j1jf5U
    //Time: O(logn)
    static func divide(_ dividend: Int, _ divisor: Int) -> Int {
        guard dividend != 0 else {
            return 0
        }
        
        let sign = (dividend < 0) != (divisor < 0) ?  -1 : 1
        
        var dividend = abs(dividend)
        let divisor = abs(divisor)
        var quotient = 0
        
        //To divide without dividing we need to substract.
        //However straight forward subtraction is too slow.
        //Instead we left the divisor until it's larger than
        //the dividend then we add the number of shifts to the
        //running `quotient` and substract that shifted divisor
        //value from the dividend and perform the loop again
        while (dividend - divisor) >= 0 {
            var leftShift = 0 // 2^0 = 1
            while (dividend - divisor << (1 + leftShift)) >= 0 {
                leftShift += 1
            }
            quotient += 1 << leftShift
            dividend -= divisor << leftShift
        }
        
        quotient = quotient * sign
        
        quotient = min(quotient, Int(Int32.max))
        quotient = max(quotient, Int(Int32.min))
        
        return quotient
    }
}
