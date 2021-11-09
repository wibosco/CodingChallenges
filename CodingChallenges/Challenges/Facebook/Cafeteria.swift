//
//  Cafeteria.swift
//  CodingChallenges
//
//  Created by William Boles on 09/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

struct Cafeteria {
    static func maxAdditionalDinersCount(n: Int, k: Int, m: Int, s: [Int]) -> Int {
        var seatToCheck = 1
        
        var occupiedSeats = s
        
        while seatToCheck <= n {
            var canSitHere = true
            let left = max(0, seatToCheck - k)
            let right = min(seatToCheck + k, n)
            for occupiedSeat in occupiedSeats {
                if occupiedSeat >= left &&
                    occupiedSeat <= right {
                    canSitHere = false
                    break
                }
            }
            
            if canSitHere {
                occupiedSeats.append(seatToCheck)
            }
            
            seatToCheck += 1
        }
        
        return occupiedSeats.count - s.count
    }
}
