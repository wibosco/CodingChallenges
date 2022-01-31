//
//  Pow.swift
//  CodingChallenges
//
//  Created by William Boles on 15/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/powx-n/
//See: https://www.youtube.com/watch?v=snOaKR2xgZg
struct Pow {
    
    //divide and conquer
    //Time: O(log n)
    //Example:
    //5 ^ 8 is the same as 5 ^ 4 * 5 ^ 4 which in turn
    //is the same as 5 ^ 2 * 5 ^ 2 and so on
    static func myPow(_ x: Double, _ n: Int) -> Double {        
        var x = x
        var n = n
        if n < 0 {
            x = 1 / x // with negative values we need to divide to gradually get smaller
            n = -n
        }
        
        return myPowHelper(x, n)
    }
    
    private static func myPowHelper(_ x: Double, _ n: Int) -> Double {
        guard n != 0 else { //base case
            return 1
        }
        
        var result = myPowHelper(x, (n / 2))
        result *= result //no need to call `myPowHelper` for each half instead just multiply it by itself
        if n % 2 != 0 { // if n was odd then multiply again by x
            result *= x
        }
        
        return result
    }
    
    //Time: O(n)
    static func myPowBruteForce(_ x: Double, _ n: Int) -> Double {
        var x = x
        var n = n
                
        if n < 0 {
            x = 1 / x
            n = -n
        }
        
        var result = 1.0
        for _ in 0..<n {
            result *= x
        }
        
        return result
    }
}
