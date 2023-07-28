//
//  RemovingStarsFromAString.swift
//  LeetCode
//
//  Created by William Boles on 28/07/2023.
//

import Foundation

//https://leetcode.com/problems/removing-stars-from-a-string/
struct RemovingStarsFromAString {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(n)
    //array
    //string
    //stack
    //
    //Solution Description:
    //As we iterate through `s`, if we encounter a `*` we pop the last element from the stack, if we encounter anything else
    //we add it to the stack. Once all characters in `s` have been processed we convert the stack into a string and return it.
    static func removeStars(_ s: String) -> String {
        var stack = [Character]()
        
        for c in s {
            if c == "*" {
                stack.removeLast()
            } else {
                stack.append(c)
            }
        }
        
        return String(stack)
    }
}
