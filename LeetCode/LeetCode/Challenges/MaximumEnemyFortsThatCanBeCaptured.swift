//
//  MaximumEnemyFortsThatCanBeCaptured.swift
//  LeetCode
//
//  Created by William Boles on 03/09/2024.
//

import Foundation

//https://leetcode.com/problems/maximum-enemy-forts-that-can-be-captured/
struct MaximumEnemyFortsThatCanBeCaptured {
    
    //Time: O(n) where n is the number of elements in `forts`
    //Space: O(1)
    //array
    //
    //Solution Description:
    //`1` and `-1` represents boundary elements around which an `0` elements encountered can be captured. However in order for
    //those captures to be valid the first boundary element needs to be paired with it's opposite. So as we iterate throught
    //`forts` whenever we encounter an enemy fort `0` we increment `currentCapturedForts`, whenever we encounter a boundary
    //element we check if it is the opposite boundary element - if it is the opposite boundary element we compare
    //`currentCapturedForts` against `maxCapturedForts` and update `maxCapturedForts`if `currentCapturedForts` is bigger. Upon
    //encountering any boundary element we reset `currentCapturedForts` and take that boundary element as the new
    //`startingBoundary` element of a new potential grouping. We repeat this process until all elements have been checked and
    //can return `maxCapturedForts`.
    func captureForts(_ forts: [Int]) -> Int {
        //-1 represents there is no fort at the ith position.
        //0 indicates there is an enemy fort at the ith position.
        //1 indicates the fort at the ith the position is under your command.
        
        var startingBoundary = 0 //0 isn't a boundary so is safe to use as an unknown
        var currentCapturedForts = 0
        var maxCapturedForts = 0
        var i = 0
        
        while i < forts.count {
            let value = forts[i]
            
            if value == 0 {
                currentCapturedForts += 1
            } else {
                if (value == -1 && startingBoundary == 1) || (value == 1 && startingBoundary == -1)  {
                    //found a matching end to our start
                    maxCapturedForts = max(maxCapturedForts, currentCapturedForts)
                }
                
                currentCapturedForts = 0
                startingBoundary = value
            }
            
            i += 1
        }
        
        return maxCapturedForts
    }
}
