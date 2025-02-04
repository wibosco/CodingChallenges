//
//  EvaluateReversePolishNotation.swift
//  LeetCode
//
//  Created by William Boles on 15/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/evaluate-reverse-polish-notation/
//stack
struct EvaluateReversePolishNotation {
    
    //Time: O(n) where n is number of tokens
    //Space: O(n) where n is number of tokens
    //
    //Solution Description:
    //Using a stack we add elements until we come to an operator, at which point we pop two elements from the stack
    //and apply the operator to them. The result of this calculation is then added to the stack so that it can be
    //used next iteration.
    //
    //N.B. It's important to note that order of the elements retrieved from the stack is essential for getting the
    //correct answer for division and subtraction calculations
    //
    //N.B2. You might be tempted to use a `result` variable so to only fill the stack with token elements rather
    //than it also contain the ongoing result - don't do this as trying to handle the special case which is the
    //first iteration (where you need to take two elements from the stack) and subsequent iterations (where you
    //only need to take one) leads to some very messy code for division and subtraction
    func evalRPN(_ tokens: [String]) -> Int {
        guard !tokens.isEmpty else {
            return 0
        }

        guard tokens.count > 1 else {
            return Int(tokens[0])!
        }

        var stack = [String]()
        let symbols = Set<String>(["+", "-", "*", "/"])

        for token in tokens {
            if symbols.contains(token) {
                let number2 = Int(stack.removeLast())!
                let number1 = Int(stack.removeLast())!

                var result = 0
                if token == "+" {
                    result = number1 + number2
                } else if token == "-" {
                    result = number1 - number2
                } else if token == "*" {
                    result = number1 * number2
                } else if token == "/" {
                    result = number1 / number2
                }
                stack.append("\(result)")
            } else {
                stack.append(token)
            }
        }

        return Int(stack.removeLast())!
    }
}
