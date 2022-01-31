//
//  StringToInteger.swift
//  CodingChallenges
//
//  Created by William Boles on 08/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/string-to-integer-atoi/
//overflow
struct StringToInteger {
    static func myAtoi(_ s: String) -> Int {
        var result = 0
        var sign = 1
        var index = 0
        
        let characters = Array(s)
        
        //trim whitespace (NB. this ensures space(s) can only exist at the start of `s`)
        while index < characters.count &&
                characters[index] == " " {
            index += 1
        }
        
        //determine if sign exists (NB. this ensures only one sign can exist)
        if (index < characters.count &&
            (characters[index] == "+" || characters[index] == "-")) {
            if characters[index] == "-" {
                sign = -1
            }
            index += 1
        }
        
        for character in characters[index...] {
            guard var pop = character.wholeNumberValue else {
                break
            }
            
            pop *= sign
            
            if result > (Int32.max / 10) || (result == (Int32.max / 10) && pop > (Int32.max % 10)) {
                result = Int(Int32.max)
                break
            } else if result < Int32.min/10 || (result == (Int32.min / 10) && pop < (Int32.min % 10)) {
                result = Int(Int32.min)
                break
            }
            
            result *= 10
            result += pop
        }
        
        return result
    }
}
