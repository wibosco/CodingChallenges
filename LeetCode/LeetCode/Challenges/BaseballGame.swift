//
//  BaseballGame.swift
//  LeetCode
//
//  Created by William Boles on 28/07/2023.
//

import Foundation

//https://leetcode.com/problems/baseball-game/
struct BaseballGame {
    
    //Time: O(n) where n is the number of elements in `operations`
    //Space: O(n)
    //array
    //stack
    //
    //Solution Description:
    //We iterate through the elements in `operations` and using a stack place each number that we come across into that stack. As
    //we encounter the other possible operations we remove and manipulate the values in the stack. Once all operations have been
    //processed we sum the remaining values in the stack and return it.
    func calPoints(_ operations: [String]) -> Int {
        var stack = [Int]()
        
        for operation in operations {
            if let value = Int(operation) {
                stack.append(value)
            } else if operation == "+" {
                let value1 = stack.removeLast()
                let value2 = stack.removeLast()
                let sum = value1 + value2
                
                stack.append(value2)
                stack.append(value1)
                stack.append(sum)
            } else if operation == "D" {
                let value = stack.removeLast()
                let product = 2 * value
            
                stack.append(value)
                stack.append(product)
            } else if operation == "C" {
                stack.removeLast()
            }
        }
        
        let sum = stack.reduce(0, +)
        
        return sum
    }
}
