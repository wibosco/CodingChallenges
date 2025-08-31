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
    //and vice-versa. It is neccessarily to have to seperate mappings from `s` to `t` and `t` to `s` as a character in `s`
    //might map to a different character in `t`, than the same character in `t` maps to in `s` e.g.
    //
    // s = "paper", t = "title"
    //
    //In the above example, the `e` in `s` maps to `l` in `t` however the `e` in `t` maps to `r` in `s`.
    //
    //Using one pointer, `p`, we iterate through both `s` and `t` and use the characters we find at each index to compare
    //against any previous times we have encountered those character. If we have previously encountered those characters we
    //add them to `mappingSToT` and `mappingTToS` with the correct key and value configuration; if we have previously
    //encountered either of those characters we check to make sure it was in the presence of both the characters, if either
    //mapping is to a different character we return false. After iterating through both strings we return true.
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
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
    
    //Time: O(n) where n is length of either `s` or `t`
    //Space: O(n)
    //string
    //dictionary
    //
    //Solution Description:
    //Using a dictionary we can ensure that the characters in `s` are consistently mapped to the same characters in `t` and
    //vice-versa. It is neccessarily to have to seperate mappings from `s` to `t` and `t` to `s` as a character in `s` might
    //map to a different character in `t`, than the same character in `t` maps to in `s` e.g.
    //
    // s = "paper", t = "title"
    //
    //In the above example, the `e` in `s` maps to `l` in `t` however the `e` in `t` maps to `r` in `s`.
    //
    //First we check that mapping from `s` to `t` is valid. We do this by iterating through both `s` and `t` and use the
    //characters we find at each index to compare against against any previous mapping that may exist. If we haven't
    //previously encountered that mapping we add it to `mapping`; if we have previously encountered that mapping we check to
    //make sure it the previous mapping matches the current mapping, if the current mapping is to a different we return false.
    //We now repeat this process for mapping from `t` to `s`. If both mappings are valid, we return true else we return false.
    func isIsomorphic2(_ s: String, _ t: String) -> Bool {
        var mapping = [Character: Character]()

        let s = Array(s)
        let t = Array(t)

        return canMap(s, t) && canMap(t, s)
    }

    private func canMap(_ a: [Character], _ b: [Character]) -> Bool {
        var mapping = [Character: Character]()

        var p1 = 0

        while p1 < a.count {
            if let mappedTo = mapping[a[p1]] {
                if mappedTo != b[p1] {
                    return false
                }
            } else {
                mapping[a[p1]] = b[p1]
            }

            p1 += 1
        }

        return true
    }
}
