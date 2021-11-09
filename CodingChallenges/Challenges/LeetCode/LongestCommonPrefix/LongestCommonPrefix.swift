//
//  LongestCommonPrefix.swift
//  CodingChallenges
//
//  Created by William Boles on 08/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/longest-common-prefix/
struct LongestCommonPrefix {
    //0(n^2)
    static func longestCommonPrefix(_ strs: [String]) -> String {
        let charactersArray = strs.map { Array($0) }
        
        var prefix = charactersArray[0]
        
        for characters in charactersArray[1...] {
            var currentCommonPrefix = [Character]()
            let count = min(prefix.count, characters.count)
            for index in 0..<count  {
                guard characters[index] == prefix[index] else {
                    break
                }

                currentCommonPrefix.append(characters[index])
            }
            
            prefix = currentCommonPrefix
            
            if prefix.isEmpty {
                break
            }
        }
        
        return String(prefix)
    }
}
