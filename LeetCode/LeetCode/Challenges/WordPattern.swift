//
//  WordPattern.swift
//  LeetCode
//
//  Created by William Boles on 01/04/2023.
//

import Foundation

//https://leetcode.com/problems/word-pattern/
//string
struct WordPattern {
    
    //Time: O(n) `n` is the number of elements in a `pattern`/`s`
    //Space: O(m+n) `n` is the number of elements in a `pattern`/`s` and `m` is the number of elements in `s`
    //dictionary
    //array
    //
    //Solution Description:
    //In order to confirm that that `s` matches the pattern defined in `pattern` we need to check both the mapping
    //from pattern->s and s->pattern - this catches the scenario where the same word (element of `s`) is used for
    //multiple characters (elements of `pattern`) and where the same charcter is used for multiple words. This
    //mapping is best expressed as a dictionary as it allows for O(1) lookup.
    static func wordPattern(_ pattern: String, _ s: String) -> Bool {
        var patternToWordMapping = [Character: String]()
        var wordToPatternMapping = [String: Character]()
        
        let words = s.components(separatedBy: " ")
        
        guard pattern.count == words.count else {
            return false
        }
        
        for (char, word) in zip(pattern, words) {
            if let pairedWord = patternToWordMapping[char] {
                if pairedWord != word {
                    return false
                }
            }
            
            if let pairedChar = wordToPatternMapping[word] {
                if pairedChar != char {
                    return false
                }
            }
            
            patternToWordMapping[char] = word
            wordToPatternMapping[word] = char
        }
        
        return true
    }
}
