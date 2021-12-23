//
//  ValidPalindromeII.swift
//  CodingChallenges
//
//  Created by William Boles on 23/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/valid-palindrome-ii/
//string
struct ValidPalindromeII {
    
    //Time: O(n) where `n` is the numbber of characters in `s`
    //Space: O(n)
    //two pointers
    //recursive
    //
    //Solution Description:
    //Using two pointers we compare the outermost characters to determine if they are the same. If they match
    //we move the pointers along once character towards the middle and recompare. If they don't match we
    //split `s` into two strings - one without the left mismatch character and one without the right mimatch
    //character. We then attempt to see if those two altered strings are palindrome, if either are then one
    //deletion is enough to produce a palindrome, if however neither is a palindrome we can't perform any
    //more deletions and must return false
    static func validPalindrome(_ s: String) -> Bool {
        return isValidPalindrome(Array(s), true)
    }
    
    private static func isValidPalindrome(_ chars: [Character], _ canRemove: Bool) -> Bool {
        var left = 0
        var right = (chars.count - 1)
        
        while left < right {
            guard chars[left] == chars[right] else {
                guard canRemove else {
                    return false
                }
                
                let leftChars = Array(chars[(left + 1)...right])
                let rightChars = Array(chars[left..<right])
                
                return isValidPalindrome(leftChars, false) || isValidPalindrome(rightChars, false)
            }
            
            left += 1
            right -= 1
        }
        
        return true
    }
}
