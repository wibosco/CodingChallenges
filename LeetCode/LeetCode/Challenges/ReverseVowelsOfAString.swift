//
//  ReverseVowelsOfAString.swift
//  LeetCode
//
//  Created by William Boles on 01/09/2024.
//

import Foundation

//https://leetcode.com/problems/reverse-vowels-of-a-string/
struct ReverseVowelsOfAString {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(n)
    //string
    //array
    //two pointers
    //set
    //
    //Solution Description:
    //Treating `s` as an array we an use two pointers to move through that array and where the values at both `left` and
    //`right` are vowels, swap the values. At each iteration, we `left` and/or `right` depending on the values that they
    //are pointing at. To speed up checking a a vowel, all vowels are stored in a set. Once `left` and `right` cross all
    //all swappable vowels have been swapped and `chars` can be returned as a `String`.
    func reverseVowels(_ s: String) -> String {
        let vowels = Set<Character>(["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"])
        var chars = Array(s)
        
        var left = 0
        var right = chars.count - 1
        
        while left < right {
            let v1 = chars[left]
            let v2 = chars[right]
            
            if vowels.contains(v1) && vowels.contains(v2) {
                chars[left] = v2
                chars[right] = v1
                
                left += 1
                right -= 1
            } else if vowels.contains(v1) {
                right -= 1
            } else if vowels.contains(v2) {
                left += 1
            } else {
                left += 1
                right -= 1
            }
        }
        
        return String(chars)
    }
}
