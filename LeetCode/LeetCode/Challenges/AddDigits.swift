//
//  AddDigits.swift
//  LeetCode
//
//  Created by William Boles on 31/03/2023.
//

import Foundation

//https://leetcode.com/problems/add-digits/
struct AddDigits {
    
    //Time: O(1)
    //Space: O(1)
    //string
    //math
    //digital root
    //modulo
    //
    //Solution Description:
    //"Digital root" is the term used to describe the the value you get when recursively summing the digits in a number until you
    //get to one digit. Rather than recursively summing we are able use the modulo operation to jump straight to the digital root.
    //
    //N.B. https://en.wikipedia.org/wiki/Digital_root
    func addDigits(_ num: Int) -> Int {
        if num == 0 {
            return num
        } else if num % 9 == 0 {
            return 9
        } else {
            return num % 9
        }
    }
    
    //Time: O(n) where n is the number of digits in `num`
    //Space: O(s) where `s` is the number of sums from `num`
    //array
    //recursive
    //modulo
    //
    //Solution Description:
    //"Digital root" is the term used to describe the the value you get when recursively summing the digits in a
    //number until you get to one digit. First break `num` down into individual digits and then sum those digits.
    //If the sum is less than 10 then you have the final result and can return it; if the sum is greater than 9
    //then you repeat the break down process.
    func addDigitsRecursive(_ num: Int) -> Int {
        var num = num
        
        while num > 9 {
            num = addIntermediateDigits(num)
        }
        
        return num
    }
    
    private func addIntermediateDigits(_ num: Int) -> Int {
        guard num > 9 else {
            return num
        }
        
        let digit = (num % 10)
        let num = num / 10
        
        return digit + addIntermediateDigits(num)
    }
}
