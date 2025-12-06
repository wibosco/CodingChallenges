// Created 07/05/2016.

import Foundation

//https://www.hackerrank.com/challenges/plus-minus
final class Percentages {

     static func percentageOfUniqueSets(array: [Int]) -> (positivePercentage: Double, negativePercentage: Double, zeroPercentage: Double) {
        
        var positivesCount = 0
        var negativesCount = 0
        var zerosCount = 0
        
        for value in array {
            if  value < 0 {
                negativesCount += 1
            } else if value > 0 {
                positivesCount += 1
            } else {
                zerosCount += 1
            }
        }
        
        let positivesPercentage = Double(positivesCount)/Double(array.count)
        let negativesPercentage = Double(negativesCount)/Double(array.count)
        let zerosPercentage = Double(zerosCount)/Double(array.count)
        
        return (positivesPercentage, negativesPercentage, zerosPercentage)
    }
}
