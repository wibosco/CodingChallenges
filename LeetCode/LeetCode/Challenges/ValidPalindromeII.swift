//
//  ValidPalindromeII.swift
//  LeetCode
//
//  Created by William Boles on 23/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/valid-palindrome-ii/
struct ValidPalindromeII {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(n)
    //string
    //two pointers
    //recursive
    //
    //Solution Description:
    //Using two pointers we compare the outermost characters of `s` to determine if they are the same. If they match we move
    //the pointers along once character towards the middle and recompare. If the characters don't match we move the the `left`
    //and `right` pointers along (separately) and attempt to validate the slightly shorter version of `s`. If any further
    //mismatches are found then we stop comparing and return false; if no other mismatches are found and we reach the end of
    //our comparisons then that one deletion was enough and we return true.
    func validPalindrome(_ s: String) -> Bool {
        let chars = Array(s)
        
        return isValidPalindrome(chars, 0, (chars.count - 1), true)
    }
    
    private func isValidPalindrome(_ chars: [Character], _ left: Int, _ right: Int, _ canDelete: Bool) -> Bool {
        guard left < right else {
            return true
        }
        
        if chars[left] == chars[right] {
            return isValidPalindrome(chars, (left + 1), (right - 1), canDelete)
        } else if canDelete {
            return isValidPalindrome(chars, (left + 1), right, false) || isValidPalindrome(chars, left, (right - 1), false)
        }
        
        return false
    }
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(n)
    //string
    //two pointers
    //recursive
    //inout
    //
    //Solution Description:
    //Using two pointers we compare the outermost characters of `s` to determine if they are the same. If they match we move
    //the pointers along once character towards the middle and recompare. If the characters don't match we move the the `left`
    //and `right` pointers along (separately) and attempt to validate the slightly shorter version of `s`. If any further
    //mismatches are found then we stop comparing and return false; if no other mismatches are found and we reach the end of
    //our comparisons then that one deletion was enough and we return true.
    func validPalindrome2(_ s: String) -> Bool {
        let chars = Array(s)
        var valid = false
        
        isValidPalindrome2(chars, 0, (chars.count - 1), true, &valid)
        
        return valid
    }
    
    private func isValidPalindrome2(_ chars: [Character], _ left: Int, _ right: Int, _ canRemove: Bool, _ valid: inout Bool) {
        guard left < right else {
            valid = true
            return
        }
        
        if chars[left] == chars[right] {
            isValidPalindrome2(chars, (left + 1), (right - 1), canRemove, &valid)
        } else if canRemove {
            isValidPalindrome2(chars, (left + 1), right, false, &valid)
            
            if !valid {
                isValidPalindrome2(chars, left, (right - 1), false, &valid)
            }
        }
    }
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(n)
    //string
    //two pointers
    //recursive
    //
    //Solution Description:
    //Using two pointers we compare the outermost characters to determine if they are the same. If they match we move the
    //pointers along once character towards the middle and recompare. If they don't match we split `s` into two strings -
    //one without the left mismatch character and one without the right mismatch character. We then attempt to see if those
    //two altered strings are palindromes. If that one deletion was enough to transform `s` into a palindrome then we can
    //return true; if however neither branch results in a palindrome without further deletions then we return false
    func validPalindrome3(_ s: String) -> Bool {
        return isValidPalindrome3(Array(s), true)
    }
    
    private func isValidPalindrome3(_ chars: [Character], _ canRemove: Bool) -> Bool {
        var left = 0
        var right = (chars.count - 1)
        
        while left < right {
            guard chars[left] == chars[right] else {
                guard canRemove else {
                    return false
                }
                //no need to retest the whole string as we know until this point it's valid - just test
                //the remainder minus one character
                let leftChars = Array(chars[(left + 1)...right])
                let rightChars = Array(chars[left..<right])
                
                return isValidPalindrome3(leftChars, false) || isValidPalindrome3(rightChars, false)
            }
            
            left += 1
            right -= 1
        }
        
        return true
    }
}
