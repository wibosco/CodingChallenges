//
//  RomanToInteger.swift
//  LeetCode
//
//  Created by William Boles on 08/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/roman-to-integer/
struct RomanToInteger {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(n)
    //string
    //dictionary
    //
    //Solution Description:
    //The key insight here is that with roman numerals the previous value/digit should never be smaller than the current
    //value/digit. If it is smaller then an individual value but a "compound" value that needs to be combined with the
    //current value to get the actual value e.g. "IV", the "I" is less than the "V" which means that the "I" isn't valid
    //in this context on its own but instead needs to be combined with the "V" to give us "4" rather than "15".
    //
    //So we can use this property of roman numerals to iterate through `s` from left-to-right and convert each character
    //into the decuimal system. This converted decimal value we can then just add directly to our running total - `total`.
    //If we discover on the next conversion that actually the previous conversion is of a lesser value then we remove the
    //lesser value from `total` twice - once to remove the false addition and the next removal to remove it from the current
    //decimal conversion value e.g. for "IV" we first added 1 to `total` then we encountered the "V" so we need to remove
    //that false addition which results in `total` == `0` and then remove another 1 before we apply the "V" so that rather
    //than increasing `total` by 5 we correctly increase it by 4 (`IV` == 4).
    static func romanToInt(_ s: String) -> Int {
        let mapping: [Character: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]
        
        let characters = Array(s) //O(n)
        
        var total = mapping[characters[0]]!
        
        for index in 1..<characters.count {
            let currentValue = mapping[characters[index]]!
            let previousValue = mapping[characters[(index - 1)]]!
            
            if currentValue > previousValue {
                // Need to remove the previous falsely added value and then the current values substitution
                // Think about IX (9), we prevously added 1 and now we have a current value of X (10) in
                // order to get the correct value of 9 we need to remove 1 twice
                total -= (2 * previousValue)
            }
            
            total += currentValue
        }
        
        return total
    }
}
