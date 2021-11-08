//
//  LetterCombinations.swift
//  CodingChallenges
//
//  Created by William Boles on 08/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/letter-combinations-of-a-phone-number/
struct LetterCombinations {
    static let keypad: [Character: [Character]] = ["2" : ["a", "b", "c"],
                                                    "3" : ["d", "e", "f"],
                                                    "4" : ["g", "h", "i"],
                                                    "5" : ["j", "k", "l"],
                                                    "6" : ["m", "n", "o"],
                                                    "7" : ["p", "q", "r", "s"],
                                                    "8" : ["t", "u", "v"],
                                                    "9" : ["w", "x", "y", "z"]]
    
    static func letterCombinations(_ digits: String) -> [String] {
        guard !digits.isEmpty else {
            return []
        }
        
        var permutations = [""]//Empty string so that the array had one element
        
        for digit in digits {
            var tmp = [String]()
            let letters = keypad[digit]!
            for permutation in permutations {
//                print("permutation: \(permutation)")
                for letter in letters {
//                    print("letter: \(letter)")
                    //Add letter.count number of new permutations to the existing premutation value
                    tmp.append("\(permutation)\(letter)")
                }
//                print("tmp: \(tmp)")
//                print("")
            }
            permutations = tmp //throw away out permutations as newer ones have been generated from new digit
        }
        
        return permutations
    }
}
