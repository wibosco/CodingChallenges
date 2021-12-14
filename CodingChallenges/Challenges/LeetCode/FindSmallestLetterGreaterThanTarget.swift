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
    
    //Time: O(log n)
    //Space: O(1)
    //binary search
    //
    //Solution Description:
    //As `letters` is sorted, we use binary search to iterate through the array. At the end `left`
    //should either contain the index value we are looking for or `letter.count` if that value
    //does not exist. 
    static func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        var left = 0
        var right = letters.count - 1

        while left <= right {
            let mid = left + (right - left) / 2
            if letters[mid] > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }

        //no need to test for == inside the loop as left will end up on index if == exists
        //if target is greater than all letters, then left will have the value of `letter.count`
        //so by using modulo here we loop that round to `0` which is the expected outcome in that
        //scenario
        return letters[(left % letters.count)]
    }
    
    //Time: O(n)
    //Space: O(1)
    //
    //Solution Description:
    //Loop throught the letters, checking in each iteration if it is greater than the target
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
