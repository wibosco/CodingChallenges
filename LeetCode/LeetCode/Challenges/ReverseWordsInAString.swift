//
//  ReverseWordsInAString.swift
//  LeetCode
//
//  Created by William Boles on 03/09/2024.
//

import Foundation

//https://leetcode.com/problems/reverse-words-in-a-string/
struct ReverseWordsInAString {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(n)
    //string
    //array
    //
    //Solution Description:
    //First we extract the words from `s` into an array `words` - the edge of a word is determined by encountering a space character.
    //As there might not be a space character after the final word we check if `currentWord` is not empty and add it to `words`. Then
    //we iterate over all the words in reverse and add them to the `result` string which is then returned.
    func reverseWords(_ s: String) -> String {
        let chars = Array(s)
        var words = [String]()
        
        var currentWord = [Character]()
        var i = 0
        while i < chars.count {
            if chars[i] != " " {
                currentWord.append(chars[i])
            } else {
                if !currentWord.isEmpty {
                    words.append(String(currentWord))
                }
                
                currentWord = []
            }
            
            i += 1
        }
        
        if !currentWord.isEmpty {
            words.append(String(currentWord))
        }
        
        var result = ""
        i = words.count - 1
        while i >= 0 {
            let word = words[i]
            if result.isEmpty {
                result += word
            } else {
                result += " " + word
            }
            
            i -= 1
        }
        
        return result
    }
}
