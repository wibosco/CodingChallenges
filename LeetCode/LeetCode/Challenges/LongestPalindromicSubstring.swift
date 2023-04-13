//
//  LongestPalindromicSubstring.swift
//  LeetCode
//
//  Created by William Boles on 04/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/longest-palindromic-substring/
//string
struct LongestPalindromicSubstring {
    
    //Time: O(n^2) where n is the number of characters in `s`
    //Space: O(n)
    //two pointers
    //
    //Solution Description:
    //It's important to note that we are checking for the longest palindrome in this string and not just that this string is
    //palindrome. This means that a palindrome might be from 0..2 or 9..15 or anything in between so when searching a
    //palindrome we need to do so from all indexes. Palindromes also come in two flavours: odd and even i.e. "aba" or "aa"
    //which we also need to cater for. Below we iterate through `s` and from each index is part of a palindrome (odd or even).
    //We check for a palindrome but comparing the `left` and `right` elements and gradually moving out from there until we
    //either encounter non-matching elements or hit the start/end of `characters`. For each vaild palindrome that we find we
    //compare its length against the longest we have encountered so far. If it larger we replace the longest with the current.
    //
    //NB: `a` is considered a palindrome so the belwwo solution accounts for that
    static func longestPalindrome(_ s: String) -> String {
        var longest = [Character]()
        let characters = Array(s)

        for i in 0..<characters.count {
            setLongestPalindrome(characters, &longest, i, i) // odd
            setLongestPalindrome(characters, &longest, i, (i + 1)) // even
        }

        return String(longest)
    }

    private static func setLongestPalindrome(_ characters: [Character], _ longest: inout [Character], _ left: Int, _ right: Int) {
        var left = left
        var right = right

        while left >= 0 && right < characters.count {
            guard characters[left] == characters[right] else {
                break
            }
            
            //each loop through we expand left and right so to be here `left + 1` and `right - 1` must have been check in
            //a previous iteration been a palindrome
            let palindrome = characters[left...right]
            
            if palindrome.count > longest.count {
                longest = Array(palindrome)
            }

            left -= 1
            right += 1
        }
    }
    
    // MARK: - Slow
    
    //Time: O(n^3)
    static func longestPalindromeSlow(_ s: String) -> String {
        let characters = Array(s)
        var longestPalindrome = Array(characters[...0])

        var left = 0
        while left < characters.count {
            var right = (characters.count - 1)
            while right >= left {
                let possiblePalindrome = Array(characters[left...right])
                if isPalindrome(possiblePalindrome) {
                    if possiblePalindrome.count > longestPalindrome.count {
                        longestPalindrome = possiblePalindrome
                    }
                }
                right -= 1
            }
            left += 1
        }
    
        return String(longestPalindrome)
    }
    
    private static func isPalindrome(_ characters: [Character]) -> Bool {
        var left = 0
        var right = (characters.count - 1)
        
        while right >= left {
            if characters[left] != characters[right] {
                return false
            }
            
            left += 1
            right -= 1
        }
        
        return true
    }
}
