//
//  DecodeString.swift
//  LeetCode
//
//  Created by William Boles on 15/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/decode-string/
//string
struct DecodeString {
    
    //Time: O((k^m) * n) where k maximum value of encoding, `m` is the number of nested encodings and n is the length of `s`
    //Space: O((k^m) * n)
    //stack
    //array
    //
    //Solution Description:
    //Iterate through `s` and add the values that we find to the `stack` until we find a closing bracket e.g. for 54[ab6[cd]]
    //our stack would be `5, 4, [, a, b, 6, [, c, d`. Once we a closing bracket we pop all the characters from the stack until
    //we find it matching opening bracket i.e. `c, d`. We now have our encoded char array for that bracket pair. We now need to
    //determine how times that encoded char array should be expanded so keep popping from the stack until we have that mulitplier
    //(`k`) i.e. 6. We now decode that char array by pushing it onto the stack `k` times. Repeat this process until all `[` and
    //`]` encoding has been expanded and we have come to the end of our `chars` array.
    static func decodeString(_ s: String) -> String {
        var stack = [Character]()
        for char in s {
            if char == "]" {
                var encodedChars = [Character]()
                
                //find matching opening bracket
                while stack.last != "[" {
                    encodedChars.append(stack.removeLast())
                }
                
                //remove the opening bracket
                stack.removeLast()
                
                //find multiplier (could be more than one digit)
                var k = 0
                var base = 1
                while stack.last?.isNumber ?? false {
                    var num = Int(String(stack.removeLast()))!
                    num *= base
                    
                    k += num
                    base *= 10
                }
                
                //reverse to add into the stack in the original order as if the chars where never encoded
                encodedChars.reverse()
                
                //add multiplied string to stack
                for _ in 0..<k {
                    stack.append(contentsOf: encodedChars)
                }
            } else {
                stack.append(char)
            }
        }
        
        return String(stack)
    }
}
