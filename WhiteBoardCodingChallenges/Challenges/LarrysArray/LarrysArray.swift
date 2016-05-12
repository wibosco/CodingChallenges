//
//  LarrysArray.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 12/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

//https://www.hackerrank.com/challenges/larrys-array
class LarrysArray: NSObject {

    enum Sequence: Int {
        case BCA
        case CAB
        
        static let count: Int = {
            
            var max: Int = 0
            while let _ = Sequence(rawValue: max) {
                
                max += 1
            }
            
            return max
        }()
    }
    
    class func canRobotSort(values: [Int]) -> Bool {
        
        let sortedValues = values.sort { (a, b) -> Bool in
            
            return b > a
        }
        
        var valuesAfterRotation = values
        
        for index in 0..<(values.count - 2) {
            
            var previousValuesAfterRotation = valuesAfterRotation
            
            for sequence in 0..<Sequence.count {
                
                let potentialValuesAfterRotation = LarrysArray.rotate(previousValuesAfterRotation, sequence: Sequence(rawValue: sequence)!, startingIndex: index)
                
                if potentialValuesAfterRotation == sortedValues {
                    
                    return true
                }
                else {
                    
                    if potentialValuesAfterRotation[0..<(index + 1)] == sortedValues[0..<(index + 1)] {
                        
                        valuesAfterRotation = potentialValuesAfterRotation
                        
                        break
                    }
                    else {
                        
                        previousValuesAfterRotation = potentialValuesAfterRotation
                    }
                }
            }
        }
        
        return false
    }
    
    class func rotate(values: [Int], sequence: Sequence, startingIndex: Int) -> [Int] {
        
        var rotatedValues = values
        
        switch sequence {
        case .BCA:
            
            let indexOfABeforeRotation = startingIndex
            let indexOfBBeforeRotation = startingIndex + 1
            let indexOfCBeforeRotation = startingIndex + 2
            
            let indexOfAAfterRotation = startingIndex + 2
            let indexOfBAftereRotation = startingIndex
            let indexOfCAfterRotation = startingIndex + 1
            
            rotatedValues[indexOfAAfterRotation] = values[indexOfABeforeRotation]
            rotatedValues[indexOfBAftereRotation] = values[indexOfBBeforeRotation]
            rotatedValues[indexOfCAfterRotation] = values[indexOfCBeforeRotation]
            
        case .CAB:
            
            let indexOfABeforeRotation = startingIndex + 2
            let indexOfBBeforeRotation = startingIndex
            let indexOfCBeforeRotation = startingIndex + 1
            
            let indexOfAAfterRotation = startingIndex + 1
            let indexOfBAftereRotation = startingIndex + 2
            let indexOfCAfterRotation = startingIndex
            
            rotatedValues[indexOfAAfterRotation] = values[indexOfABeforeRotation]
            rotatedValues[indexOfBAftereRotation] = values[indexOfBBeforeRotation]
            rotatedValues[indexOfCAfterRotation] = values[indexOfCBeforeRotation]
        }
        
        return rotatedValues
    }
}
