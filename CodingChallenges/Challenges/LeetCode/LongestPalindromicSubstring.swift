//
//  LongestPalindromicSubstring.swift
//  CodingChallenges
//
//  Created by William Boles on 04/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/longest-palindromic-substring/
struct LongestPalindromicSubstring {
    
    //Time: O(n^2)
    static func longestPalindrome(_ s: String) -> String {
        var currentLongestPalindrome = [Character]()
        let characters = Array(s)

        for i in 0..<characters.count {
            setLongestPalindrome(from: characters, against: &currentLongestPalindrome,  left: i, right: i) // odd
            setLongestPalindrome(from: characters, against: &currentLongestPalindrome, left: i, right: (i + 1)) // even
        }

        return String(currentLongestPalindrome)
    }

    private static func setLongestPalindrome(from characters: [Character], against currentLongestPalindrome: inout [Character], left: Int, right: Int) {
        var left = left
        var right = right

        while left >= 0 &&
                right < characters.count &&
                characters[left] == characters[right] {
            //if we are here then all characters "internal" to this left
            //and right must have been palindromes so we effectively
            //remember by looping
            let palindrome = characters[left...right]
            if palindrome.count > currentLongestPalindrome.count {
                currentLongestPalindrome = Array(palindrome)
            }

            left -= 1
            right += 1
        }
    }
    
    // MARK: - Slow
    
    //Time: O(n^3)
    static func longestPalindromeSlow(_ s: String) -> String {
        let characters = Array(s)
        var longestPalindrome = Array(arrayLiteral: characters[0])

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
