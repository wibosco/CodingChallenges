//
//  BirthdayCakeCandles.swift
//  CodingChallenges
//
//  Created by William Boles on 27/10/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/birthday-cake-candles/problem
struct BirthdayCakeCandles {
    
    static func countOfTallestCandles(_ candles: [Int]) -> Int {
        guard !candles.isEmpty else {
            return 0
        }
        
        guard candles.count > 1 else {
            return candles[0]
        }
        
        let sortedCandles = candles.sorted(by: >)
        let filteredCandles = sortedCandles.filter { $0 == sortedCandles.first!}
        
        return filteredCandles.count
    }
}
