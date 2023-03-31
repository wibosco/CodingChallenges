//
//  RemoveAllAdjacentDuplicatesInString.swift
//  LeetCode
//
//  Created by William Boles on 27/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string/
//string
struct RemoveAllAdjacentDuplicatesInString {
    
    //Time: O(n) where `n` is the number of characters in `s`
    //Space: O(n - d) where `n` is the number of characters in `s` and `d` are number of duplicates
    //stack
    //
    //Solution Description:
    //Iterate through `s` inspecting each character to see if it matches the last element in `stack`. If it does match we
    //remove that last element from the stack and skip over the current character. If it doesn't match we add the character
    //to the stack. Once we have iterated through all characters in `s` we return what is still in the stack as the result.
    static func removeDuplicates(_ s: String) -> String {
        guard s.count > 1 else {
            return s
        }
        
        var stack = [Character]()
        
        for c in s {
            if let last = stack.last {
                if c == last {
                    stack.removeLast()
                } else {
                    stack.append(c)
                }
            } else {
                stack.append(c)
            }
        }
        
        return String(stack)
    }
    
    //Time: O(n^2) where `n` is the number of characters in `s`
    //Space: O(1)
    //array
    //two pointers
    //
    //Solution Description:
    //Using two pointers we iterate through `s` comparing each character with it's immediate right most character. If they
    //match we remove both characters, if they don't match we move on. Finally what is left is the result.
    static func removeDuplicatesTwoPoints(_ s: String) -> String {
        guard s.count > 1 else {
            return s
        }
        
        var p = 0
        var result = Array(s)
        
        while p < (result.count - 1)  {
            if result[p] == result[(p + 1)] {
                result.remove(at: (p + 1)) //O(n) operation
                result.remove(at: p) //O(n) operation
                
                p = max(0, p - 1)
            } else {
                p += 1
            }
        }
        
        return String(result)
    }
}
