//
//  MinimumRemoveToMakeValidParentheses.swift
//  CodingChallenges
//
//  Created by William Boles on 12/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/minimum-remove-to-make-valid-parentheses/
//string
struct MinimumRemoveToMakeValidParentheses {
    
    //Time: O(n)
    //Space: O(n)
    //
    //Solution Description:
    //Make two passes through the string. First pass to remove unpaired closing brackets with the assumption that all opening
    //brackets are paired. Second pass in reverse to remove unpaired opening brackets.
    static func minRemoveToMakeValid(_ s: String) -> String {
        var openingCount = 0
        var forwardS = [Character]()
        
        for c in s {
            if c == ")" {
                if openingCount > 0 {
                    forwardS.append(c)
                    openingCount -= 1
                }
            } else if c == "(" {
                openingCount += 1
                forwardS.append(c)
            } else {
                forwardS.append(c)
            }
        }
        
        var closingCount = 0
        var ans = [Character]()
        
        for c in forwardS.reversed() {
            if c == "(" {
                if closingCount > 0 {
                    ans.append(c)
                    closingCount -= 1
                }
            } else if c == ")" {
                closingCount += 1
                ans.append(c)
            } else {
                ans.append(c)
            }
        }
        
        return String((ans.reversed()))
    }
}