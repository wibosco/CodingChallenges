//
//  MinimumNumberOfSwapsToMakeTheStringBalanced.swift
//  LeetCode
//
//  Created by William Boles on 17/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation
import CoreText

//https://leetcode.com/problems/minimum-number-of-swaps-to-make-the-string-balanced/
struct MinimumNumberOfSwapsToMakeTheStringBalanced {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(n)
    //string
    //stack
    //
    //Solution Description:
    //Moving linearly through `s` we add each mismatched bracket to the stack. Where we come across a closing bracket we
    //check if the last element in the stack is an opening bracket. If it is we remove it from the stack as it isn't
    //mismatched; if it isn't we add it to the stack. Once we have reached the end of `s` our stack will contain all the
    //mismatched brackets - both `[` and `]`. In order to match a pair of brackets we only need to move one bracket so we
    //can half the stack count. Dor every swap we solve not one but two mismatched brackets so we again divide the count
    //by 2. We add 1 to ensure that we et the correct answer for both odd and even counts.
    func minSwaps(_ s: String) -> Int {
        var stack = [Character]()
        
        for c in s {
            if c == "]" {
                if let last = stack.last {
                    if last == "[" {
                        stack.removeLast()
                        continue
                    }
                }
            }
            
            stack.append(c)
        }
        
        //`(stack.count / 2)` - stack contains both `[` and `]` but only interested in `]`
        //`+ 1` - to balance out dividing an odd number by 2
        //`/ 2` - swapping one bracket solves two problems
        let min =  ((stack.count / 2) + 1) / 2
        
        return min
    }
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(1)
    //string
    //counting
    //
    //Solution Description:
    //Moving linearly through `s` track any mismatched (without an opening bracket) closing bracket we encounter as these
    //will need to be swapped with a mismatched opening bracket inorder for `s` to be balanced - as `s` is guaranteed to
    //have the same number of `[` as `]`, we can't just track the mismatched `]` as this will also reduce down to 0 instead
    //we need to track what it was at it's maximum. Once we know the maximum we know that for every swap we solve not one
    //but two mismatched brackets so we divide the max by 2. We add 1 to ensure that we get the correct answer for both odd
    //and even maxes.
    func minSwapsCounting(_ s: String) -> Int {
        var currentExtraClosing = 0
        var maxExtraClosing = 0
        
        for c in s {
            if c == "]" {
                currentExtraClosing += 1
                maxExtraClosing = max(maxExtraClosing, currentExtraClosing)
            } else {
                currentExtraClosing -= 1
            }
        }
        
        let min = (maxExtraClosing + 1) / 2
        
        return min
    }
}
