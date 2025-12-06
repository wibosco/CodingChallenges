// Created 05/06/2024.

import Foundation

//https://leetcode.com/problems/remove-palindromic-subsequences/
struct RemovePalindromicSubsequences {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(n)
    //string
    //array
    //two pointers
    //
    //Solution Description:
    //`s` can only contain two values: "a" and "b" and we can remove palindromic subsequences from `s`. So we can remove all the
    //"a" or "b" elements with one operation (each) as a any subsequence of the same characters will always be a palindrome. So
    //if `s` isn't already a palindrome we know that our maximum number of operations to remove all elements in a palindromic
    //manner will be 2. What's left is to determine if `s` is a palindrome which we can do using two pointers and working inwards
    //from the edges of `s`, comparing the elements of each pointer against each other until we either find a mismatch or we run
    //out of elements to compare. If `s` is a palindrome then only one deletion is required to delete all characters in `s`.
    func removePalindromeSub(_ s: String) -> Int {
        guard s.count > 0 else {
            return 0
        }
        
        guard isPalindrome(s) else {
            return 2
        }
       
        return 1
    }
    
    private func isPalindrome(_ s: String) -> Bool {
        let chars = Array(s)
        
        var p1 = 0
        var p2 = chars.count - 1
        
        while p1 < p2 {
            if chars[p1] != chars[p2] {
                return false
            }
            
            p1 += 1
            p2 -= 1
        }
        
        return true
    }
}
