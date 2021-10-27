
//
//  Summing.swift
//  WhiteBoardCodingChallenges
//
//  Created by Boles on 07/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class Summing: NSObject {
    
    //https://www.hackerrank.com/challenges/simple-array-sum
    class func sum(array: [Int]) -> Int {
        
        var sum = 0
        
        for value in array {
            
            sum = sum + value
        }
        
        return sum
    }
    
    //https://www.hackerrank.com/challenges/a-very-big-sum
    class func sumLargeValue(array: [Double]) -> Double {
        
        var sum: Double = 0
        
        for value in array {
            
            sum = sum + value
        }
        
        return sum
    }
    
    //https://www.hackerrank.com/challenges/diagonal-difference
    class func sumMatrixDiagonals(matrix: [[Int]]) -> Int {
        
        var sumOfRightDiagonal = 0
        var sumOfLeftDiagonal = 0
        
        let finalElementIndex = (matrix.count - 1)
        
        for index in 0..<matrix.count {
            
            let row = matrix[index]
            
            let rightDiagonalElement = row[index]
            sumOfRightDiagonal = sumOfRightDiagonal + rightDiagonalElement
            
            let leftDiagonalelement = row[(finalElementIndex - index)]
            sumOfLeftDiagonal = sumOfLeftDiagonal + leftDiagonalelement
        }
        
        return abs(sumOfRightDiagonal - sumOfLeftDiagonal)
    }
}
