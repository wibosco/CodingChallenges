// Created 15/05/2016.

import Foundation

//https://www.hackerrank.com/challenges/insertionsort1
final class InsertionSort1 {
    
     static func sortRightMostElementIntoCorrectPosition(array: [Int]) -> [[Int]] {
        var intermediateSteps = [[Int]]()
        
        let valueToBeSorted = array.last!
        var intermediateStep = array
        
        for index in (0..<(array.count - 1)).reversed() {
            intermediateStep[index + 1] = intermediateStep[index]
            intermediateSteps.append(intermediateStep)
            
            if index > 0 {
                if valueToBeSorted > intermediateStep[index - 1] {
                    intermediateStep[index] = valueToBeSorted
                    intermediateSteps.append(intermediateStep)
                    
                    break
                }
            } else {
                intermediateStep[index] = valueToBeSorted
                intermediateSteps.append(intermediateStep)
            }
        }
        
        return intermediateSteps
    }
}
