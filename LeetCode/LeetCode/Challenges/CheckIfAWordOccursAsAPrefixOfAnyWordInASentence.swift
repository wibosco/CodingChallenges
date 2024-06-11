//
//  CheckIfAWordOccursAsAPrefixOfAnyWordInASentence.swift
//  LeetCode
//
//  Created by William Boles on 11/06/2024.
//

import Foundation

//https://leetcode.com/problems/check-if-a-word-occurs-as-a-prefix-of-any-word-in-a-sentence/
struct CheckIfAWordOccursAsAPrefixOfAnyWordInASentence {
    
    //Time: O(n) where n is the number of characters in `sentence`
    //Space: O(n + m) where n is the number of characters in `sentence`
    //                where m is the number of characters in `searchWord`
    //string
    //array
    //two pointers
    //
    //Solution Description:
    //Using two pointers we iterate through `sentence` and for each word determine if it has `searchWord` as a prefix - `p1` is
    //used to point at the current character in `sentence` and `p2` is used to point at the current character in `searchWord`. A
    //word ends when we encounter a " " character so any time we do we reset our state, ready for the next word. As we are only
    //interested in matching `searchWord` as a prefix, once we determine that a `searchWord` isn't be a prefix for the current
    //word we skip that word. When we get a character match we increment `p2`.
    func isPrefixOfWord(_ sentence: String, _ searchWord: String) -> Int {
        let chars = Array(sentence)
        let searchChars = Array(searchWord)
    
        var wordIndex = 1 //indexing from 1
        
        var p1 = 0
        var p2 = 0
        
        var skipWord = false
        
        while p1 < chars.count {
            guard chars[p1] != " " else {
                p1 += 1
                p2 = 0
                
                wordIndex += 1
                skipWord = false
                
                continue
            }
            
            guard !skipWord else {
                p1 += 1
                
                continue
            }
            
            if chars[p1] == searchChars[p2] {
                p2 += 1
                
                if p2 == searchChars.count {
                    return wordIndex
                }
            } else {
                //only interested in finding the prefix
                skipWord = true
                p2 = 0
            }
        
            p1 += 1
        }
        
        return -1
    }
}
