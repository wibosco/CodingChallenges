//
//  RemoveAllAdjacentDuplicatesInStringII.swift
//  LeetCode
//
//  Created by William Boles on 06/04/2022.
//

import Foundation

//https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string-ii/
//string
struct RemoveAllAdjacentDuplicatesInStringII {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(n)
    //stack
    //counting
    //
    //Solution Description:
    //
    static func removeDuplicates(_ s: String, _ k: Int) -> String {
        var stack = [(Character, Int)]() //character, duplicate-count
        
        for c in s {
            let duplicateCount: Int
            if stack.last?.0 == c {
                duplicateCount = (stack.last!.1 + 1)
            } else {
                duplicateCount = 1
            }
            
            if duplicateCount == k {
                for _ in 0..<(k - 1) { //final duplicate wasn't added to the stack so we need to take one away from `k`
                    _ = stack.popLast()
                }
            } else {
                stack.append((c, duplicateCount))
            }
        }
        
        return String(stack.map { $0.0 })
    }
    
    //Time: O(n^2) where n is the number of characters in `s`
    //Space: O(n)
    //in-line
    //
    //Solution Description:
    //
    static func removeDuplicatesInLine(_ s: String, _ k: Int) -> String {
        var characters = Array(s)
        var counts = [Int]()
        counts.append(1)
        
        var i = 1
        
        while i < characters.count {
            if characters[i] == characters[(i - 1)] {
                let count = counts.last ?? 1
                counts.append((count + 1))
            } else {
                counts.append(1)
            }
            
            if counts.last == k {
                let indexToRemove = i - (k - 1)
                for _ in 0..<k {
                    characters.remove(at: indexToRemove) //O(n)
                    counts.removeLast()
                }
                
                if counts.isEmpty {
                    i = 1
                    counts.append(1)
                } else {
                    i -= (k - 1)
                }
            } else {
                i += 1
            }
        }
        
        return String(characters)
    }
}
