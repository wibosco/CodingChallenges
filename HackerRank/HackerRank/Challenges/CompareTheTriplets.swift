//
//  CompareTheTriplets.swift
//  CodingChallenges
//
//  Created by William Boles on 03/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/compare-the-triplets/problem
struct CompareTheTriplets {
    static func score(a: [Int], b: [Int]) -> [Int] {
        guard a.count == b.count else {
            fatalError("Invalid data")
        }
        
        var aScore = 0
        var bScore = 0
        
        for index in 0..<a.count {
            let aValue = a[index]
            let bValue = b[index]
            
            if aValue > bValue {
                aScore += 1
            } else if bValue > aValue {
                bScore += 1
            }
        }
        
        return [aScore, bScore]
    }
}
