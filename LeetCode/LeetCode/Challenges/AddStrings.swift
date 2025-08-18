//
//  AddStrings.swift
//  LeetCode
//
//  Created by William Boles on 23/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/add-strings/
struct AddStrings {
    
    //Time: O(n) where n is the greater of `num1` and `num2`
    //Space: O(n)
    //string
    //array
    //overflow
    //math
    //modulo
    //
    //Solution Description:
    //To avoid overflow, rather than treating `num1` and `num2` as two single numbers instead we split them into digits and
    //calculate the sum by adding those digits together. As `num1` and `num2` can have different lengths when suming their
    //digits we need to start from the end of both to ensure that the digits being summed are of the same "weight". After
    //summing the value we extract the unit from the sum using integer division and add it to `result` and extract the `carry`
    //value from the sum using a modulo operation. With any addition, the sum might be greater than 9 so we need to need to
    //hold any `carry` value to use in the next iteration. While there are still values in either `num1` or `num2` to be added
    //or carry is greater than 0 we loop. If `num1` or `num2` is out of digits we default it's value to 0. The result of each
    //addition is then appended to the `total` array. Once all digits in `num1` and `num2` have been processed and carry is
    //equal to 0, we reverse the `total` array, converted it to a string and return it.
    //
    //Similar to: https://leetcode.com/problems/add-two-numbers/
    func addStrings(_ num1: String, _ num2: String) -> String {
        let num1 = Array(num1)
        let num2 = Array(num2)

        var total = [Int]()

        var p1 = num1.count - 1
        var p2 = num2.count - 1

        var carry = 0

        while p1 >= 0 || p2 >= 0 || carry > 0 {
            let d1 = p1 >= 0 ? num1[p1].wholeNumberValue! : 0
            let d2 = p2 >= 0 ? num2[p2].wholeNumberValue! : 0

            let sum = d1 + d2 + carry

            let digit = sum % 10
            carry = sum / 10

            total.append(digit)

            p1 -= 1
            p2 -= 1
        }

        var result = ""

        var p3 = total.count - 1
        while p3 >= 0 {
            result += "\(total[p3])"
            p3 -= 1
        }

        return result
    }
    
    //Time: O(n) where n is the greater of `num1` and `num2`
    //Space: O(n)
    //string
    //array
    //overflow
    //math
    //modulo
    //
    //Solution Description:
    //To avoid overflow, rather than treating `num1` and `num2` as two single numbers instead we split them into digits and
    //calculate the sum by adding those digits together. As `num1` and `num2` can have different lengths when suming their
    //digits we need to start from the end of both to ensure that the digits being summed are of the same "weight". After
    //summing the value we extract the unit from the sum using integer division and add it to `result` and extract the `carry`
    //value from the sum using a modulo operation. With any addition, the sum might be greater than 9 so we need to need to
    //hold any `carry` value to use in the next iteration. While there are still values in either `num1` or `num2` to be added
    //or carry is greater than 0 we loop. If `num1` or `num2` is out of digits we default it's value to 0. The result of each
    //addition is then placed at the front of our ongoing `result` string. Once all digits in `num1` and `num2` have been
    //processed and carry is equal to 0 we return `result`.
    //
    //Similar to: https://leetcode.com/problems/add-two-numbers/
    func addStrings2(_ num1: String, _ num2: String) -> String {
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
            
            carry = sum / 10 //ignore the units column
            
            let val = String("\((sum % 10))") //ignore the tens column
            result = val + result
        }
        
        return result
    }
}
