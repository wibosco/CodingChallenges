//
//  PlusMinus.swift
//  HackerRank
//
//  Created by Boles on 07/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/plus-minus
final class Percentages {

     static func percentageOfUnqiueSets(array: [Int]) -> (positivePercentage: Double, negativePercentage: Double, zeroPercentage: Double) {
        
        var postivesCount = 0
        var negativesCount = 0
        var zerosCount = 0
        
        for value in array {
            if  value < 0 {
                negativesCount += 1
            } else if value > 0 {
                postivesCount += 1
            } else {
                zerosCount += 1
            }
        }
        
        let postivesPercentage = Double(postivesCount)/Double(array.count)
        let negativesPercentage = Double(negativesCount)/Double(array.count)
        let zerosPercentage = Double(zerosCount)/Double(array.count)
        
        return (postivesPercentage, negativesPercentage, zerosPercentage)
    }
}
