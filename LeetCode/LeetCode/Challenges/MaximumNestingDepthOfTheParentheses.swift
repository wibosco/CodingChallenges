// Created 11/05/2025.

import Foundation

//https://leetcode.com/problems/maximum-nesting-depth-of-the-parentheses/
struct MaximumNestingDepthOfTheParentheses {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(1)
    //string
    //array
    //
    //Solution Description:
    //Assigning a value to each parentheses we can determine how deep a parentheses nesting is by adding those values. So  "(" is
    //+1 and ")" ai -1. After each "(" we compare the depth against the current max depth. If depth is larger we overwrite the
    //`maxDepth` value. Once all characters in `s` have been processed we return `maxDepth`.
    func maxDepth(_ s: String) -> Int {
        var maxDepth = 0
        var depth = 0
        
        for c in Array(s) {
            if c == "(" {
                depth += 1
                
                maxDepth = max(maxDepth, depth)
            } else if c == ")" {
                depth -= 1
            }
        }
        
        return maxDepth
    }
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(n)
    //stack
    //string
    //array
    //
    //Solution Description:
    //We can use a stack to know how deep the current parentheses nesting is - everytime we encounter `(` we push onto the
    //stack and everytime we encounter ")" we pop from the stack. At each push we compare the stack size against the current
    //max depth. If the stack is larger we overwrite the `maxDepth` value. Once all characters in `s` have been processed we
    //return `maxDepth`.
    func maxDepth2(_ s: String) -> Int {
        var maxDepth = 0
        var stack = [Character]()
        
        for c in Array(s) {
            if c == "(" {
                stack.append(c)
                
                maxDepth = max(maxDepth, stack.count)
            } else if c == ")" {
                _ = stack.popLast()
            }
        }
        
        return maxDepth
    }
}
