//
//  Kangaroo.swift
//  CodingChallenges
//
//  Created by William Boles on 28/10/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/kangaroo/problem
final class Kangaroo {
    /**
      Think of it as line intersection.
        
       p = position, y = jumps, v = distance-per-jump, and x = starting position
       `p = yv + x`
       `(y * v1) + x1 = (y * v2) + x2`
       `(x1 - x2) = (y * v2) - (y * v1)`
       `(x1 - x2) = y(v2 - v1)`
       `(x1 - x2) / (v2 - v1) = y`
        
        however we are only interested on this meeting after a jump not during so
     
        `(x1 - x2) % (v2 - v1) == 0`
     */
    static func canSyncJumps(x1: Int, v1: Int, x2: Int, v2: Int) -> Bool {
        guard !((x1 > x2 && v1 >= v2) || (x2 > x1 && v2 >= v1)) else {
            return false
        }
        
        return ((x1 - x2) % (v2 - v1)) == 0
    }
}
