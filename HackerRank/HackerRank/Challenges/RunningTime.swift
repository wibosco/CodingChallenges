// Created 15/05/2016.

import Foundation

//https://www.hackerrank.com/challenges/runningtime
final class RunningTime {
    
     static func numberOfShiftsToSort(array: [Int]) -> Int {
        
        var numberOfShiftsToSort = 0
        var sortingArray = array
        
        for index in 1..<array.count {
            
            let value = array[index]
            
            for sortingIndex in (0..<index).reversed() {
                
                let comparisonValue = sortingArray[sortingIndex]
                
                if comparisonValue > value {
                    
                    sortingArray[sortingIndex] = value
                    sortingArray[sortingIndex + 1] = comparisonValue
                    
                    numberOfShiftsToSort += 1
                } else {
                    
                    break
                }
            }
        }
        
        return numberOfShiftsToSort

    }
}
