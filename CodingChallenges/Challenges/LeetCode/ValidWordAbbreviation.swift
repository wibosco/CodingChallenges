//
//  ValidWordAbbreviation.swift
//  CodingChallenges
//
//  Created by William Boles on 23/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/valid-word-abbreviation/
//string
struct ValidWordAbbreviation {
    
    //Time: O(n)
    //Space: O(1)
    //array
    //pointers
    //
    //Solution Description:
    //Iterate through both the `abbr` and `word` strings comparing elements to ensure they match. Where needed build a
    //string stack `num` to hold any numbers that we find. At the end, make sure that the pointer used for iterating the
    //`word` string matches the lenght of `word`
    static func validWordAbbreviation(_ word: String, _ abbr: String) -> Bool {
        var num = ""
        let chars = Array(word)
        var p = 0
        
        for c in abbr {
            if c.isNumber {
                if num.isEmpty && c == "0" {
                    return false
                }
                
                num += String(c)
            } else {
                p += Int(num) ?? 0
                num = ""
                
                if p >= chars.count {
                    return false
                }
                
                if chars[p] != c {
                    return false
                }
                
                p += 1
            }
        }
        
        p += Int(num) ?? 0
        
        return p == chars.count
    }
}
