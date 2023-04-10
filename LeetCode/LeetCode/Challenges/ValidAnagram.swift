//
//  ValidAnagram.swift
//  LeetCode
//
//  Created by William Boles on 10/04/2023.
//

import Foundation

//https://leetcode.com/problems/valid-anagram/
//string
struct ValidAnagram {
    
    //Time: O(n+m) `n` is the number of characters in `s`, `m` is the number of characters in `t`
    //Space: O(n+m)
    //dictionary
    //
    //Solution Description:
    //Iterate through `s` and `t` and store the frequency of each character in `sFrequency` and `tFrequency` respectively.
    //Compare `sFrequency` and `tFrequency` to check if they match.
    static func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {
            return false
        }
        
        var sFrequency = [Character: Int]()
        var tFrequency = [Character: Int]()
        
        for c in s {
            sFrequency[c, default: 0] += 1
        }
        
        for c in t {
            tFrequency[c, default: 0] += 1
        }
        
        return tFrequency == sFrequency
    }
    
    //Time: O(n+m) `n` is the number of characters in `s`, `m` is the number of characters in `t`
    //Space: O(n+m)
    //dictionary
    //
    //Solution Description:
    //Iterate through `s` and `t` and store the frequency of each character in `sFrequency` and `tFrequency` respectively.
    //Compare `sFrequency` and `tFrequency` to check if they match.
    static func isAnagram3Loops(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {
            return false
        }
        
        var frequency = [Character: Int]()
        
        for c in s {
            frequency[c, default: 0] += 1
        }
        
        for c in t {
            guard let count = frequency[c], count > 0 else {
                return false
            }
            
            frequency[c] = (count - 1)
        }
        
        return true
    }
}
