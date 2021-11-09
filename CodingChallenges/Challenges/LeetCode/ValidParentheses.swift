//
//  ValidParentheses.swift
//  CodingChallenges
//
//  Created by William Boles on 09/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/valid-parentheses/
struct ValidParentheses {
    static let mapping: [Character: Character] = ["(" : ")",
                                                  "{" : "}",
                                                  "[" : "]"]
    
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
