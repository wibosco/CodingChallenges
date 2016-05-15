//
//  InsertionSort.swift
//  WhiteBoardCodingChallenges
//
//  Created by Home on 15/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class InsertionSort: NSObject {

    //https://www.hackerrank.com/challenges/insertionsort1
    class func sortRightMostElementIntoCorrectPosition(array: [Int]) -> [[Int]] {
        
        var intermediateSteps = [[Int]]()
        
        let valueToBeSorted = array.last!
        var intermediateStep = array
        
        for index in (0..<(array.count - 1)).reverse() {
            
            intermediateStep[index + 1] = intermediateStep[index]
            
            intermediateSteps.append(intermediateStep)
            
            if index > 0 {
                
                if valueToBeSorted > intermediateStep[index - 1] {
                    
                    intermediateStep[index] = valueToBeSorted
                    
                    intermediateSteps.append(intermediateStep)
                    
                    break
                }
            }
            else {
                
                intermediateStep[index] = valueToBeSorted
                intermediateSteps.append(intermediateStep)
            }
        }
        
        return intermediateSteps
    }
    
    //https://www.hackerrank.com/challenges/insertionsort2
    class func sort(array: [Int]) -> [[Int]] {
        
        var sortedSteps = [[Int]]()
        var sortingArray = array
        
        for index in 1..<array.count {
            
            let value = array[index]
            
            for sortingIndex in (0..<index).reverse() {
                
                let comparisonValue = sortingArray[sortingIndex]
                
                if comparisonValue > value {
                    
                    sortingArray[sortingIndex] = value
                    sortingArray[sortingIndex + 1] = comparisonValue
                }
                else {
                    
                    break
                }
            }
            
            sortedSteps.append(sortingArray)
        }
        
        return sortedSteps
    }
}
