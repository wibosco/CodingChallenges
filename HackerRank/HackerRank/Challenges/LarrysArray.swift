//
//  LarrysArray.swift
//  HackerRank
//
//  Created by William Boles on 12/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/larrys-array
final class LarrysArray {
    
    enum Sequence: Int {
        case BCA
        case CAB
        
        static let count: Int = {
            var max: Int = 0
            while Sequence(rawValue: max) != nil {
                max += 1
            }
            
            return max
        }()
    }
    
    static func canRobotSort(values: [Int]) -> Bool {
        var valuesAfterRotation = values
        
        for index in 0..<(values.count - 2) {
            valuesAfterRotation = LarrysArray.attemptToMoveValueIntoPosition(values: valuesAfterRotation, valueToMove: (index + 1))
            
            if index > 0 {
                if valuesAfterRotation[(index - 1)] > valuesAfterRotation[index] {
                    return false
                }
            }
        }
        
        if valuesAfterRotation[(valuesAfterRotation.count - 1)] > valuesAfterRotation[(valuesAfterRotation.count - 2)] {
            return true
        } else {
            return false
        }
    }
    
    static func attemptToMoveValueIntoPosition(values: [Int], valueToMove: Int) -> [Int] {
        let index = values.firstIndex(of: valueToMove)!
        
        if index == (valueToMove - 1) {
            return values
        } else {
            let indexValueShouldBeMovedTo = (valueToMove - 1)
            
            if index == (indexValueShouldBeMovedTo + 1) {
                return rotate(values: values, sequence: .BCA, startingIndex: indexValueShouldBeMovedTo)
            } else if index == (indexValueShouldBeMovedTo + 2) {
                return rotate(values: values, sequence: .CAB, startingIndex: indexValueShouldBeMovedTo)
            } else {
                let valuesAfterRotation = rotate(values: values, sequence: .CAB, startingIndex: (index - 2))
                
                return attemptToMoveValueIntoPosition(values: valuesAfterRotation, valueToMove: valueToMove)
            }
        }
    }
    
    static func rotate(values: [Int], sequence: Sequence, startingIndex: Int) -> [Int] {
        var rotatedValues = values
        
        let indexOfABeforeRotation = startingIndex
        let indexOfBBeforeRotation = startingIndex + 1
        let indexOfCBeforeRotation = startingIndex + 2
        
        switch sequence {
        case .BCA:
            let indexOfAAfterRotation = startingIndex + 2
            let indexOfBAftereRotation = startingIndex
            let indexOfCAfterRotation = startingIndex + 1
            
            rotatedValues[indexOfAAfterRotation] = values[indexOfABeforeRotation]
            rotatedValues[indexOfBAftereRotation] = values[indexOfBBeforeRotation]
            rotatedValues[indexOfCAfterRotation] = values[indexOfCBeforeRotation]
            
        case .CAB:
            let indexOfAAfterRotation = startingIndex + 1
            let indexOfBAftereRotation = startingIndex + 2
            let indexOfCAfterRotation = startingIndex
            
            rotatedValues[indexOfAAfterRotation] = values[indexOfABeforeRotation]
            rotatedValues[indexOfBAftereRotation] = values[indexOfBBeforeRotation]
            rotatedValues[indexOfCAfterRotation] = values[indexOfCBeforeRotation]
        }
        
        return rotatedValues
    }
    
    // MARK: Alt
    
    static func canRobotSortAlt(values: [Int]) -> Bool {
        let isInversionsCountOdd = (LarrysArray.countOfInversions(values: values) % 2 != 0)
        
        if isInversionsCountOdd {
            return false
        }
        
        return true
    }
    
    //https://www.cs.bham.ac.uk/~mdr/teaching/modules04/java2/TilesSolvability.html
    static func countOfInversions(values: [Int]) -> Int {
        var inversions = 0
        
        for index in 0..<values.count {
            let value = values[index]
            
            var valuesBeforeThatAreGreaterThanCurrentValue = values.count - index
            
            for previousValueIndex in 0..<index {
                let previousValue = values[previousValueIndex]
                
                if previousValue > value {
                    valuesBeforeThatAreGreaterThanCurrentValue -= 1
                }
            }
            
            inversions += ((values.count - index) - valuesBeforeThatAreGreaterThanCurrentValue)
        }
        
        return inversions
    }
}
