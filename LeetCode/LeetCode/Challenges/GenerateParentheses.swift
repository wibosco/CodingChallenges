// Created 10/11/2021.

import Foundation

//https://leetcode.com/problems/generate-parentheses/
struct GenerateParentheses {
    
    //Time: O(2^n) where n is the depth of the tree and 2 is the branches at each level (Catalan number so actually `4^n`)
    //Space: O(n) where n is the number of pairs of parentheses
    //string
    //recursive
    //backtracking
    //Catalan number
    //
    //Solution Description:
    //Using backtracking we explore each possible combination of "(" and ")". To avoid having to use extra space by
    //generating an array containing `n` opening brackets and `n` closing brackets we instead use counters for opening
    //and closing can still be added to an existing combination - as will as saving space this approach also allows
    //us to easily determine if a bracket combination is valid but ensuring we never add an unmatched closing bracket.
    //During the combination generation at each level we check if we have any remaining brackets to use. If we don't
    //we add `current` to our `combinations` array as `current` will have `n` pairs. If we do we check if we have the
    //opening bracket balance we above 0 and we spend 1 opening bracket, next we check if the closing bracket balance
    //is greater than the opening bracket balance i.e. we need to match up some opening brackets, if it is greater we
    //add a closing bracket; if it isn't we skip over (this happens when the current branch won't result in a valid
    //bracket combination and that branch should be abandoned). As the recusrive stack unwinds we generate the
    //different combinations of opening and closing brackets. Once all valid combinations have been genereated we can
    //return `combinations`.
    //
    //See: https://www.youtube.com/watch?v=sz1qaKt0KGQ for more info
    func generateParenthesis(_ n: Int) -> [String] {
        var combination = [Character]()
        var combinations = [String]()

        dfs(&combination, n, n, &combinations)

        return combinations
    }

    private func dfs(_ current: inout [Character], _ openCount: Int, _ closeCount: Int, _ combinations: inout [String]) {
        //Goal
        guard openCount > 0 || closeCount > 0 else {
            combinations.append(String(current))
            return
        }

        //Choice - whether to add an "(" or ")"
        
        //Constraint 1 - can't add more than `n` "("
        if openCount > 0 {
            current.append("(")
            dfs(&current, (openCount - 1), closeCount, &combinations)
            current.removeLast()
        }
        
        //Constraint 2 - can't add more than `n` ")" and can't add a ")" that isn;t paired with a "("
        if closeCount > 0 && closeCount > openCount {
            current.append(")")
            dfs(&current, openCount, (closeCount - 1), &combinations)
            current.removeLast()
        }
    }
    
    //Time: O(2^n) where n is the depth of the tree and 2 is the branches at each level (Catalan number so actually `4^n`)
    //Space: O(n) where n is the number of pairs of parentheses
    //string
    //recursive
    //backtracking
    //Catalan number
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
    func generateParenthesis2(_ n: Int) -> [String] {
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
