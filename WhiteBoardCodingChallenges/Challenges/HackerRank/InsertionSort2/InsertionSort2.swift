//
//  InsertionSort.swift
//  WhiteBoardCodingChallenges
//
//  Created by Boles on 15/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

//https://www.hackerrank.com/challenges/insertionsort2
class InsertionSort2: NSObject {

    class func sort(array: [Int]) -> [[Int]] {
        
        var sortedSteps = [[Int]]()
        var sortingArray = array
        
        for index in 1..<array.count {
            
            let value = array[index]
            
            for sortingIndex in (0..<index).reversed() {
                
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
