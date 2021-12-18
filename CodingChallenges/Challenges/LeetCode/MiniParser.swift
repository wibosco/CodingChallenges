//
//  MiniParser.swift
//  CodingChallenges
//
//  Created by William Boles on 17/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/mini-parser/
//stack
struct MiniParser {
    
    //Time: O(n) where `n` is the number for characters in `s`
    //Space: O(e) where `e` is the number of `NestedInteger`s in the stack
    //
    //Solution Description:
    //Iterate through `s` using two stacks - `num` and `stack`. `NestedInteger` list instances are created whenever we
    //encounter a `[` and added to the  it's immediate parent instance accessing the last element in the stack (if there
    //is one). When we encounter a "]" or "," we take what is in `num` (if it contains anything) and create an
    //`NestedInteger` value instance from it, which is then added to the last element in the stack. Finally if the stack
    //is every empty then we have reached the processable data and can return that last `NestedInteger` instance.
    static func deserialize(_ s: String) -> NestedInteger {
        guard s[s.startIndex] == "[" else {
            let ni = NestedInteger()
            ni.setInteger(Int(s)!)
            
            return ni
        }
        
        var stack = [NestedInteger]()
        var num = ""
        
        var head: NestedInteger!
        
        for c in s {
            if c == "[" {
                let ni = NestedInteger()
                stack.last?.add(ni)
                
                stack.append(ni)
            } else if c == "]" {
                if let val = Int(num) {
                    let ni = NestedInteger()
                    ni.setInteger(val)
                    
                    stack.last?.add(ni)
                    
                    num = ""
                }
                
                head = stack.removeLast()
            } else if c == "," {
                if let val = Int(num) {
                    let ni = NestedInteger()
                    ni.setInteger(val)
                    
                    stack.last?.add(ni)
                    
                    num = ""
                }
            } else {
                num += String(c)
            }
        }
        
        return head
    }
}
