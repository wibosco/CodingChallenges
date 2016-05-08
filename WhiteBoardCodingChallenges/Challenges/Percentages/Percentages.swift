//
//  PlusMinus.swift
//  WhiteBoardCodingChallenges
//
//  Created by Home on 07/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

//https://www.hackerrank.com/challenges/plus-minus
class Percentages: NSObject {

    class func percentageOfUnqiueSets(array: [Int]) -> (positivePercentage: Double, negativePercentage: Double, zeroPercentage: Double) {
        
        var postivesCount = 0
        var negativesCount = 0
        var zerosCount = 0
        
        for value in array {
            
            if  value < 0 {
                
                negativesCount = negativesCount + 1
            }
            else if value > 0 {
                
                postivesCount = postivesCount + 1
            }
            else {
                
                zerosCount = zerosCount + 1
            }
        }
        
        let postivesPercentage = Double(postivesCount)/Double(array.count)
        let negativesPercentage = Double(negativesCount)/Double(array.count)
        let zerosPercentage = Double(zerosCount)/Double(array.count)
        
        return (postivesPercentage, negativesPercentage, zerosPercentage)
    }
}
