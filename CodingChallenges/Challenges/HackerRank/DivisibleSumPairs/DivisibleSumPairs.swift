//
//  DivisibleSumPairs.swift
//  CodingChallenges
//
//  Created by William Boles on 28/10/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/divisible-sum-pairs/problem
struct DivisibleSumPairs {
    static func divisibleSumPairs(k: Int, ar: [Int]) -> Int {
        //Pair does not need to be beside each other
        
        var pairs = 0
        for (i, v1) in ar.enumerated() {
            for v2 in ar.suffix(from: (i + 1)) where ((v1 + v2) % k == 0) {
                pairs += 1
            }
        }
        
        return pairs
    }
}
