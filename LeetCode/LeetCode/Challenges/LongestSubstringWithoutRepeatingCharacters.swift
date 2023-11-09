//
//  LongestSubstring.swift
//  LeetCode
//
//  Created by William Boles on 04/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/longest-substring-without-repeating-characters/
struct LongestSubstringWithoutRepeatingCharacters {
    
    //Time: O(n) where n is the characters in `s`
    //Space: O(n) where n is the characters in `s`
    //string
    //sliding window
    //
    //Solution Description:
    //Using a dictionary `map` to store the characters we have already seen, we iterate through `s`. As we iterate through we keep
    //track of the start of our non-repeating subarray - `currentStartIndex`. For each character we encounter we check if we have
    //already seen the current character in the current on-repeating subarray i.e. from `currentStartIndex...i`. If we have seen
    //that character we set the `currentStartIndex` to be the index after that previous version of the the current character (it
    //must the index after so as to exclude the repeat). We then calculate the length of the current non-repeating characters and
    //compare it with our all time longest. If it's longer we replace it.
    //
    //N.B. This solution is sufficiently quicker when using a Character array rather than a string index
    static func lengthOfLongestSubstring(_ s: String) -> Int {
        var longestLength = 0
        var currentStartIndex = 0
        
        var map = [Character: Int]() //[char: index]
        
        for (i, c) in s.enumerated() {
            if let j = map[c], j >= currentStartIndex {
                currentStartIndex = j + 1
            }
            
            map[c] = i //we only care about the latest version of `c`
            
            let currentLength = (i + 1) - currentStartIndex
            longestLength = max(longestLength, currentLength)
        }
        
        return longestLength
    }
    
    //Time: O(n) where n is the characters in `s`
    //Space: O(n) where n is the characters in `s`
    //string
    //
    //Solution Description:
    //N.B. This solution is sufficiently slower due to `let char = s[s.index(s.startIndex, offsetBy: index)]`
    static func lengthOfLongestSubstringAlt(_ s: String) -> Int {
        var visited = [Character: Int]()
        var longestNonRepeatingWindow = 0
        var currentWindowStartIndex = 0
        
        for index in 0..<s.count {
            let char = s[s.index(s.startIndex, offsetBy: index)]
            if let visitedIndex = visited[char], visitedIndex >= currentWindowStartIndex {
                currentWindowStartIndex = (visitedIndex + 1)
            }
            
            let currentWindowSize = (index + 1) - currentWindowStartIndex
            longestNonRepeatingWindow = max(longestNonRepeatingWindow, currentWindowSize)
            
            visited[char] = index
        }
    
        return longestNonRepeatingWindow
    }
}
