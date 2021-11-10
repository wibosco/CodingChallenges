//
//  LetterCombinations.swift
//  CodingChallenges
//
//  Created by William Boles on 08/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/letter-combinations-of-a-phone-number/
//dictionary
//backtracking (DFS)
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
        
        var combinations = [String]()
        backtrack(&combinations, digits: digits, value: "", digitIndex: 0)
        
        return combinations
    }
    
    static func backtrack(_ array: inout [String], digits: String, value: String, digitIndex: Int) {
        //Goal
        guard digitIndex < digits.count else {
            array.append(value)
            return
        }
        
        let index = digits.index(digits.startIndex, offsetBy: digitIndex)
        let letters = keypad[digits[index]]!
        for letter in letters { //Choice
            backtrack(&array,  digits: digits, value: value + String(letter), digitIndex: (digitIndex + 1))
        }
    }
    
    //O(n^3)
    static func lettercAlt(_ digits: String) -> [String] {
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
