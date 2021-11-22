//
//  Palindrome.swift
//  CodingChallenges
//
//  Created by William Boles on 06/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class Palindrome {
    
    static func isPalindrome(string: String) -> Bool {
        guard string.count > 1 else {
            return false
        }
        
        let lowercaseString = string.lowercased()
        
        var lowerIndex = lowercaseString.startIndex
        var upperIndex = lowercaseString.index(lowercaseString.endIndex, offsetBy: -1)
        
        while lowerIndex < upperIndex {
            if lowercaseString[lowerIndex] != lowercaseString[upperIndex] {
                return false
            }
            
            lowerIndex = lowercaseString.index(lowerIndex, offsetBy: 1)
            upperIndex = lowercaseString.index(upperIndex, offsetBy: -1)
        }
        
        return true
    }
}
