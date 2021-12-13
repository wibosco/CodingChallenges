//
//  LongestSubstring.swift
//  CodingChallenges
//
//  Created by William Boles on 04/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/longest-substring-without-repeating-characters/
//sliding window
struct LongestSubstring {
    
    //Time: O(n) where n is the characters in `s`
    //Space: O(n) where n is the characters in `s`
    //
    //N.B. This solution is sufficiently quicker due to `for (currentWindowEndIndex, char) in s.enumerated()`
    static func lengthOfLongestSubstring(_ s: String) -> Int {
        var visited = [Character: Int]()
        var longestNonRepeatingWindow = 0
        var currentWindowStartIndex = 0

        for (currentWindowEndIndex, char) in s.enumerated() {
            if let vistedIndex = visited[char], vistedIndex >= currentWindowStartIndex {
                currentWindowStartIndex = (vistedIndex + 1)
            }

            let currentWindowSize = (currentWindowEndIndex + 1) - currentWindowStartIndex
            longestNonRepeatingWindow = max(longestNonRepeatingWindow, currentWindowSize)

            visited[char] = currentWindowEndIndex
        }

        return longestNonRepeatingWindow
    }
    
    
    //Time: O(n) where n is the characters in `s`
    //Space: O(n) where n is the characters in `s`
    //
    //N.B. This solution is sufficiently slower due to `let char = s[s.index(s.startIndex, offsetBy: index)]`
    static func lengthOfLongestSubstringAlt(_ s: String) -> Int {
        var visited = [Character: Int]()
        var longestNonRepeatingWindow = 0
        var currentWindowStartIndex = 0
        
        for index in 0..<s.count {
            let char = s[s.index(s.startIndex, offsetBy: index)]
            if let vistedIndex = visited[char], vistedIndex >= currentWindowStartIndex {
                currentWindowStartIndex = (vistedIndex + 1)
            }
            
            let currentWindowSize = (index + 1) - currentWindowStartIndex
            longestNonRepeatingWindow = max(longestNonRepeatingWindow, currentWindowSize)
            
            visited[char] = index
        }
    
        return longestNonRepeatingWindow
    }
}
