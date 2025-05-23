//
//  BasicCalculatorII.swift
//  LeetCode
//
//  Created by William Boles on 28/02/2022.
//

import Foundation

//https://leetcode.com/problems/basic-calculator-ii/

struct BasicCalculatorII {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(n) where n is the number of characters in `s`
    //array
    //stack
    //string
    //
    //Solution Description:
    //Using BODMAS (Brackets, Orders, Division, Multiplication, Addition, Subtraction) we know that division and multiplication
    //should be processed before addition and subtraction. In order to process `s` correctly we need to "park" any addition and
    //subtraction operations until after all division and multiplication operations are complete. We can use a stack for this.
    //First we iterate through `s` converting the string values into int values. If we encounter a "+" or "-" we store those
    //values into the `stack` (with the subtraction operation value being stored a negative as adding a negative is the same as
    //directly subtracting - we will see this later); if we encounter a "*" or "/" we process those straight away by popping the
    //last value from the stack - the result of that operation is then stored in the `stack` to be used later. As we only process
    //the stack when an operation symbol is encountered special care must be taken for the last value of `s` to ensure it is
    //processed - we do this by checking if `i` equals the count of `s` and processing the `currentValue` right there and then.
    //Once we have processed all division and multiplication operations we then iterate through all the elements in the stack and
    //add them together giving us the final result.
    //
    //NB. We are processing the operation after we "parse" the second value in the operation by processing the operation symbol
    //after we encounter the next one (or the end of `s`).
    func calculate(_ s: String) -> Int {
        var stack = [Int]()
        
        var currentValue = 0
        var operation = Character("+")
        let characters = Array(s)
        
        for i in 0..<characters.count {
            let c =  characters[i]
            
            if let num = c.wholeNumberValue {
                currentValue *= 10
                currentValue += num
            }
            
            //can't be an `else if` because we need to handle the case where the `currentValue` is the end of calculation
            //need to process `c != " "` so don't skip the last value if it has empty space after it
            if (!c.isNumber && c != " ") || (i == (characters.count - 1)) {
                if operation == "-" {
                    stack.append(-currentValue) //store `currentValue` as a negative so we can just add them later
                } else if operation == "+" {
                    stack.append(currentValue)
                } else if operation == "*" {
                    stack.append(stack.removeLast() * currentValue)
                } else if operation == "/" {
                    stack.append(stack.removeLast() / currentValue)
                }
                
                operation = c
                currentValue = 0
            }
        }
        
        var sum = 0
        while !stack.isEmpty { //process any addition or subtraction calculations
            sum += stack.removeLast()
        }
        
        return sum
    }
}
