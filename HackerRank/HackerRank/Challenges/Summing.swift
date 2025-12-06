// Created 07/05/2016.

import Foundation

final class Summing {
    
    //https://www.hackerrank.com/challenges/simple-array-sum
     static func sum(array: [Int]) -> Int {
        var sum = 0
        
        for value in array {
            sum += value
        }
        
        return sum
    }
    
    //https://www.hackerrank.com/challenges/a-very-big-sum
     static func sumLargeValue(array: [Double]) -> Double {
        var sum: Double = 0
        
        for value in array {
            
            sum += value
        }
        
        return sum
    }
    
    //https://www.hackerrank.com/challenges/diagonal-difference
     static func sumMatrixDiagonals(matrix: [[Int]]) -> Int {
        var sumOfRightDiagonal = 0
        var sumOfLeftDiagonal = 0
        
        let finalElementIndex = (matrix.count - 1)
        
        for index in 0..<matrix.count {
            let row = matrix[index]
            
            let rightDiagonalElement = row[index]
            sumOfRightDiagonal += rightDiagonalElement
            
            let leftDiagonalElement = row[(finalElementIndex - index)]
            sumOfLeftDiagonal += leftDiagonalElement
        }
        
        return abs(sumOfRightDiagonal - sumOfLeftDiagonal)
    }
}
