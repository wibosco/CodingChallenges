// Created 02/09/2024.

import Foundation

//https://leetcode.com/problems/backspace-string-compare/
struct BackspaceStringCompare {
    
    //Time: O(n + m) where n is the number of characters in `s`
    //               where m is the number of characters in `t`
    //Space: O(n + m)
    //string
    //array
    //stack
    //
    //Solution Description:
    //Using two stacks we iterate through `s` and `t` - when we encounter a non "#" character we add it to the stack, when we 
    //encounter a "#" character we pop the last element in the stack. Once all characters in `s` and `t` have been trimmed we
    //compare the stacks to determine if they are the same.
    func backspaceCompare(_ s: String, _ t: String) -> Bool {
        let trimmedS = trim(s)
        let trimmedT = trim(t)
        
        return trimmedS == trimmedT
    }
    
    private func trim(_ s: String) -> [Character] {
        var trimmed = [Character]()
        
        for c in s {
            if c == "#" {
                _ = trimmed.popLast()
            } else {
                trimmed.append(c)
            }
        }
        
        return trimmed
    }
}
