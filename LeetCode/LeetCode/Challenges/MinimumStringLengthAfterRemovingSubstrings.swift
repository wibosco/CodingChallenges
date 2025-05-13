// Created 11/05/2025.

import Foundation

//https://leetcode.com/problems/minimum-string-length-after-removing-substrings/
struct MinimumStringLengthAfterRemovingSubstrings {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(n)
    //stack
    //string
    //array
    //
    //Solution Description:
    //AS we iterate through `s` we can use a stack to find any pairs. A stack allows us not just to compare elements that
    //result in a pair directly in `s` but also pairs that may be created by deleting a previous pair that sat in between
    //them e.g. `CACDB` becomes `C` without any pointer manipulation. As we iterate through `s` we check if the current
    //character might be in removable pair. If the current character isn't in a removable pair we add it to the stack. If
    //the current character is in the removable pair we check if the head of the stack is match for that character. If it
    //is we pop the stack and skip adding the current character to the stack; if it isn't we add the current chracter to
    //the stack. Once all characters in `s` have been checked we return the count of the stack as these are the minimum
    //string length.
    //
    //Similar to: https://leetcode.com/problems/valid-parentheses/
    //Similar to: https://leetcode.com/problems/ternary-expression-parser/
    func minLength(_ s: String) -> Int {
        let pairs: [Character: Character] = ["B": "A",
                                             "D": "C"]
        
        var stack = [Character]()
        
        for c in Array(s) {
            if let match = pairs[c] {
                guard let last = stack.last, last == match else {
                    stack.append(c)
                    continue
                }
                
                stack.removeLast()
            } else {
                stack.append(c)
            }
        }
        
        return stack.count
    }
}
