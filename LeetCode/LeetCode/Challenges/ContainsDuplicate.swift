//
//  ContainsDuplicate.swift
//  LeetCode
//
//  Created by William Boles on 08/04/2023.
//

import Foundation

//https://leetcode.com/problems/contains-duplicate/
//array
struct ContainsDuplicate {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n)
    //set
    //
    //Solution Description:
    //As we iterate through `nums` we store each element we come across in `seen`. As `seen` is it `Set` it allows O(1) access so
    //whenever we encounter a new element we check if it already in `seen`. If it is in `seen` we have a duplicate and can
    //immediately exit and return true; if it isn't in `seen` we add to `seen` and continue onto the next element. If we iterate
    //through all the elements in `nums` we return false as it contains no duplicates.
    static func containsDuplicate(_ nums: [Int]) -> Bool {
        var seen = Set<Int>()
        
        for num in nums {
            guard !seen.contains(num) else {
                return true
            }
            
            seen.insert(num)
        }
        
        return false
    }
}
