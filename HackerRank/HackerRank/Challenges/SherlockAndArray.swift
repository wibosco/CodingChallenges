// Created 07/07/2016.

import Foundation

//https://www.hackerrank.com/challenges/sherlock-and-array/problem
final class SherlockAndArray {

     static func leftRightEqualityPossible(array: [Int]) -> Bool {
        if array.count < 3 {
            return false
        }
        
        var leftTotal = 0
        var total = 0
        
        for i in 0..<array.count {
            total += array[i]
        }
        
        for i in 1..<(array.count-1) {
            leftTotal += array[(i-1)]
            let rightTotal = total - (leftTotal + array[i])

            if leftTotal == rightTotal {
                return true
            }
        }
        
        return false
    }
}
