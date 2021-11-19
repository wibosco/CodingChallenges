//
//  FindSmallestLetterGreaterThanTarget.swift
//  CodingChallenges
//
//  Created by William Boles on 19/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/find-smallest-letter-greater-than-target/
struct FindSmallestLetterGreaterThanTarget {
    //O(log n)
    //binary search
    static func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        var left = 0
        var right = letters.count

        while left < right {
            let mid = left + (right - left) / 2
            if letters[mid] > target {
                right = mid
            } else {
                left = mid + 1
            }
        }

        return letters[(left % letters.count)] //no need to test for == inside the loop as left will end up on index if == exists
    }
    
    //O(n)
    static func nextGreatestLetterLinear(_ letters: [Character], _ target: Character) -> Character {
        for letter in letters {
            //no need to check if target is greater than (letter - 1)
            //as just by being in this iteration shows that to be true
            if letter > target {
                return letter
            }
        }
        
        return letters[0]
    }
}
