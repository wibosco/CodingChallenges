//
//  InsertionSort.swift
//  WhiteBoardCodingChallenges
//
//  Created by Boles on 15/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

//https://www.hackerrank.com/challenges/runningtime
class RunningTime: NSObject {
    
    class func numberOfShiftsToSort(array: [Int]) -> Int {
        
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
                }
                else {
                    
                    break
                }
            }
        }
        
        return numberOfShiftsToSort

    }
}
