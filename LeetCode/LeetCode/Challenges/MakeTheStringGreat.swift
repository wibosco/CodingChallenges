// Created 11/05/2025.

import Foundation

//https://leetcode.com/problems/make-the-string-great/
struct MakeTheStringGreat {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(n)
    //stack
    //array
    //string
    //
    //Solution Description:
    //Using a stack we can iterate through all the push or pop elements from the stack depending on if the current character
    //is a uppercase/lowercase match for the last element in the stack. If the current is a match we pop from the stack; if
    //it isn't a match we push it the stack. When all characters have been processed, the stack will contain the filtered
    //string which can then be returned.
    func makeGood(_ s: String) -> String {
        var stack = [Character]()
        
        for c in s {
            guard let last = stack.last else {
                stack.append(c)
                continue
            }
            
            if  last != c &&
                 (last.uppercased() == String(c) || last.lowercased() == String(c)) {
                stack.removeLast()
            } else {
                stack.append(c)
            }
        }
        
        return String(stack)
    }
}
