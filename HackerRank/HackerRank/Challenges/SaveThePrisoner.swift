//
//  SaveThePrisoner.swift
//  HackerRank
//
//  Created by William Boles on 27/10/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/save-the-prisoner/problem
struct SaveThePrisoner {
    
    static func poisonedPrisoner(_ numberOfPrisoners: Int, _ numberOfSweets: Int, _ startingPrisonerIndex: Int) -> Int {
        // `numberOfSweets` and `startingPrisonerIndex` use a numbering system that starts at 1 whereas
        // the % operation expects the numbering system to start from 0. We need to adjust
        // `numberOfSweets` and `startingPrisonerIndex` by subtracting 1 to perform the % operation
        // (this wraps the calculation around the array by working in base `numberOfPrisoners`). We then
        // need to adjust the outcome back into a numbering system that starts from 1
        (((numberOfSweets - 1) + (startingPrisonerIndex - 1)) % numberOfPrisoners) + 1
    }
}
