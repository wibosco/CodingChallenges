// Created 13/05/2025.

import Foundation

//https://leetcode.com/problems/ternary-expression-parser/
struct TernaryExpressionParser {
    
    //Time: O(n) where n is the number of characters in `expression`
    //Space: O(n)
    //stack
    //array
    //string
    //
    //Solution Description:
    //Going from  right to left we add each number or letter character we encounter to a stack until we encounter a `?`
    //character, we then use the next character to which of the branches of the ternary expression is correct and pop
    //off the previous two elements in the stack before re-adding the correct one. This re-adding allows the outcome of
    //one ternary expression to be used in another one. As we continue to iterate through `expression`, ternary
    //expressions start being resolved and collasping allows outer expression to also be redsolved. We repeat this
    //process until all expression are resolved and `stack` contains only one element which is then returned.
    //
    //Similar to: https://leetcode.com/problems/valid-parentheses/
    //Similar to: https://leetcode.com/problems/minimum-string-length-after-removing-substrings/
    func parseTernary(_ expression: String) -> String {
        var stack = [Character]()
        
        var solve = false
        for c in expression.reversed() {
            guard c != "?", c != ":" else {
                solve = c == "?"
                continue
            }
            
            if solve {
                if c == "T" {
                    let value = stack.removeLast()
                    stack.removeLast()
                    
                    stack.append(value)
                } else {
                    stack.removeLast()
                    let value = stack.removeLast()
                    
                    stack.append(value)
                }
                
                solve = false
            } else {
                stack.append(c)
            }
        }
        
        return String(stack[0])
    }
}
