//
//  MinimumAddToMakeParenthesesValid.swift
//  CodingChallenges
//
//  Created by William Boles on 11/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/minimum-add-to-make-parentheses-valid/
//string
struct MinimumAddToMakeParenthesesValid {
    
    //Time: O(n) where `n` is the number of characters in `s`
    //Space: O(n) where `n` is the number of characters in `s`
    //stack
    //
    //Solution Description:
    //Using a stack, traverse `s` attempting to match brackets i.e. for "(" there must be a closing ")" later in the
    //`s`. Once we get the end of `s` any elements in the stack don't have a opening/closing bracket in the correct
    //squence so we would need to add that number of opening/closing brackets to balance the exisitng brackets.
    static func minAddToMakeValid(_ s: String) -> Int {
        let characters = Array(s)
        
        var stack = [Character]()
        
        for c in characters {
            if c == ")" {                
                if stack.last == "(" {
                    stack.removeLast()
                } else {
                    stack.append(c)
                }
            } else {
                stack.append(c)
            }
        }
        
        return stack.count
    }
}
