// Created 12/05/2025.

import Foundation

//https://leetcode.com/problems/check-if-word-is-valid-after-substitutions/
struct CheckIfWordIsValidAfterSubstitutions {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(n)
    //stack
    //string
    //array
    //
    //Solution Description:
    //Using a stack we are able to determine if `s` is valid by checking what is at the top of the stack when we encounter a
    //`c`. Every `c` in the stack must be preceeded immediately by `b` and a `a`. If `b` and `a` are at the top of the stack
    //they are popped and the next character in `s` is checked; if `b` and `a` are not at the top of the stack, we return
    //false. Using a stack allows seperated potential `abc` combinations to be compared as those in between are removed from
    //the stack. Once all characters in `s` are processed,, we return whether the stack is empty or not.
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        
        for c in s {
            if c == "c" {
                guard let last = stack.popLast(), last == "b" else {
                    return false
                }
                
                guard let last = stack.popLast(), last == "a" else {
                    return false
                }
                
            } else {
                stack.append(c)
            }
        }
        
        return stack.isEmpty
    }
}
