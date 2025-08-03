//
//  LongestPalindromicSubstring.swift
//  LeetCode
//
//  Created by William Boles on 04/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/longest-palindromic-substring/
struct LongestPalindromicSubstring {
    
    //Time: O(n^2) where n is the number of characters in `s`
    //Space: O(n)
    //string
    //two pointers
    //iterative
    //multi-source
    //
    //Solution Description:
    //It's important to note that we are checking for the longest palindrome in this string and not just that this string is
    //palindrome. This means that a palindrome might be from 0..2 or 9..15 or anything in between so when searching a
    //palindrome we need to do so from all indexes. Palindromes come in two flavours: odd and even i.e. "aba" or "aa" which we
    //also need to cater for. Rather than checking if a string is a palindrome by going outside-in we are going to instead go
    //inside-out - this will allow us to count only valid palindromes rather than thinking that we have a palindrome only to
    //discover as we get deeper into the substring that it isn't actually a palindrome. Now going inside-out does not mean
    //that we need to start at the center of `s`, inside we start at the start of `s` and gradually move that starting position
    //right. Within each starting position we then attempt to expand out two characters at a time (one character left and one
    //character right), checking we still have characters in `s` to check and that if we do those new characters still form a
    //palindrome - it's important to note here that we only need to check those new characters and not the whole substring
    //again as that substring has already been shown to be a palindrome. With each new palindrome that we encounter we
    //increment `palindromes`. Once we have check each starting position we return the count.
    //
    //N.B. `a` is considered a palindrome so the below solution accounts for that.
    //
    //Similar to: https://leetcode.com/problems/palindromic-substrings/
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 else {
            return s
        }
        
        var longest = [Character]()
        let characters = Array(s)

        for i in 0..<characters.count {
            setLongestPalindrome(characters, &longest, i, i) // odd
            setLongestPalindrome(characters, &longest, i, (i + 1)) // even
        }

        return String(longest)
    }

    private func setLongestPalindrome(_ characters: [Character], _ longest: inout [Character], _ left: Int, _ right: Int) {
        var left = left
        var right = right

        while left >= 0 && right < characters.count {
            guard characters[left] == characters[right] else {
                break
            }
            
            //each loop through we expand left and right so to be here the previous version iteration of `left` and `right` i.e
            //`left + 1` and `right - 1` must have already been checked and been determine to be a palindrome.
            let palindrome = characters[left...right]
            
            if palindrome.count > longest.count {
                longest = Array(palindrome)
            }

            left -= 1
            right += 1
        }
    }
    
    //Space: O(n) where n is the number of characters in `s`
    //string
    //two pointers
    //recursive
    //multi-source
    //
    //Solution Description:
    //It's important to note that we are checking for the longest palindrome in this string and not just that this string is
    //palindrome. This means that a palindrome might be from 0..2 or 9..15 or anything in between so when searching a
    //palindrome we need to do so from all indexes. Palindromes come in two flavours: odd and even i.e. "aba" or "aa" which we
    //also need to cater for. Rather than checking if a string is a palindrome by going outside-in we are going to instead go
    //inside-out - this will allow us to count only valid palindromes rather than thinking that we have a palindrome only to
    //discover as we get deeper into the substring that it isn't actually a palindrome. Now going inside-out does not mean
    //that we need to start at the center of `s`, inside we start at the start of `s` and gradually move that starting position
    //right. Within each starting position we then attempt to expand out two characters at a time (one character left and one
    //character right), checking we still are still in the bounds of `s` and that if we are those new characters still form a
    //palindrome - it's important to note here that we only need to check those new characters and not the whole substring
    //again as that substring has already been shown to be a palindrome. With each new palindrome that we encounter we
    //increment `palindromes`. Once we have check each starting position we return the count.
    func longestPalindrome2(_ s: String) -> String {
        let chars = Array(s)

        var longest = (0, 0)

        for i in 0..<chars.count {
            let (oddLeft, oddRight) = palindrome(chars, i, i)
            //oddLeft < oddRight checks that a paliindrome was found at all
            if oddLeft < oddRight, (oddRight - oddLeft) > (longest.1 - longest.0) {
                longest = (oddLeft, oddRight)
            }

            let (evenLeft, evenRight) =  palindrome(chars, i, (i + 1))
            if evenLeft < evenRight, (evenRight - evenLeft) > (longest.1 - longest.0) {
                longest = (evenLeft, evenRight)
            }
        }
        
        return String(chars[longest.0...longest.1])
    }
    
    //we can't return a char array here as converting to an array for each iteration is O(n)
    private func palindrome(_ chars: [Character], _ left: Int, _ right: Int) -> (Int, Int) {
        guard left >= 0, right < chars.count, chars[left] == chars[right] else {
            return ((left + 1), (right - 1))
        }

        return palindrome(chars, (left - 1), (right + 1))
    }
    
    // MARK: - Slow
    
    //Time: O(n^3) where n is the number of characters in `s`. n to check if a string is a palindrome and n^2 to generate all combinations
    //string
    //two pointers
    //
    //Solution Description:
    //Brute force generate all possible in-order combinations of the characters in `s` by iterating through `s` forwards and comparing it
    //against all characters that come after in reverse order. If we find a palindrome we check it's length against the longest we've
    //found so far and store it if it is longer.
    func longestPalindrome3(_ s: String) -> String {
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
    
    private func isPalindrome(_ characters: [Character]) -> Bool {
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
