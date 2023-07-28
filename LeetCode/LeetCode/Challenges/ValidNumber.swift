//
//  ValidNumber.swift
//  LeetCode
//
//  Created by William Boles on 12/04/2022.
//

import Foundation

//https://leetcode.com/problems/valid-number/
struct ValidNumber {
    
    //Time: O(
    //Space: O(
    //
    //Solution Description:
    //
    static func isNumber(_ s: String) -> Bool {
        let characters = Array(s)
        
        var i = 0
        var foundSign = false
        var foundDot = false
        var foundExponent = false
        var foundNumber = false
        
        if characters[0] == "+" || characters[0] == "-" {
            i += 1
        }
        
        for c in characters[i...] {
            if c == "." {
                if foundDot || foundExponent {
                    return false
                }
                
                foundDot = true
            } else if c.isWholeNumber {
                foundNumber = true
            } else if c == "e" || c == "E" {
                if foundExponent || !foundNumber {
                    return false
                }
                
                foundNumber = false
                foundExponent = true
            } else if c == "+" || c == "-" {
                if foundExponent && !foundSign && !foundNumber {
                    foundSign = true
                } else {
                    return false
                }
            } else {
                return false
            }
        }
        
        return foundNumber
    }
}
