//
//  QuickSort.swift
//  CodingChallenges
//
//  Created by William Boles on 16/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/quicksort1
final class Quicksort1Partition {
    
    // MARK: - Sort
    
    static func sort(array: [Int]) -> [Int] {
        guard !array.isEmpty else {
            return [Int]()
        }
        
        var left = [Int]()
        var right = [Int]()
        
        let pivot = array[0]
        
        for index in 1..<array.count {
            let value = array[index]
            
            if pivot > value {
                left.append(value)
            } else {
                right.append(value)
            }
        }
        
        return sort(array: left) + [pivot] + sort(array: right)
    }
    
    // MARK: - Alt
    
    static func sortFilter(array: [Int]) -> [Int] {
        guard !array.isEmpty else {
            return [Int]()
        }
        
        let pivot = array[0]
        
        let strippedArray = array[1..<array.count]
        
        let left = strippedArray.filter {$0 <= pivot}
        let right = strippedArray.filter {$0 > pivot}
        
        return sort(array: left) + [pivot] + sort(array: right)
    }
}
