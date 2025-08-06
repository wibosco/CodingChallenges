//
//  PalindromeNumber.swift
//  LeetCode
//
//  Created by William Boles on 08/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/palindrome-number/
struct PalindromeNumber {
    
    //Time: O(n) where n is the number of digits in `n`
    //Space: O(1)
    //modulo
    //math
    //
    //Solution description:
    //If a number is palindrome then when reversed it will be equal to its original value. Here we iterate through the digits
    //of `x`. First we extract the last digit of `x` using a modulo 10 and adding that digit to our reversed number `reversed`
    //to ensure that the digit is added in the correct position we first multiple it by 10 and then we add. To extract the next
    //value we divide `x` by 10 to move what was the tens column value into the unit column. After iterating through `x` we
    //compare `reversed` against `x` and return the result.
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else {
            return false
        }
        
        var reversed = 0
        let original = x
        var x = x
        
        while x != 0 {
            let digit = x % 10
            
            x /= 10
            
            reversed *= 10
            reversed += digit
        }
        
        return original == reversed
    }
    
    //Time: O(n) where n is the number of digits in `n`
    //Space: O(n)
    //modulo
    //math
    //array
    //two pointers
    //
    //Solution Description:
    //We convert `x` into an array of it's individual digits and then using two pointers we compare those digits from out to in.
    //If the digits don't match we return false. If anything checking all digits, they match, we return true.
    func isPalindrome2(_ x: Int) -> Bool {
        guard x >= 0 else {
            return false
        }

        var digits = [Int]()
        var x = x

        while x > 0 {
            let digit = x % 10 //extract the unit value
            digits.append(digit)

            x /= 10 //move the tens value into the unit column
        }

        var left = 0
        var right = digits.count - 1

        while left < right {
            guard digits[left] == digits[right] else {
                return false
            }

            left += 1
            right -= 1
        }

        return true
    }
}
