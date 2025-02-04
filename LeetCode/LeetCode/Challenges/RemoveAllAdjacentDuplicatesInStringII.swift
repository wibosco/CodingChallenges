//
//  RemoveAllAdjacentDuplicatesInStringII.swift
//  LeetCode
//
//  Created by William Boles on 06/04/2022.
//

import Foundation

//https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string-ii/
struct RemoveAllAdjacentDuplicatesInStringII {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(n)
    //string
    //stack
    //counting
    //
    //Solution Description:
    //As we iterate through `s` we store the characters that we come across in `stack` alongside their duplicate count
    //value. We need to store the duplicate count value in the stack as it is possible that when we start removing/popping
    //duplicates from the stack characters that are the same but not directly beside each other in `s` will come together.
    //By storing the duplicate value in the stack we make it possible to determine if that coming-together has resulted in
    //`k` duplicates now being side-by-side without having to recount the stack for the current `s` value. Once we encounter
    //a `duplicateCount` value that matches `k` we pop those duplicates off the stack.
    func removeDuplicates(_ s: String, _ k: Int) -> String {
        var stack = [(Character, Int)]() //(character, duplicate-count)
        
        for c in s {
            let duplicateCount: Int
            if stack.last?.0 == c {
                duplicateCount = (stack.last!.1 + 1)
            } else {
                duplicateCount = 1 //new character, reset count
            }
            
            if duplicateCount == k {
                stack.removeLast((k - 1)) //final duplicate wasn't added to the stack so we need to take one away from `k`
            } else {
                stack.append((c, duplicateCount))
            }
        }
        
        return String(stack.map { $0.0 })
    }
    
    //Time: O(n^2) where n is the number of characters in `s`
    //Space: O(n)
    //string
    //in-line
    //
    //Solution Description:
    //Using a `counts` array we keep track of the duplicate count for the character in `s` that is at the `counts` index.
    //When a `counts` value equals `k` we remove the duplicate characters in `s` until `k` duplicates are gon, we also
    //remove `k` elements from `counts` to keep them in sync. We repeat this process until all of `s` is processed.
    //Special must be taken to reset `i` back to a value before `k` elements where removed.
    func removeDuplicatesInLine(_ s: String, _ k: Int) -> String {
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
