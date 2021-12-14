//
//  MigratoryBirds.swift
//  CodingChallenges
//
//  Created by William Boles on 29/10/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/migratory-birds/problem
struct MigratoryBirds {
    static func mostFrequentBird(from arr: [Int]) -> Int {
        var countedBirds = [arr[0]: 1]
        var mostFrequentBird = arr[0]
        
        for bird in arr.suffix(from: 1) {
            countedBirds[bird, default: 0] += 1
            
            if (countedBirds[bird]! > countedBirds[mostFrequentBird]!) {
                mostFrequentBird = bird
            } else if (countedBirds[bird]! == countedBirds[mostFrequentBird]!) && (bird < mostFrequentBird) {
                mostFrequentBird = bird
            }
        }
    
        return mostFrequentBird
    }
}
