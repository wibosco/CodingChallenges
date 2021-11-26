//
//  ValidParentheses.swift
//  CodingChallenges
//
//  Created by William Boles on 09/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/valid-parentheses/
//dictionary
//stack
struct ValidParentheses {
    static let mapping: [Character: Character] = ["(" : ")",
                                                  "{" : "}",
                                                  "[" : "]"]
    
    //Time: O(n)
    //Space: O(n)
    //
    //Solution Description:
    //1. Use stack to store opening braces
    //2. When closing brace encountered, pop from stack and ensure the brace is of the same type using `mapping`. Any mismatch results in invalid
    //3. Once the string has been processed, check stack count to determine if valid
    static func isValid(_ s: String) -> Bool {
        guard s.count % 2 == 0 else {
            return false
        }
        
        var stack = [Character]()
        for c in s {
            guard mapping[c] == nil else {
                stack.append(c)
                continue
            }
            
            guard let popped = stack.popLast(), c == mapping[popped] else {
                return false
            }
        }
        
        return stack.isEmpty
    }
}
