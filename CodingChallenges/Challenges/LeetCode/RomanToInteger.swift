//
//  RomanToInteger.swift
//  CodingChallenges
//
//  Created by William Boles on 08/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

struct RomanToInteger {
    
    //O(n)
    static func romanToInt(_ s: String) -> Int {
        let romanNumerals: [Character: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]
        
        let characters = Array(s)
        var int = romanNumerals[characters[0]]!
        for index in 1..<characters.count {
            let currentValue = romanNumerals[characters[index]]!
            let previousValue = romanNumerals[characters[(index - 1)]]!
            
            if currentValue > previousValue {
                // Need to remove the previous falsely added value and then the current values substitution
                // Think about IX (9), we prevously added 1 and now we have a current value of X (10) in
                // order to get the correct value of 9 we need to remove 1 twice
                int -= 2 * previousValue
            }
            
            int += currentValue
        }
        
        return int
    }
}
