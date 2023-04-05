//
//  AddStrings.swift
//  LeetCode
//
//  Created by William Boles on 23/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/add-strings/
//string
struct AddStrings {
    
    //Time: O(n) where `n` is the greater of `num1` and `num2`
    //Space: O(n)
    //array
    //overflow
    //math
    //modulo
    //
    //Solution Description:
    //Rather than treating `num1` and `num2` as two single numbers instead we split them into single units and add those units
    //together, being to hold on to add carry values that result from that addition. By treating as individual unit we avoid any
    //possibility of overflow as the number ranges are 0-9 for both numbers. The result of each addition is then add to the front
    //of our ongoing `result` string
    //
    //Similar to: https://leetcode.com/problems/add-two-numbers/
    static func addStrings(_ num1: String, _ num2: String) -> String {
        guard num1 != "0" else {
            return num2
        }
        
        guard num2 != "0" else {
            return num1
        }
        
        var n1Chars = Array(num1)
        var n2Chars = Array(num2)
        
        var carry = 0
        
        var result = ""
        
        while !n1Chars.isEmpty || !n2Chars.isEmpty || carry > 0 {
            let n1Char = n1Chars.popLast() ?? "0"
            let n1Val = Int(String(n1Char))!
            
            let n2Char = n2Chars.popLast() ?? "0"
            let n2Val = Int(String(n2Char))!
            
            let sum = n1Val + n2Val + carry
            
            carry = sum / 10
            
            let val = String("\((sum % 10))")
            result = val + result
        }
        
        return result
    }
}
