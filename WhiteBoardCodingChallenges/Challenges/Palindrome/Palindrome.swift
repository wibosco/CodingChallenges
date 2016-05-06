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
        
        if string.characters.count < 2 {
            
            return false
        }
        
        let lowercaseString = string.lowercaseString
        
        var lowerIndex = lowercaseString.startIndex
        var upperIndex = lowercaseString.endIndex.advancedBy(-1)
        
        while lowerIndex < upperIndex {
            
            if lowercaseString[lowerIndex] != lowercaseString[upperIndex] {
                
                return false
            }
            
            lowerIndex = lowerIndex.advancedBy(1)
            upperIndex = upperIndex.advancedBy(-1)
        }
        
        return true
    }
}
