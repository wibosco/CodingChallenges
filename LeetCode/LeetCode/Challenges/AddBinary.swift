//
//  AddBinary.swift
//  LeetCode
//
//  Created by William Boles on 16/03/2022.
//

import Foundation

//https://leetcode.com/problems/add-binary/
//string
struct AddBinary {
    
    //Time: O(n + m) where `n` is the number of character in `a`, `m` is the number of characters in `b`
    //Space: O(n + m)
    //array
    //
    //Solution Description:
    //By reversing `a` and `b` we are able to iterate through both and ensure that we are adding the correct units from both
    //together. As binary uses base 2 we need to handle the scenario where adding two values results in a value greater than
    //1 to handle this we add the modulo 2 of the sum as the `ith` element in `sum` and hold any remainder as a carry value
    //to be applied to the next unit. We continue iterating until we have exhausted both `a` and `b` and have a carry value
    //of 0
    static func addBinary(_ a: String, _ b: String) -> String {
        var sum = ""
        
        let aChars = Array(a.reversed())
        let bChars = Array(b.reversed())
        
        var carry = 0
        var i = 0
        
        let aCount = aChars.count
        let bCount = bChars.count
        
        while i < aCount || i < bCount || carry > 0 {
            let aVal = i < aChars.count ? Int(String(aChars[i]))! : 0
            let bVal = i < bChars.count ? Int(String(bChars[i]))! : 0
            
            let sumVal = aVal + bVal + carry
            sum = String((sumVal % 2)) + sum
            carry = sumVal / 2
            
            i += 1
        }
        
        return sum
    }
}
