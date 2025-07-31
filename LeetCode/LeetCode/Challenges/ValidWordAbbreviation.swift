//
//  ValidWordAbbreviation.swift
//  LeetCode
//
//  Created by William Boles on 23/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/valid-word-abbreviation/
struct ValidWordAbbreviation {
    
    //Time: O(n) where n is the number of characters in `abbr`
    //Space: O(m) where m is the number of characters in `word`
    //string
    //array
    //two pointers
    //
    //Solution Description:
    //Iterate through both the `abbr` and `word` strings comparing elements to ensure they match. Where needed build a string
    //stack `num` to hold any numbers that we find. At the end, make sure that the pointer used for iterating the `word`
    //string matches the length of `word`
    func validWordAbbreviation(_ word: String, _ abbr: String) -> Bool {
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
    
    //Time: O(n) where n is the number of characters in `abbr`
    //Space: O(n + m) where m is the number of characters in `word`
    //string
    //array
    //two pointers
    //
    //Solution Description:
    //Iterate through both the `abbr` and `word` strings comparing elements to ensure they match. Where needed convert a
    //numeric string into an Int. At the end, make sure that the pointers used are both at the end of their
    //string.
    func validWordAbbreviation2(_ word: String, _ abbr: String) -> Bool {
        var wordPointer = 0
        var abbrPointer = 0

        let word = Array(word)
        let abbr = Array(abbr)

        while wordPointer < word.count, abbrPointer < abbr.count {
            var count = 0
            while abbrPointer < abbr.count && abbr[abbrPointer].isNumber {
                if count == 0 && abbr[abbrPointer] == "0" { //leading zero
                    return false
                }
                count *= 10
                count += Int(String(abbr[abbrPointer]))!

                abbrPointer += 1
            }

            wordPointer += count

            if wordPointer == word.count && abbrPointer == abbr.count {
                return true
            } else if wordPointer >= word.count {
                return false
            } else if abbrPointer >= abbr.count {
                return false
            } else if word[wordPointer] != abbr[abbrPointer] {
                return false
            }
            
            abbrPointer += 1
            wordPointer += 1
        }

        return wordPointer == word.count && abbrPointer == abbr.count
    }
}
