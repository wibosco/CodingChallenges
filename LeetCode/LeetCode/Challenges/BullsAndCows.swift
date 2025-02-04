//
//  BullsAndCows.swift
//  LeetCode
//
//  Created by William Boles on 01/04/2023.
//

import Foundation

//https://leetcode.com/problems/bulls-and-cows/
struct BullsAndCows {
    
    //Time: O(n) where n is the number of elements in `secret`/`guess` (both should match)
    //Space: O(n)
    //string
    //dictionary
    //
    //Solution Description:
    //First we iterate through both `secret` and `guess` and compare each character at the same position against each other. If
    //the characters match then we have found a `bull` and can increment `bullCount`; if they don't match we have potentially
    //found `cows` and we add each to `nonMatchingSecret` and `nonMatchingGuess`. Once all bulls have been found, we use the
    //keys of `nonMatchingGuess` to find at `cow` characters. As each `cow` character must be paired between `nonMatchingSecret`
    //and `nonMatchingGuess` we take the min of the counts that we collected as this will only include the pairing regardless
    //of which dictionary holds the smaller count. Finally we format and return the counts.
    func getHint(_ secret: String, _ guess: String) -> String {
        var bullCount = 0
        var cowCount = 0

        var nonMatchingSecret = [Character: Int]()
        var nonMatchingGuess = [Character: Int]()

        for (sChar, gChar) in zip(secret, guess) {
            guard sChar != gChar else {
                bullCount += 1
                continue
            }

            nonMatchingSecret[sChar, default: 0] += 1
            nonMatchingGuess[gChar, default: 0] += 1
        }

        for (key, val) in nonMatchingGuess {
            cowCount += min(nonMatchingSecret[key, default: 0], val)
        }

        return "\(bullCount)A\(cowCount)B"
    }
}
