// Created 08/11/2021.

import Foundation

//https://leetcode.com/problems/string-to-integer-atoi/
struct StringToInteger {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(1)
    //string
    //overflow
    //underflow
    //array
    //math
    //
    //Solution Description:
    //Converting from a string an int comes with strict conditions, below we enforce them. First we check for white space at
    //the start of the `s` and increment `index` until we find something that isn't white space. Next we check if the
    //character at `index` is a sign ("+" is optional but should be treated as the default if no sign is present). If it is a
    //"+" or "-" we set `sign` to be either `1` or `-1` respectively. Next we iterate through the rest of `s`. First we check
    //if the current `result` value is outside of our upper limit, if it is we break; if it is not we continue. Next we check
    //if `c` is a number if so we apply the `sign` to `num`; if not we break and return what `result` contains. If both checks
    //pass we multiple `result` by 10 an add `digit`. We repeat this process until we reach the end of `s` or we encounter a
    //non-number `c`. We then apply the sign. If `result` is negative we check that we haven't moved past the lower bounds, if
    //so we return the lower bounds else we return `result`. if `result` is positive we check that we haven't moved past the
    //upper bounds, if so we return the upper bounds else we return `result`.
    func myAtoi(_ s: String) -> Int {
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
            guard result < Int(Int32.max) else {
                break
            }
            
            guard let digit = c.wholeNumberValue else {
                break
            }
            
            result *= 10
            result += digit
        }
        
        result *= sign
        
        if result < 0 {
            return max(result, Int(Int32.min))
        } else {
            return min(result, Int(Int32.max))
        }
    }
}
