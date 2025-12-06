// Created 13/04/2023.

import Foundation

//https://leetcode.com/problems/palindromic-substrings/
struct PalindromicSubstrings {
        
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
    //increment `palindromes`. Once we have checked each starting position we return the count.
    //
    //Similar to: https://leetcode.com/problems/longest-palindromic-substring/
    func countSubstrings(_ s: String) -> Int {
        var palindromes: Int = 0
        
        let chars = Array(s)
        
        for i in 0..<s.count {
            countPalindromes(chars, i, i, &palindromes)
            countPalindromes(chars, i, (i + 1), &palindromes)
        }
        
        return palindromes
    }
    
    private func countPalindromes(_ chars: [Character], _ left: Int, _ right: Int, _ palindromes: inout Int) {
        var left = left
        var right = right
        
        while left >= 0 && right < chars.count {
            //each loop through we expand left and right so to be here the previous version iteration of `left` and `right` i.e
            //`left + 1` and `right - 1` must have already been checked and been determine to be a palindrome.
            guard chars[left] == chars[right] else {
                break
            }
                
            palindromes += 1
        
            left -= 1
            right += 1
        }
    }
    
    //Time: O(n^2) where n is the number of characters in `s`
    //Space: O(n)
    //array
    //two pointers
    //recursive
    //bottom up
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
    //again as that substring has already been shown to be a palindrome. Using recursion we are able to count as the stack
    //unwinds. Once we have check each starting position we return the count.
    //
    //Similar to: https://leetcode.com/problems/longest-palindromic-substring/
    func countSubstrings2(_ s: String) -> Int {
        let chars = Array(s)
        var count = 0

        for i in 0..<chars.count {
            count += palindrome(chars, i, i)
            count += palindrome(chars, i, (i + 1))
        }

        return count
    }

    private func palindrome(_ chars: [Character], _ left: Int, _ right: Int) -> Int {
        guard left >= 0, right < chars.count, chars[left] == chars[right] else {
            return 0
        }

        return palindrome(chars, (left - 1), (right + 1)) + 1
    }
}
