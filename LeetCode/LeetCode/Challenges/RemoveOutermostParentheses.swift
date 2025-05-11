// Created 11/05/2025.

import Foundation

//https://leetcode.com/problems/remove-outermost-parentheses/
struct RemoveOutermostParentheses {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(1)
    //array
    //
    //Solution Description:
    //Outer parenthesis are when there are no other open parenthesis before them. Everytime we encounter "(" we increment
    //`unclosed`, everytime we encounter ")" we decrement `unclosed`. We can determine if a "(" or ")" is part of an outer
    //parenthesis by checking if `unclosed` is zero. Any parenthesis encountered for with `unclosed` greater than 0 is added
    //to `result`. Once all characters in `s` have been checked we return result.
    func removeOuterParentheses(_ s: String) -> String {
        var unclosed = 0
        var result = ""
        
        for c in Array(s) {
            if c == "(" {
                if unclosed > 0 {
                    result += "("
                }
                
                unclosed += 1
            } else {
                unclosed -= 1
                
                if unclosed > 0 {
                    result += ")"
                }
            }
        }
        
        return result
    }
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(n)
    //stack
    //array
    //
    //Solution Description:
    //Outer parenthesis are when there are no other open parenthesis before them. Everytime we encounter "(" we add it to
    //the stack, everytime we encounter ")" we pop from the stack. We can determine if a "(" or ")" is part of an outer
    //parenthesis by checking if `the stack is empty. Any parenthesis encountered with non-empty stack is added to `result`.
    //Once all characters in `s` have been checked we return result.
    func removeOuterParentheses2(_ s: String) -> String {
        var stack = [Character]()
        var result = ""
        
        for c in Array(s) {
            if c == "(" {
                if !stack.isEmpty {
                    result += "("
                }
                
                stack.append(c)
            } else {
                _ = stack.popLast()
                
                if !stack.isEmpty {
                    result += ")"
                }
            }
        }
        
        return result
    }
}
