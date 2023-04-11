//
//  LengthOfLastWord.swift
//  LeetCode
//
//  Created by William Boles on 14/03/2022.
//

import Foundation

//https://leetcode.com/problems/length-of-last-word/
//string
struct LengthOfLastWord {
    
    //Time: O(n) `n` is the number of characters in `s`
    //Space: O(1)
    //
    //Solution Description:
    //Iterating `s` in reverse we first filter out any space characters (" ") that we encounter until we hit our first
    //non-space character at which point we start to count those characters. When continue counting until we either
    //reach the start of `s` or we encounter another space character at which point we our loop as the first word is
    //over.
    static func lengthOfLastWord(_ s: String) -> Int {
        var wordCount = 0
        
        for c in s.reversed() {
            if c == " " && wordCount > 0 {
              break
            }
            
            if c != " " {
                wordCount += 1
            }
        }
        
        return wordCount
    }
}
