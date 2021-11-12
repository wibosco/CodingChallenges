//
//  GenerateParentheses.swift
//  CodingChallenges
//
//  Created by William Boles on 10/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/generate-parentheses/
//backtracking (DFS) - has three parts Choice, Constraint (optional) and Goal
struct GenerateParentheses {
    static func generateParenthesis(_ n: Int) -> [String] {
        var parentheses = [String]()
        backtrack(array: &parentheses, value: "", open: n, close: n, max: n)
        return parentheses
    }
    
    //See https://www.youtube.com/watch?v=sz1qaKt0KGQ for breakdown
    static func backtrack(array: inout [String], value: String, open: Int, close: Int, max: Int) {
        //Goal
        guard value.count != (max * 2) else { // Max is the number of pairs
            array.append(value)
            return
        }
        
        //Choice - whether to add an "(" or ")"
        if open > 0 {
            backtrack(array: &array, value: value + "(", open: (open - 1), close: close, max: max)
        }
        
        //Constraint - can't add a ")" before a "("
        if close > open {
            backtrack(array: &array, value: value + ")", open: open, close: (close - 1), max: max)
        }
    }
}
