//
//  MaximumNumberOfBalloons.swift
//  LeetCode
//
//  Created by William Boles on 09/07/2023.
//

import Foundation

//https://leetcode.com/problems/maximum-number-of-balloons/
//array
struct MaximumNumberOfBalloons {
    
    //Time: O(n) where n is the number of characters in `text`
    //Space: O(n)
    //dictionary
    //
    //Solution Description:
    //Iterating through `text` we count the occurrence of each letter. As we are only interested in the word `balloon` we
    //extract the minimum value of those characters as the maximum number of the word `balloon` that are in `text` - we
    //take the minimum as all letters need to be present to assemble a `balloon`, so if any letter is missing we need to
    //throw the full word away. The interesting part of this challenge is that not all letters in `ballon` have the same
    //frequency - `l` and `o` appear twice, the rest only once. This means that when determining the minimum we need to
    //reduce the value of `l` and `o` by dividing them by 2.
    static func maxNumberOfBalloons(_ text: String) -> Int {
        var frequency = [Character: Int]() //[letter: count]
        
        for c in text {
            frequency[c, default: 0] += 1
        }
        
        let bCount = frequency["b"] ?? 0
        let aCount = frequency["a"] ?? 0
        let lCount = (frequency["l"] ?? 0) / 2
        let oCount = (frequency["o"] ?? 0) / 2
        let nCount = frequency["n"] ?? 0
        
        return min(bCount,
                   aCount,
                   lCount,
                   oCount,
                   nCount)
    }
}
