//
//  PalindromeNumber.swift
//  CodingChallenges
//
//  Created by William Boles on 08/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/palindrome-number/
//modulo
struct PalindromeNumber {
    
    //Time: O(n)
    //Space: O(1)
    //math
    //
    //Solution description:
    //If a number is palindrome then when reversed it will be equal to its original value. Here we iterate through the digits
    //of `x`. First we extract the last digit of `x` using a modulo 10 and adding that digit to our reversed number `reversedX`
    //to ensure that the digit is added in the correct position we first multipe it by 10 and then we add. Next we perform an
    //integer divison by 10 to `tmp` to prepare it for the next iteration. After iterating through `x` we compare `reversedX`
    //against `x`
    static func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else {
            return false
        }

        guard x > 9 else {
            return true
        }

        var reversedX = 0
        var tmp = x
        while tmp > 0 {
            let digit = tmp % 10 //get the last digit of `tmp`
            
            reversedX *= 10 //make room for the the pop to be added e.g. 123 becomes 1230
            reversedX += digit
            
            tmp /= 10
        }

        return reversedX == x
    }
}
