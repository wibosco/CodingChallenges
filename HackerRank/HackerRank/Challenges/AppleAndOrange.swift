//
//  AppleAndOrange.swift
//  CodingChallenges
//
//  Created by William Boles on 27/10/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/apple-and-orange/problem
final class AppleAndOrange {
    static func countAppleAndOrangesHittingHouse(houseStart: Int, houseEnd: Int, appleTree: Int, orangeTree: Int, apples: [Int], oranges: [Int]) -> (Int, Int) {
        let houseRange = (houseStart...houseEnd)
        let appleHits = apples.reduce(0) { houseRange.contains(appleTree + $1) ? $0 + 1 : $0 }
        let orangeHits = oranges.reduce(0) { houseRange.contains(orangeTree + $1) ? $0 + 1 : $0 }
        
        return (appleHits, orangeHits)
    }
}
