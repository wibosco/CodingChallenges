//
//  MinMaxSum.swift
//  CodingChallenges
//
//  Created by William Boles on 27/10/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/mini-max-sum/problem
class MinMaxSum {
    
    static func minMaxSum(_ arr: [UInt]) -> (UInt, UInt) {
        guard arr.count == 5 else {
            fatalError("Invalid test data")
        }
        
        var minSum = UInt.max
        var maxSum = UInt.min
        var index = 0
        
        while index != arr.count {
            var total: UInt = 0
            for offset in 0...3 {
                total += arr[(index + offset) % 5]
            }
            
            minSum = min(minSum, total)
            maxSum = max(maxSum, total)
            
            index += 1
        }
        
        return (minSum, maxSum)
    }
    
    static func minMaxSumAlt(_ arr: [UInt]) -> (UInt, UInt) {
        guard arr.count == 5 else {
            fatalError("Invalid test data")
        }
        
        let sortedArray = arr.sorted(by: <)
        let minSum = sortedArray[0...3].reduce(0, +)
        let maxSum = sortedArray[1...4].reduce(0, +)
        
        return (minSum, maxSum)
    }
}
