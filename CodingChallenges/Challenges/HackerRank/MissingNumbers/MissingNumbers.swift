//
//  MissingNumbers.swift
//  CodingChallenges
//
//  Created by William Boles on 12/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

//https://www.hackerrank.com/challenges/missing-numbers/problem
class MissingNumbers {
    
    // MARK: Missing
    
    static func missingNumbers(arr: [Int], brr: [Int]) -> [Int] {
        var arrOccurrences = [Int: Int]()
        var brrOccurrences = [Int: Int]()
        
        for element in arr {
            if let existingCount = arrOccurrences[element] {
                arrOccurrences[element] = existingCount + 1
            } else {
                arrOccurrences[element] = 1
            }
        }
        
        for element in brr {
            if let existingCount = brrOccurrences[element] {
                brrOccurrences[element] = existingCount + 1
            } else {
                brrOccurrences[element] = 1
            }
        }
        
        var missing = [Int]()
        for key in brrOccurrences.keys {
            if brrOccurrences[key] != arrOccurrences[key] {
                missing.append(key)
            }
        }
        
        return missing.sorted(by: <)
    }
    
    static func missingNumbersAlt(arr: [Int], brr: [Int]) -> [Int] {
        var occurrences = [Int: Int]()
        for value in brr {
            occurrences[value] = (nil == occurrences[value]) ? 1 : occurrences[value]! + 1
        }
        
        for value in arr {
            occurrences[value] = (occurrences[value]! - 1)
            if occurrences[value] == 0 {
                occurrences.removeValue(forKey: value)
            }
        }
        
        return occurrences.keys.sorted(by: <)
    }
}

