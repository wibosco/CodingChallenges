// Created 13/05/2025.

import Foundation

//https://leetcode.com/problems/score-of-parentheses/
struct ScoreOfParentheses {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(1)
    //counting
    //array
    //string
    //
    //Solution Description:
    //The depth of nesting affects how much value a `()` produces - each level of nesting doubles that value. So if we track
    //the depth of `(` brackets before we encounter a `)` we can use that depth to produce the product of `()`. We only know
    //if a `()` is innermost when we encounter the `)` immediately after `(`, which we control with `canCount`. `canCount` is
    //set to true when we encounter `(` and false when we encounter `)` so it will only be true for innermost `)` which
    //allows `score` to be updated with the innermost value. We repeat this process for all characters in `s`, returning
    //`score` once all have been processed.
    func scoreOfParentheses(_ s: String) -> Int {
        var score = 0
        var depth = 0
        var canCount = false
        
        for c in s {
            if c == ")" {
                if canCount {
                    score += Int(pow(Double(2), Double((depth - 1))))
                    canCount = false
                }
                depth -= 1
            } else {
                canCount = true
                depth += 1
            }
        }
        
        return score
    }
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(n)
    //stack
    //array
    //string
    //
    //Solution Description:
    //The depth of nesting affects how much value a `()` produces - each level of nesting doubles that value. We can track
    //the depth of `(` brackets before we encounter a `)` by push and popping `(` and `)` elements from a stack. We can use
    //the count of the stack to produce the product of `()`. We only know if a `()` is innermost when we encounter the `)`
    //immediately after `(`, which we control with `canCount`. `canCount` is set to true when we encounter `(` and false
    //when we encounter `)` so it will only be true for innermost `)` which allows `score` to be updated with the innermost
    //value. We repeat this process for all characters in `s`, returning `score` once all have been processed.
    func scoreOfParentheses2(_ s: String) -> Int {
        var score = 0
        var stack = [Character]()
        var canCount = false
        
        for c in s {
            if c == ")" {
                if canCount {
                    score += Int(pow(Double(2), Double((stack.count - 1))))
                    canCount = false
                }
                stack.removeLast()
            } else {
                canCount = true
                stack.append(c)
            }
        }
        
        return score
    }
}
