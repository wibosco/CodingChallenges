//
//  Kaprekar.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 12/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

//https://www.hackerrank.com/challenges/kaprekar-numbers
class Kaprekar: NSObject {

    class func kaprekarRange(lowerBounds: Int, upperBounds: Int) -> [Int] {
        
        var kaprekarRange = [Int]()
        
        for i in lowerBounds...upperBounds {
            
            let squaredValue = i * i
            let squaredString = String(squaredValue)
            
            let leftCharacterCount = Int(floor(Double(squaredString.characters.count) / 2.0))

            var leftValue = 0
            
            if squaredString.characters.count > 1 {
                
                leftValue = Int(squaredString.substringToIndex(squaredString.characters.startIndex.advancedBy(leftCharacterCount)))!
            }
            
            let rightValue = Int(squaredString.substringFromIndex(squaredString.characters.startIndex.advancedBy(leftCharacterCount)))!
            
            if (leftValue + rightValue) == i {
                
                kaprekarRange.append(i)
            }
        }
        
        return kaprekarRange
    }
}
