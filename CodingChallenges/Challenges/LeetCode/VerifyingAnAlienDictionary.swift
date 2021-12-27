//
//  VerifyingAnAlienDictionary.swift
//  CodingChallenges
//
//  Created by William Boles on 24/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/verifying-an-alien-dictionary/
//string
struct VerifyingAnAlienDictionary {
    
    //Time: O(n) where `n` is the total number of characters in the `words` array
    //Space: O(1) order always contains 26 characters
    //array
    //dictionary
    //
    //Solution Description:
    //Store the `order` in a dictionary to allow constant look up time when comparing two letters. Take each word and compare it
    //with its right neighbor by comparng each letter against the letter at the same position of the neighbor. If the if left
    //neighbor is ever greater then this ordering is incorrect and we can return false. We contine this until we run out of
    //letters in one the words. If having reached the end of one of the words without finding a difference we compare the lengths
    //with the shorter word needing to come first
    //
    //N.B. Time complexity could also be described as O(m * n) where `m` is the length of `words` and `n` the characters per word
    static func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        guard words.count > 1 else {
            return true
        }
        
        var alphabetOrdering = [Character: Int]()
        for (i, c) in order.enumerated() {
            alphabetOrdering[c] = i
        }
        
        for i in 0..<(words.count - 1) {
            let firstWord = Array(words[i])
            let secondWord = Array(words[(i + 1)])
            
            var p1 = 0
            var p2 = 0
            
            var same = true
            
            while p1 < firstWord.count && p2 < secondWord.count {
                let firstVal = alphabetOrdering[firstWord[p1]]!
                let secondVal = alphabetOrdering[secondWord[p2]]!
                
                if firstVal > secondVal {
                    return false
                } else if firstVal != secondVal {
                    same = false
                    break
                }
                
                p1 += 1
                p2 += 1
            }
            
            if same && firstWord.count > secondWord.count {
                return false
            }
        }
        
        return true
    }
}
