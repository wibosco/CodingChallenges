//
//  PlusOne.swift
//  LeetCode
//
//  Created by William Boles on 16/03/2022.
//

import Foundation

//https://leetcode.com/problems/plus-one/
struct PlusOne {
    
    //Time: O(n) where n is the number of elements in `digits`
    //Space: O(n)
    //array
    //modulo
    //
    //Solution Description:
    //Iterating `digits` in reverse order we first set up `carry` to hold a value of 1 (that we want to add) then we
    //add `carry` to the value at `i` (the last element in the array here). We then set `i` to be `val`s unit value
    //(e.g if we had 9 + 1 which is 10 we set `digits[i]` to 0) and set `carry` to be using an integer division (e.g.
    //if we had 9 + 1 which is 10 then the new `carry` is 1). As long as carry isn't 0 then we repeat the process for
    //subsequent values of `i`. We also need to handle the scenario where we have updated all the values in `digits`
    //still have a non-zero carry value, in this case we add that carry to the start of `digits`
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        var i = digits.count - 1
        var carry = 1
        
        while i >= 0 && carry > 0 {
            var val = digits[i]
            val += carry
            digits[i] = (val % 10)
            carry = val / 10
            
            i -= 1
        }
        
        digits = carry > 0 ? [carry] + digits : digits
        
        return digits
    }
}
