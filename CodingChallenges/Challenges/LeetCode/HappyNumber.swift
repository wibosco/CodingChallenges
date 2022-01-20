//
//  HappyNumber.swift
//  CodingChallenges
//
//  Created by William Boles on 20/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/happy-number/
//math
struct HappyNumber {
    
    //Time: O(log n)
    //Space: O(1)
    //linked list
    //modulo
    //
    //Solution Description:
    //Treating the possible sums as a linked list, we can use fast and slow pointers to determine if we have entered a cycle. If the two
    //pointers meet then we have entered a cycle and can return false, else we contine to check if `hare` is 1 and return true if it does
    //
    //See: https://en.wikipedia.org/wiki/Cycle_detection#Floyd's_Tortoise_and_Hare
    static func isHappy(_ n: Int) -> Bool {
        var hare = n
        var tortoise = n
        
        repeat {
            tortoise = nextValue(tortoise)
            for _ in 0..<2 {
                hare = nextValue(hare)
            }
            
            guard hare != 1 else {
                return true
            }
            
        } while hare != tortoise
        
        return false
    }
    
    private static func nextValue(_ val: Int) -> Int {
        var val = val
        var nextValue = 0
        while val > 0 {
            let digit  = val % 10
            nextValue += (digit * digit)
            
            val /= 10
        }
        
        return nextValue
    }
    
    //Time: O(log n)
    //Space: O(log n)
    //dictionary
    //modulo
    //
    //Solution Description:
    //Using a dictionary to store previously seen values we reduce `n` down to its digits, square those digits and sum them together. We then
    //check if the sum of that sum is 1. If it is 1 then we are done, the loop ends and we then true; if it is not 1 and we haven't seen the
    //value before we repeat the process. If we ever get a number that we have seen before then we have a loop and can exit by returning false
    static func isHappyDictionary(_ n: Int) -> Bool {
        var seenValues = Set<Int>()
        var val = n
        
        while val != 1 {
            guard !seenValues.contains(val) else {
                return false
            }
            
            seenValues.insert(val)
            
            var nextVal = 0
            while val > 0 {
                let digit  = val % 10
                nextVal += (digit * digit)
                
                val /= 10
            }
            val = nextVal
        }
        
        return true
    }
}
