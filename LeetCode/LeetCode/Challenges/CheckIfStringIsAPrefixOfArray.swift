// Created 01/09/2024.

import Foundation

//https://leetcode.com/problems/check-if-string-is-a-prefix-of-array/
struct CheckIfStringIsAPrefixOfArray {
    
    //Time: O(n * m) where n is the numbers of elements in `words`
    //               where m is the number of characters in a word
    //Space: O(p) where p in the number of characters in `s`
    //array
    //string
    //three pointers
    //
    //Solution Description:
    //Using three pointers we iterate through all elements in `words` and compare is element against `s`. The first pointers `p1`
    //and `p2` iterate through `s` and `words` respectively with `p3` iterates through the current element of `words` being checked.
    //If the characters being compared do not match we return false; if they do match we increment `p1` and `p3` and repeat the
    //comparison until we run out of characters to compare. If it is `p1` that exceeds it's limit before `p3` we return falsse as
    //the prefix must be compelete; else we cotinue onto the next element in `words`. Once iterating through all elements in `words`
    //we check that all characters in `s` where checked, return true is so or false if not.
    func isPrefixString(_ s: String, _ words: [String]) -> Bool {
        let chars = Array(s)
        var p1 = 0
        var p2 = 0
        
        while p1 < chars.count && p2 < words.count {
            var p3 = 0
            let wordChars = Array(words[p2])
            
            while p1 < chars.count && p3 < wordChars.count {
                if chars[p1] != wordChars[p3] {
                    return false
                }
                
                p1 += 1
                p3 += 1
            }
            
            if p3 < wordChars.count { // must be whole words to count as a prefix
                return false
            }
            
            p2 += 1
        }
        
        return p1 == s.count
    }
}
