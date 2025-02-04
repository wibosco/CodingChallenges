//
//  CountNumberOfHomogenousSubstrings.swift
//  LeetCode
//
//  Created by William Boles on 09/11/2023.
//

import Foundation

//
struct CountNumberOfHomogenousSubstrings {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(1) or O(n) if you count `chars`
    //string
    //two pointers
    //modulo
    //maths
    //large numbers
    //scale down
    //
    //Solution Description:
    //Rather than looping through `s` multiple times we can instead use the formula `(n * (n + 1)) / 2` for calculating the sum
    //of natural numbers. Using two pointers we can determine the length of any homogenous characters in `s`. Once we reach the
    //end of each homogenous section of characters we use the above formula to calculate the sum for that section and add it to
    //`sum` - there is no need to track the individual permutations of the characters just the sum. Once we have iterated
    //through all characters in `s`, we can return `sum`.
    //
    //N.B. Sum of natural numbers: https://www.cuemath.com/sum-of-natural-numbers-formula/
    //
    //N.B. the modulo operations are only here to satisfy the leetcode question, if `nums` contained small enough values there
    //would be no need for them.
    func countHomogenous(_ s: String) -> Int {
        let chars = Array(s)
        
        var sum = 0
        var i = 0
        while i < chars.count {
            var count = 1
            var j = (i + 1)
            
            while j < chars.count {
                if chars[i] == chars[j] {
                    count += 1
                } else {
                    break
                }
                
                j += 1
            }
            
            sum += ((count * (count + 1) / 2) % 1000000007) //modulo operation is required

            i = j
        }
        
        return sum
    }
}
