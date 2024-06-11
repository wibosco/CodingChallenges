//
//  ReverseOnlyLetters.swift
//  LeetCode
//
//  Created by William Boles on 11/06/2024.
//

import Foundation

//https://leetcode.com/problems/reverse-only-letters/
struct ReverseOnlyLetters {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(n)
    //string
    //array
    //two pointers
    //
    //Solution Description:
    //Using two pointers we iterate through `s` - `p1` going left-to-right and `p2` going right-to-left. When the elements at 
    //both pointers are letters we swap them and move both pointers; when the element at `p1` is a letter we only move `p2`
    //to try and find a letter to swap with; when the element at `p2` is a letter we only move `p1` to try and find a letter to
    //swap with; when neither element is a letter we move both pointers. We repeat this process until `p1` crosses `p2` at which
    //point all letters should have swapped.
    func reverseOnlyLetters(_ s: String) -> String {
        var result = Array(s)
        
        var p1 = 0
        var p2 = result.count - 1
        
        while p1 < p2 {
            if result[p1].isLetter && result[p2].isLetter {
                let tmp = result[p1]
                result[p1] = result[p2]
                result[p2] = tmp
            } else if result[p1].isLetter {
                p2 -= 1
                
                continue
            } else if result[p2].isLetter {
                p1 += 1
                
                continue
            }
            
            p1 += 1
            p2 -= 1
        }
        
        return String(result)
    }
}
