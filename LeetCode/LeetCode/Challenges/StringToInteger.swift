//
//  StringToInteger.swift
//  LeetCode
//
//  Created by William Boles on 08/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/string-to-integer-atoi/
//string
struct StringToInteger {
    
    //Time: O(n) `n` is the number of characters in `s`
    //Space: O(1)
    //overflow
    //underflow
    //array
    //math
    //
    //Solution Description:
    //Converting from a string an int comes with strict conditions below we enforce them. First we check for white space at
    //the start of the `s` and increment `index` until we find something that isn't white space. Next we check if the
    //character at `index` is a sign ("+" is optional but should be treated as the default if no sign is present). If it is a
    //"+" or "-" we set `sign` to be either `1` or `-1` respectively. Next we iterate through the rest of `s`. First we check
    //if `c` is a number if so we apply the `sign` to `num`; if not we break and return what `result` contains. Next we check
    //if adding `num` to `result` will cause and overflow or underflow. For overflow we first check if can shift `result` up
    //by 10 by checking if it is already greater than `Int32.max / 10` i.e. we shift the Int32.max down. If `result` is
    //greater than `Int32.max / 10` then any shift by 10 will result in an overflow. We need to be careful on the edge where
    //`result` is equal to `Int32.max / 10` as we can shift by 10 without an overflow but adding certain `num` values will
    //still result in an overflow - if adding `digit` would overflow. We repeat this process for `Int32.min` but checking for
    //underflow. If both checkes pass we shift `result` by 10 an add `num`. We repeat this process until we reach the end of
    //`s` or we enounter a non-number `c`.
    static func myAtoi(_ s: String) -> Int {
        var result = 0
        var sign = 1 //positive is the default
        var index = 0
        
        let characters = Array(s)
        
        //move past whitespace
        while index < characters.count && characters[index] == " " { //NB: index out of range check
            index += 1
        }
        
        //determine if sign exists
        if index < characters.count && (characters[index] == "+" || characters[index] == "-") { //NB: index out of range check
            if characters[index] == "-" {
                sign = -1
            }
            index += 1
        }
        
        for c in characters[index...] {
            guard var num = c.wholeNumberValue else {
                break
            }
            
            num *= sign
            
            if result > (Int32.max / 10) || (result == (Int32.max / 10) && num > (Int32.max % 10)) {
                result = Int(Int32.max)
                break
            } else if result < Int32.min/10 || (result == (Int32.min / 10) && num < (Int32.min % 10)) {
                result = Int(Int32.min)
                break
            }
            
            result *= 10
            result += num
        }
        
        return result
    }
}
