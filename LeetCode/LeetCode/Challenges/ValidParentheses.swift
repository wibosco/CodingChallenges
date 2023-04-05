//
//  ValidParentheses.swift
//  LeetCode
//
//  Created by William Boles on 09/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/valid-parentheses/
//string
struct ValidParentheses {
    static let mapping: [Character: Character] = ["(": ")",
                                                  "{": "}",
                                                  "[": "]"]
    
    //Time: O(n)
    //Space: O(n)
    //dictionary
    //stack
    //
    //Solution Description:
    //Iterate through the characters in `s` we build a stack contains opening parentheses. Whenever we encounter a closing
    //parentheses we pop the last element off the stack and check that is a partner to the closing parentheses. If it is
    //then that pair is valid and we continue on to the next character; if it isn't then (or there are no elements in the
    //stack) then we know that `s` isn't valid and can immediately return false. After we have processed all elements in
    //`s`, we need to check that the stack is empty to determine if `s` is valid
    static func isValid(_ s: String) -> Bool {
        guard s.count % 2 == 0 else { //valid parentheses needs to come in pairs so `s` can't have an odd count
            return false
        }
        
        var stack = [Character]()
        for c in s {
            if mapping[c] != nil { //check if `c` is a closing parentheses
                stack.append(c) //add opening parentheses to the stack
            } else if let popped = stack.popLast() { //check that the stack isn't empty
                if c !=  mapping[popped] {  //check that the popped element is an opening match for `c`
                    return false
                }
            } else {
                return false //closing parentheses can only come after a non-paired opening parentheses
            }
        }
        
        return stack.isEmpty
    }
}
