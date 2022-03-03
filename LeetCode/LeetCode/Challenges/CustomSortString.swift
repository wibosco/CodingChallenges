//
//  CustomSortString.swift
//  CodingChallenges
//
//  Created by William Boles on 17/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/custom-sort-string/
//string
struct CustomSortString {
    
    //Time: O(n + m) where `n` is the number of characters in `order` and `m` is the number of characters in `s`
    //Space: O(m)
    //array
    //sorting
    //counting
    //
    //Solution Description:
    //We build a dictionary containing the count of each character in `s`. We then go through the characters of`order` and
    //when a character of `order` appears in `countings` we add it n-times to our ordered array `orderedS`. Finally any
    //characters that appear in `s` but not in `order` are apended to the end of `orderedS` (careful to add them the
    //number of times they apeear in `s`).
    static func customSortString(_ order: String, _ s: String) -> String {
        guard s.count > 1 else {
            return s
        }
        
        var countings = [Character: Int]()
        for c in s { //O(m)
            countings[c, default: 0] += 1
        }
        
        var orderedS = [Character]()
        for c in order { //O(n)
            guard let count = countings[c] else {
                continue
            }
            
            orderedS += Array(repeating: c, count: count)
            countings[c] = nil //remove `c` from dictionary to allow us to handle non-ordered chars later on
        }
        
        //remaining characters that are not in the `order` string
        let sortedCountings = countings.sorted { $0.key < $1.key } //only need to do this so unit tests are consistent
        for keyValue in sortedCountings {
            orderedS += Array(repeating: keyValue.key, count: keyValue.value)
        }
        
        return String(orderedS)
    }
    
    //Time: O(n * m^2) where `n` is the number of characters in order and `m` is the number of characters in `s`
    //Space: O(n + m)
    //array
    //sorting
    //
    //Solution Description:
    //We build a dictinary containing the count of each character in `order`. We build up two arrays of character when iterating
    //through `s`, if the character appears in `order` we determine where it should go in relation to characters already added to
    //`orderedS` an insert it. If it doesn't then we append it to `others`. Finally we concatenate `orderedS` and `others` to get
    //the final string ordering
    static func customSortStringLooping(_ order: String, _ s: String) -> String {
        guard s.count > 1 else {
            return s
        }
        
        var ordering = [Character: Int]()
        for (i, c) in order.enumerated() { // O(n)
            ordering[c] = i
        }
        
        var others = [Character]()
        var orderedS = [Character]()
        
        for c1 in s { // O(m^2)
            guard let orderingIndex = ordering[c1] else {
                others.append(c1)
                continue
            }
            
            var inserted = false
            for (i, c2) in orderedS.enumerated() {
                if orderingIndex < ordering[c2]! {
                    inserted = true
                    orderedS.insert(c1, at: i)
                    break
                }
            }
            
            if !inserted {
                orderedS.append(c1)
            }
        }
        
        return String((orderedS + others))
    }
}
