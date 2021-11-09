//
//  Battleship.swift
//  CodingChallenges
//
//  Created by William Boles on 09/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

struct Battleship {
    static func hitProbability(r: Int, c: Int, g: [[Int]]) -> Double {
        let totalCells = r * c
        let occupiedCells = g.reduce([], +).filter { $0 == 1 }.count
        
        return Double(occupiedCells)/Double(totalCells)
    }
}
