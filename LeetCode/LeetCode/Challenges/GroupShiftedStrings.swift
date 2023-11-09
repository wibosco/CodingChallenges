//
//  GroupShiftedStrings.swift
//  LeetCode
//
//  Created by William Boles on 29/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/group-shifted-strings/
struct GroupShiftedStrings {
    
    //Time: O(m) where m is the number of characters contains in all `stings` elements
    //Space: O(m)
    //string
    //dictionary
    //array
    //wrapping
    //
    //Solution Description:
    //For each string in `strings` we calculate the distance between each character in that string - we repeat until we
    //calculate the distance for each character in that string. We then use those distances as the key for the `groupings`
    //dictionary with the string as the value. If two strings have the same distance then it means that they have been
    //rotated the same number of times and so match - this matching string is added to the `grouping` dict under the same
    //key. At the end we extract all values as an array of strings and merged them to form the result.
    static func groupStrings(_ strings: [String]) -> [[String]] {
        guard strings.count > 1 else {
            return [strings]
        }
        
        let alphabet: [Character: Int] = ["a": 1,
                                          "b": 2,
                                          "c": 3,
                                          "d": 4,
                                          "e": 5,
                                          "f": 6,
                                          "g": 7,
                                          "h": 8,
                                          "i": 9,
                                          "j": 10,
                                          "k": 11,
                                          "l": 12,
                                          "m": 13,
                                          "n": 14,
                                          "o": 15,
                                          "p": 16,
                                          "q": 17,
                                          "r": 18,
                                          "s": 19,
                                          "t": 20,
                                          "u": 21,
                                          "v": 22,
                                          "w": 23,
                                          "x": 24,
                                          "y": 25,
                                          "z": 26]
        
        var groupings = [[Int]: [String]]()
        
        for string in strings {
            let characters = Array(string)
            var distances = [Int]()
            
            for i in 0..<(characters.count - 1) {
                let first = alphabet[characters[i]]!
                let second = alphabet[characters[(i + 1)]]!
                
                let offset = first > second ? 26 : 0 //wrap characters so that `ba` is treated the same `az`
                let distance = (second - first) + offset
                distances.append(distance)
            }
            
            //if a string only has one character we add it with an empty key
            groupings[distances, default: [String]()].append(string)
        }

        return groupings.values.compactMap { $0 }
    }
}
