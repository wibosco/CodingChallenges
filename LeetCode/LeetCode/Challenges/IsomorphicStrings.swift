//
//  IsomorphicStrings.swift
//  LeetCode
//
//  Created by William Boles on 07/07/2023.
//

import Foundation

//https://leetcode.com/problems/isomorphic-strings/
struct IsomorphicStrings {
    
    //Time: O(n) where n is length of either `s` or `t`
    //Space: O(n)
    //string
    //dictionary
    //
    //Solution Description:
    //Using two dictionaries we can ensure that the characters in `s` are consistently mapped to the same characters in `t`
    //and vice-versa. Using one pointer, `p`, we iterate through both `s` and `t` and use the characters we find at that
    //index to compare against against any previous times we have encountered those character. If we have previously
    //encountered those characters we add them to `mappingSToT` and `mappingTToS` with the correct key and value
    //configuration; if we have previously encountered either of those characters we check to make sure it was in the
    //presence of both the characters, if either mapping is to a different character we return false. After iterating
    //throught both strings we return true.
    static func isIsomorphic(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {
            return false
        }
        
        var p = 0
        var mappingSToT = [Character: Character]()
        var mappingTToS = [Character: Character]()
        
        let sCharacters = Array(s)
        let tCharacters = Array(t)
        let count = sCharacters.count
        
        while p < count {
            if let mapped = mappingSToT[sCharacters[p]] {
                if mapped != tCharacters[p] {
                    return false
                }
            } else {
                mappingSToT[sCharacters[p]] = tCharacters[p]
            }
            
            if let mapped = mappingTToS[tCharacters[p]] {
                if mapped != sCharacters[p] {
                    return false
                }
            } else {
                mappingTToS[tCharacters[p]] = sCharacters[p]
            }
            
            p += 1
        }
        
        return true
    }
}
