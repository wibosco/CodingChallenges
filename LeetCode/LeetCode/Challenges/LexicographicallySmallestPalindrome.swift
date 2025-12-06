// Created 05/06/2024.

import Foundation

//https://leetcode.com/problems/lexicographically-smallest-palindrome/
struct LexicographicallySmallestPalindrome {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(1)
    //string
    //array
    //two pointers
    //
    //Solution Description:
    //Using two pointers we work out-to-in, comparing the characters at each pointer. Where the characters don't match we replace the
    //larger of the characters with the smaller so ensuring that we are producing the lexicographically smallest palindrome possible.
    func makeSmallestPalindrome(_ s: String) -> String {
        var characters = Array(s)
        
        var p1 = 0
        var p2 = characters.count - 1
        
        while p1 < p2 {
            if characters[p1] != characters[p2] {
                if characters[p1] > characters[p2] {
                    characters[p1] = characters[p2]
                } else {
                    characters[p2] = characters[p1]
                }
            }
            
            p1 += 1
            p2 -= 1
        }
        
        return String(characters)
    }
}
