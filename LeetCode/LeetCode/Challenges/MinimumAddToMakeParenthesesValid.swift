//
//  MinimumAddToMakeParenthesesValid.swift
//  LeetCode
//
//  Created by William Boles on 11/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/minimum-add-to-make-parentheses-valid/
//string
struct MinimumAddToMakeParenthesesValid {
    
    //Time: O(n) `n` is the number of characters in `s`
    //Space: O(1)
    //counting
    //
    //Solution Description:
    //Brackets are valid if an opening bracket is paired with a later closing bracket. We can iterate through `s` and
    //count the number of unpaired brackets that we encounter. There are two scenarios that lead to an unpaired bracket:
    //encounter a closing bracket without an unpaired opening bracket being present or never encounter a closing bracket
    //for an unpaired opening bracket. We can track both scenarios by keeping count of the number of unpaired brackets we
    //come across - adjusting the count when a suspected unpaired bracket meets its partner). It's interesting to note
    //that only an unpaired opening bracket can later be paired so `unpairedOpeningBracket` can increase and decrease
    //whereas `unpairedClosingBracket` can only increase. After having iterated through `s` we then add the number of
    //unpaired opening brackets to the number of unpaired closing brackets and return as the number of additions needed
    static func minAddToMakeValid(_ s: String) -> Int {
        var unpairedOpeningBracket = 0
        var unpairedClosingBracket = 0
        
        for c in s {
            if c == ")" {
                if unpairedOpeningBracket == 0 { //right bracket but no left to pair with
                    unpairedClosingBracket += 1
                } else {
                    unpairedOpeningBracket -= 1
                }
            } else {
                unpairedOpeningBracket += 1
            }
        }
        
        return unpairedOpeningBracket + unpairedClosingBracket
    }
    
    //Time: O(n) `n` is the number of characters in `s`
    //Space: O(n) `n` is the number of characters in `s`
    //stack
    //
    //Solution Description:
    //Using a stack, traverse `s` attempting to match brackets i.e. for "(" there must be a closing ")" later in the `s`.
    //Once we get the end of `s` any elements in the stack don't have a opening/closing bracket in the correct sequence
    //so we would need to add that number of opening/closing brackets to balance the exisitng brackets.
    static func minAddToMakeValidStack(_ s: String) -> Int {
        var stack = [Character]()
        
        for c in s {
            if c == ")" {
                if stack.last == "(" {
                    stack.removeLast()
                } else {
                    stack.append(c)
                }
            } else {
                stack.append(c)
            }
        }
        
        return stack.count
    }
}
