//
//  MultiplyStrings.swift
//  LeetCode
//
//  Created by William Boles on 24/02/2022.
//

import Foundation

//https://leetcode.com/problems/multiply-strings/
struct MultiplyStrings {
    
    //Time: O(n * m) where n is the number of characters in `num1`
    //               where m is the number of characters in `num2`
    //Space: O(
    //graph theory
    //math
    //modulo
    //
    //Solution Description:
    //To avoid overflowing we need to treat each character as an individual numbers rather than as a whole. First we multiple
    //each number in `num1` against each number of `num2`. We need to be careful about ensuring that we also respect the carry
    //that may be produced due to that multiplication. In order to correctly perform that multiplication we need to do so from
    //less-significant to most-significant so that the carry can be applied to the next calculation. To determine the value to
    //add the product we perform an integer division of 10 against the product of that multiplication and then to determine the
    //carry we perform a modulo of 10 against that same value. Once we complete the multiplications of each number of `num1` to
    //`num2` we then need to add the products of each of those calculations together to get the final result. Addition is similar
    //process to multiplication.
    //
    //NB: see also https://leetcode.com/problems/add-two-numbers/
    static func multiply(_ num1: String, _ num2: String) -> String {
        guard num1 != "0", num2 != "0" else {
            return "0"
        }
        
        let products = buildProducts(num1, num2)
        
        guard products.count > 0 else {
            return ""
        }
        
        var result = products[0]
        for product in products[1...] {
            result = add(result, product)
        }
    
        return result
    }
    
    private static func buildProducts(_ num1: String, _ num2: String) -> [String] {
        var results = [String]()
        var trailingZeros = 0
        
        let num1 = num1.reversed() //Go less-significant to most so the carry works
        let num2 = num2.reversed()
        
        for c1 in num1 {
            var result = ""
            for _ in 0..<trailingZeros {
                result += "0"
            }
            
            var carry = 0
            for c2 in num2 {
                let num1Val = Int(String(c1))!
                let num2Val = Int(String(c2))!
                
                let product  = (num1Val * num2Val) + carry
                let val = product % 10
                carry = product / 10
                
                result = "\(val)" + result
            }
            result = carry > 0 ? "\(carry)" + result : result
            
            results.append(result)
            trailingZeros += 1
        }
        
        return results
    }
    
    private static func add(_ num1: String, _ num2: String) -> String {
        var result = ""
        
        var carry = 0
        var i = 0
        
        let num1Chars = Array(num1.reversed()) //Go less-significant to most so the carry works
        let num2Chars = Array(num2.reversed())
        
        while i < num1Chars.count || i < num2Chars.count || carry > 0 {
            let num1Val = i < num1Chars.count ? Int(String(num1Chars[i]))! : 0
            let num2Val = i < num2Chars.count ? Int(String(num2Chars[i]))! : 0
            
            let sum = num1Val + num2Val + carry
            let val = sum % 10
            carry = sum / 10
            
            result = "\(val)" + result
            
            i += 1
        }
        
        return result
    }
}
