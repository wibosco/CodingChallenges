//
//  Palindrome.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 06/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class Palindrome: NSObject {

    class func isPalindrome(string: String) -> Bool {
        if string.count < 2 {
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
