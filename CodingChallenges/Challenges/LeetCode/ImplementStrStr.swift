//
//  ImplementStrStr.swift
//  CodingChallenges
//
//  Created by William Boles on 11/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/implement-strstr/
struct ImplementStrStr {
    
    //Time: O(m + n)
    //KMP
    static func strStr(_ haystack: String, _ needle: String) -> Int {
        guard !needle.isEmpty else {
            return 0
        }
        
        guard haystack.count >= needle.count else {
            return -1
        }
        
        let haystack = Array(haystack)
        let needle = Array(needle)
        
        //Generate failure/pi table
        var failureTable = Array(repeating: 0, count: needle.count)
        var slow = 0

        for fast in 1..<needle.count {
            slow += needle[fast] == needle[slow] ? 1 : -slow
            failureTable[fast] = slow
        }
        
        //Search
        
        var h = 0
        var n = 0
        
        while h + n < haystack.count {
            if haystack[h + n] == needle[n] {
                n += 1
                if n == needle.count {
                    break // found match
                }
            } else {
                let offset = max(0, (n - 1))
                let resetIndex = failureTable[offset]
                n = resetIndex
                h += 1
            }
        }
        
        return (n == needle.count) ? h : -1
    }
    
    //Time: O(m*n)
    //two pointers
    static func strStrBruteForce(_ haystack: String, _ needle: String) -> Int {
        let haystack = Array(haystack)
        let needle = Array(needle)
            
        var h = 0
        var n = 0
        
        while h < haystack.count && n < needle.count {
            if (haystack[h] == needle[n]) {
                n += 1
            } else {
                h -= n
                n = 0
            }
            
            h += 1
        }
        
        return (n == needle.count) ? (h - n) : -1
    }
}
