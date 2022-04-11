//
//  Pow.swift
//  CodingChallenges
//
//  Created by William Boles on 15/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/powx-n/
//math
//See: https://www.youtube.com/watch?v=snOaKR2xgZg
struct Pow {
    
    //Time: O(log n) where `n` is value of `n`. As we only perform half the calculation we only need half the steps (`n`)
    //Space: O(1)
    //divide and conquer
    //recursive
    //
    //Solution Description:
    //2^4 is shorthand for `2 * 2 * 2 * 2` so when we have a positive exponent value then we simply multiple `x` by
    //itself `n` times. 2^-4 is shorthand for `1 / (2 * 2 * 2 * 2)` so when we have a negative exponent value then we
    //need to turn `x` into a fraction e.g. dividend = 2, divisor = 4 so `2 / 4 = 0.5` can also be expressed as `2 * 0.25`
    //or `2 * (1 / 4)` as you can see with turn the divisor into a fraction. So whenever we get a negative `n` rather than
    //attempting to divide it, we turn it into a faction to simplify our calculations.
    //
    //Now as you can see above whether we have a positive or negative exponent we effectively have repeating work e.g.
    //`2 * 2 * 2 * 2` - the way multiplication works this is work can be halved i.e. if we know `2 * 2` then we know that
    //we can square that to get the same result as `2 * 2 * 2 * 2`. We don't have to perform the all individual steps,
    //instead we take we make `n / 2` calculations and then one more calculation i.e. `4 * 4` so we went from 4 steps to
    //3 steps. We can reduce the number of steps until eventually we get an expontent value of 0 which will result in `1`
    //being returned regardless of the value of `x`. So if we take the exponent and gradually reduce it it down to zero
    //we can then recursively come back through those calculations using the result of the previous calculation squared
    //to generate the current levels result. The gotcha here is if our exponent is an odd number as this doesn't divide in
    //half nicely instead we need to multiple the squared result by `x` to ensure that the `x` has been raised to the
    //correct exponent.
    static func myPow(_ x: Double, _ n: Int) -> Double {
        guard x != 0 else {
            return 0
        }
        
        var x = x
 
        if n < 0 {
            x = 1 / x //with negative values we need to divide to gradually get smaller
        }
        
        return myPowHelper(x, abs(n))
    }
    
    private static func myPowHelper(_ x: Double, _ n: Int) -> Double {
        guard n > 0 else { //base case
            return 1
        }
        
        var result = myPowHelper(x, (n / 2)) //x^n is the same as x^(n/2) * x^(n/2)
        result *= result //no need to call `myPowHelper` for each half instead just multiply it by itself
        if n % 2 != 0 { // if n was odd then multiply again by x
            result *= x
        }
        
        return result
    }
    
    //Time: O(n)
    //Space: O(1)
    //
    //Solution Description:
    //2^4 is shorthand for `2 * 2 * 2 * 2` so when we have a positive exponent value then we simply multiple `x` by
    //itself `n` times. 2^-4 is shorthand for `1 / (2 * 2 * 2 * 2)` so when we have a negative exponent value then we
    //need to turn `x` into a fraction e.g. dividend = 2, divisor = 4 so `2 / 4 = 0.5` can also be expressed as `2 * 0.25`
    //or `2 * (1 / 4)` as you can see with turn the divisor into a fraction. So whenever we get a negative `n` rather than
    //attempting to divide it, we turn it into a faction to simplify our calculations.
    static func myPowBruteForce(_ x: Double, _ n: Int) -> Double {
        var x = x
   
        if n < 0 {
            x = 1 / x
        }
        
        var result = 1.0
        for _ in 0..<abs(n) {
            result *= x
        }
        
        return result
    }
}
