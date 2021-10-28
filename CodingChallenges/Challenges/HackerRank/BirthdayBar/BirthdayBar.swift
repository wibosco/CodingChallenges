//
//  BirthdayBar.swift
//  CodingChallenges
//
//  Created by William Boles on 28/10/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

struct BirthdayBar {
    static func birthday(s: [Int], d: Int, m: Int) -> Int {
        guard s.count >= m else {
            return 0
        }
        
        var possibilities = 0
        for index in 0...(s.count - m) {
            let segmentTotal = s[index..<(index + m)].reduce(0, +)
            if segmentTotal == d {
                possibilities += 1
            }
        }
        
        return possibilities
    }
}
