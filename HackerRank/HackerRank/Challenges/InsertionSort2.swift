// Created 15/05/2016.

import Foundation

//https://www.hackerrank.com/challenges/insertionsort2
final class InsertionSort2 {

     static func sort(array: [Int]) -> [[Int]] {
        var sortedSteps = [[Int]]()
        var sortingArray = array
        
        for index in 1..<array.count {
            let value = array[index]
            
            for sortingIndex in (0..<index).reversed() {
                let comparisonValue = sortingArray[sortingIndex]
                
                if comparisonValue > value {
                    sortingArray[sortingIndex] = value
                    sortingArray[sortingIndex + 1] = comparisonValue
                } else {
                    break
                }
            }
            
            sortedSteps.append(sortingArray)
        }
        
        return sortedSteps
    }
}
