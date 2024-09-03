//
//  OneEditDistance.swift
//  LeetCode
//
//  Created by William Boles on 03/09/2024.
//

import Foundation

//https://leetcode.com/problems/one-edit-distance/
struct OneEditDistance {
    
    //Time: O(max(n, m)) where n is the number of characters in `s`
    //                   where m is the number of characterts in `t`
    //Space: O(n + m)
    //string
    //array
    //two pointers
    //counting
    //
    //Solution Description:
    //As we can make only make 1 edit (add, remove or replace) we need to ensure that `s` and `t` have a length that is within
    //1 change from each other and that they are not currently equal. Using two pointer we then iterate through `s` and `t`
    //and where we encounter a difference in values we increment `editCount` and increment either `p1` or `p2` to virtually
    //apply an edit. Once all elements have been compared we return true or false depending on the number of edits made.
    //
    //N.B. The return is `editCount < 2` rather than `editCount == 1` which at first might be more correct however it is valid
    //for `s` or `t` to be an empty string while the other contains 1 character, this would result in the while loop never
    //executing despite the fact that one edit would make them equal so to avoid having to handle this either in the loop or
    //directly after we have `editCount < 2`.
    func isOneEditDistance(_ s: String, _ t: String) -> Bool {
        guard abs(s.count - t.count) <= 1 else {
            return false
        }
        
        guard s != t else {
            return false
        }
        
        var p1 = 0
        var p2 = 0
        
        let s = Array(s)
        let t = Array(t)
        
        var editCount = 0
        
        while p1 < s.count && p2 < t.count {
            if s[p1] != t[p2] {
                editCount += 1
                
                if s.count == t.count {
                    //replace character
                    p1 += 1
                    p2 += 1
                } else if s.count > t.count {
                    //remove a character from s
                    p1 += 1
                } else {
                    //add a character to s
                    p2 += 1
                }
            } else {
                p1 += 1
                p2 += 1
            }
        }
        
        return editCount < 2 //no need to check it's above 1 as the guard at the start already ensures there is at least one adjustment
    }
}
