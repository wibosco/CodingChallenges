//
//  LetterCombinationsOfAPhoneNumber.swift
//  LeetCode
//
//  Created by William Boles on 08/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/letter-combinations-of-a-phone-number/
struct LetterCombinationsOfAPhoneNumber {
    static let keypad: [Character: String] = ["2": "abc",
                                              "3": "def",
                                              "4": "ghi",
                                              "5": "jkl",
                                              "6": "mno",
                                              "7": "pqrs",
                                              "8": "tuv",
                                              "9": "wxyz"]
    
    //Time: O(4^n * n) where n is the number of values in `digits` (4 is the max letters)
    //Space: O(n) where n is the number of values in `digits` (recursive stack calls)
    //string
    //dictionary
    //backtracking (DFS)
    //recursive
    //inout
    //
    //Solution Description:
    //First we map the keypad digits to letters using a dictionary - `keypad`. Then treating this problem as multiple tree
    //problems we use backtracking to iterate through all possible combinations of letters in a recursive DFS manner gradually
    //building each possible letter combination for the given number. We know that we've reached the end of combination when
    //there are no more digits to process. Eventually the recusive backtracking call will return and we can return the
    //`combinations` array
    //
    //NB: don't the `key` in space complexity as it is constant
    static func letterCombinations(_ digits: String) -> [String] {
        guard !digits.isEmpty else {
            return [String]()
        }
                   
        var combinations = [String]()
        let digits = Array(digits)
        
        backtrack(digits, 0, "", &combinations)
        
        return combinations
    }
        
    private static func backtrack(_ digits: [Character], _ index: Int, _ combination: String, _ combinations: inout [String]) {
        //Goal
        guard index < digits.count else {
            combinations.append(combination)
            return
        }
        
        let letters = keypad[digits[index]]!
        
        //Choice, this problem does not have constraints
        for letter in letters { //no need iterate through the `digits` array as we are only interested in letters
            let combination = "\(combination)\(letter)"
            backtrack(digits, (index + 1), combination, &combinations)
        }
    }
    
    //Time: O(n^3)
    //string
    static func letterCombinationsAlt(_ digits: String) -> [String] {
        guard !digits.isEmpty else {
            return []
        }
        
        var permutations = [""]//Empty string so that the array had one element
        
        for digit in digits {
            var tmp = [String]()
            let letters = keypad[digit]!
            for permutation in permutations {
                for letter in letters {
                    //Add letter.count number of new permutations to the existing premutation value
                    tmp.append("\(permutation)\(letter)")
                }
            }
            permutations = tmp //throw away out permutations as newer ones have been generated from new digit
        }
        
        return permutations
    }
}
