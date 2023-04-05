//
//  BuddyStrings.swift
//  LeetCode
//
//  Created by William Boles on 13/04/2022.
//

import Foundation

//https://leetcode.com/problems/buddy-strings/
//string
struct BuddyStrings {
    
    //Time: O(n) where `n` is the number of characters in `s`/`goal`
    //Space: O(n)
    //dictionary
    //sorting
    //
    //Solution Description:
    //In order for `s` to be a buddy of `goal`, both strings need to be the same length, contain the same characters and
    //at most have 2 mismatched characters. We determine this by iterating through `s` and `goal` and compare the
    //characters found at each index to see if they match. If the characters don't match we increment `mismatches`, if
    //`mismatches` ever gets above 2 then we have too many mismatches for a single character switch to resolve so
    //`mismatches` ever becomes >= 3 we can return earlier. As well as comparing mismatches we also track which characters
    //are in each string and how frequently those characters appear. After iterating through `s` and `goal` we iterate
    //through both `sFrequency` and `goalFrequency` and ensure that everything matches. There is an edge case here where
    //`aa` == `aa` should return true so below we handle this through checking that there are no mismatches but there are
    //duplicates that can be switched to keep `s` matching `goal`
    static func buddyStrings(_ s: String, _ goal: String) -> Bool {
        guard s.count == goal.count else {
            return false
        }
        
        let sChars = Array(s)
        let goalChars = Array(goal)
        
        var sFrequency = [Character: Int]()
        var goalFrequency = [Character: Int]()
        
        var mismatches = 0
        var containsDuplicates = false
        
        for i in 0..<sChars.count {
            guard mismatches < 3 else {
                return false
            }
            
            if sChars[i] != goalChars[i] {
                mismatches += 1
            }
            
            sFrequency[sChars[i], default: 0] += 1
            goalFrequency[goalChars[i], default: 0] += 1
        }
        
        for (key, sCount) in sFrequency {
            if let goalCount = goalFrequency[key] {
                if sCount != goalCount {
                    return false
                } else {
                    containsDuplicates = sCount >= 2 ? true : containsDuplicates
                }
            } else {
                return false
            }
        }
        
        return mismatches == 2 || (containsDuplicates && mismatches == 0)
    }
}
