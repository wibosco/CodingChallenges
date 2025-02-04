//
//  GenerateParentheses.swift
//  LeetCode
//
//  Created by William Boles on 10/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/generate-parentheses/
struct GenerateParentheses {
    
    //Time: O(2^n) where n is the depth of the tree and 2 is the branches at each level
    //Space: O(n) where n is the number of pairs of parentheses
    //string
    //recursive
    //backtracking
    //
    //Solution Description:
    //Using backtracking we explore each possible combination of "(" and ")". To avoid having to use extra space by
    //generating an array containing `n` opening brackets and `n` closing brackets we instead use counters for opening
    //and closing can still be added to an existing combination - as will as saving space this approach also allows
    //us to easily determine if a bracket combination is valid but ensuring we never add an unmatched closing bracket.
    //During the combination generation at level we check if we have any remaining brackets to use. If we don't we
    //add `current` to our `combinations` array as `current` will have `n` pairs. If we do we check if we have the
    //opening bracket balance we above 0 and we spend 1 opening bracket, next we check if the closing bracket balance
    //is greater than the opening bracket balance i.e. we need to match up some opening brackets, if it is greater we
    //add a closing bracket; if it isn't we skip over (this happens when the current branch won't result in a valid
    //bracket combination and that branch should be abandoned).
    //
    //See: https://www.youtube.com/watch?v=sz1qaKt0KGQ for more info
    func generateParenthesis(_ n: Int) -> [String] {
        var parentheses = [String]()
        
        backtrack(&parentheses, "", n, n)
        
        return parentheses
    }
    
    private func backtrack(_ combinations: inout [String], _ current: String, _ remainingOpenCount: Int, _ remainingClosedCount: Int) {
        //Goal
        guard remainingOpenCount > 0 || remainingClosedCount > 0 else {
            combinations.append(current)
            return
        }
        
        //Choice - whether to add an "(" or ")"
        
        //Constraint 1 - can't add more than `n` "("
        if remainingOpenCount > 0 {
            backtrack(&combinations, current + "(", (remainingOpenCount - 1), remainingClosedCount)
        }
        
        //Constraint 2 - can't add a ")" before a "("
        if remainingClosedCount > remainingOpenCount {
            backtrack(&combinations, current + ")", remainingOpenCount, (remainingClosedCount - 1))
        }
    }
}
